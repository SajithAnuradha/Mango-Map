const {BusinessProfile} = require('../models');

async function getBusinessProfile (business_profile_id){

    try {

        const newBusinessProfile = await BusinessProfile.findOne({
            where: {
                id: business_profile_id,
            },
        });
        return newBusinessProfile;
        
    } catch (error) {
        console.error('Error in getBusinessProfile:', error);
        return null;
    }  
}

module.exports = {
    getBusinessProfile
};