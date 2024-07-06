const { Promotion } = require('../models');

async function postPromotion(data) {
  // create a new promotionn
  const newpromotion = await Promotion.create({
    title : data.title,
    description : data.description,
    business_profile_id : data.business_profile_id,
    normal_user_id : data.normal_user_id,
  });

  return newpromotion;
}

module.exports = {
  postPromotion,
};