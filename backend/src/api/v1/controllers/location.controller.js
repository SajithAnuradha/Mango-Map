const {LocationBasedImage}=require('../models');
const {LocationBasedImageLike}=require('../models');
const { uploadFileToBlob } = require('../util/azurePhotoUpload');
const { Sequelize, Op } = require('sequelize');

//This is working
async function getimages (req,res){
    try {
       
        const images=await LocationBasedImage.findAll();
        res.status(200).json(images);
        
    } catch (error) {
        res.status(500).json({error:error.message});
        console.log(error)
        
    }
}
//have to check
async function uploadimages (req,res){
    console.log(req.body);

    try {
        const {file,location_id,user_id,review}=req.body;
        console.log(location_id);
        const url=await uploadFileToBlob(file);
        const image=await LocationBasedImage.create({
            photo:url,
            location_id: location_id,
            user_id: user_id,
            review:review

        });
        res.status(201).json(image);
        
    } catch (error) {
        res.status(500).json({error:error.message});
        
    }


    
}




async function getTrendingImages (req,res){
    try {
        const { location_id } = req.body;
    
        // Fetch all images for the given location_id
        const images = await LocationBasedImage.findAll({
          where: { location_id },
          include: [
            {
              model: LocationBasedImageLike,
              attributes: ['id'],
            }
          ]
        });
    
        // Calculate the number of likes for each image
        const imagesWithLikeCount = images.map(image => ({
          ...image.toJSON(),
          likeCount: image.LocationBasedImageLikes.length
        }));
    
        // Sort images by likeCount in descending order
        imagesWithLikeCount.sort((a, b) => b.likeCount - a.likeCount);
    
        res.status(200).json(imagesWithLikeCount);
      } catch (error) {
        res.status(500).json({ error: error.message });
        console.error(error);
      }
}


async function getimage (req,res){
    try {
        const {id}=req.params;
        const image=await LocationBasedImage.findByPk(id);
        if (!image){
            res.status(404).json({error:"Image not found"});
        }
        res.status(200).json(image);
        
    } catch (error) {
        res.status(500).json({error:error.message});
        
    }

}



async function deleteimage (req,res){
    try {
        
        const {id}=req.params;
        const image=await LocationBasedImage.findByPk(id);
        if (!image){
            res.status(404).json({error:"Image not found"});
        }
        await image.destroy();
        res.status(204).json();
        
    } catch (error) {
        res.status(500).json({error:error.message});
        
    }

}

async function likeimage (req,res){
    try {
        const {image_id,user_id}=req.body;
        if (!image_id || !user_id){
            res.status(400).json({error:"Missing required fields"});
        }

        const like=await LocationBasedImageLike.create({image_id,user_id});
        res.status(201).json(like);
        
    } catch (error) {
        res.status(500).json({error:error.message});
        
    }


}


async function unlikeimage (req,res){
    
    try {
        const {image_id,user_id}=req.body;
        if (!image_id|| !user_id){
            res.status(400).json({error:"Missing required fields"});

        }
        const like=await LocationBasedImageLike.findOne({where:{image_id,user_id}});
        if (!like){
            res.status(404).json({error:"Like not found"});
        }
        await like.destroy();
        res.status(204).json();


        
    } catch (error) {
        res.status(500).json({error:error.message});
        
    }

}

async function alltrendingimages(req, res) {
    console.log("working");
    try {
      // Step 1: Get the top 10 image IDs with the most likes
      const topLikedImages = await LocationBasedImageLike.findAll({
        attributes: [
          'image_id',
          [Sequelize.fn('COUNT', Sequelize.col('image_id')), 'like_count']
        ],
        group: ['image_id'],
        order: [[Sequelize.literal('like_count'), 'DESC']],
        limit: 10,
        raw: true
      });
  
      const topImageIds = topLikedImages.map(image => image.image_id);
  
      // Step 2: Get the location_id for these top images
      const imagesWithLocations = await LocationBasedImage.findAll({
        attributes: ['id', 'location_id'],
        where: {
          id: topImageIds
        },
        raw: true
      });
  
      res.status(200).json(imagesWithLocations);
    } catch (error) {
      console.error(error);
      res.status(500).json({ error: error.message });
    }
  }


module.exports = {  uploadimages, getimages, getTrendingImages, getimage, deleteimage, likeimage, unlikeimage,alltrendingimages }