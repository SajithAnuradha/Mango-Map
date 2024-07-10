const { Promotion, UserAuth, BusinessUser } = require('../models');

async function postPromotion(data) {
  // create a new promotionn

  const user = await UserAuth.findOne({
    where: {
      username: data.username,
    },
  });

  const businessUser = await BusinessUser.findOne({
    where: {
      id: user.business_user_id,
    },
  });

  try {
    const newpromotion = await Promotion.create({
      title: data.title,
      description: data.description,
      business_profile_id: businessUser.profile_id,
      user_id: data.user_id,
    });

    return newpromotion;
    
  } catch (error) {
    console.log(error);
  }
}

module.exports = {
  postPromotion,
};
