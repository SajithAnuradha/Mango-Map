const {Location, LocationBasedImage} = require('../models');

async function getLocation(location_id){

    try {
        const location = await Location.findOne({
            where: {
                id: location_id,
            },
        });
    
        const locationBasedImages = await LocationBasedImage.findAll({
            where: {
                location_id: location_id,
            },
        });
    
        return {location, locationBasedImages};
        
    } catch (error) {
        throw new Error('Error getting location');
    }
}

module.exports = {
    getLocation,
};

