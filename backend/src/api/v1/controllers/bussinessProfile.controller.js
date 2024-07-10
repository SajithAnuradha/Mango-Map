const {getBusinessProfile} = require('../services/businessProfileTable');

/**
 * @swagger
 * /api/v1/businessProfile:
 *  get:
 *    summary: Get a business profile
 *    description: Get a business profile with the provided id
 *    tags:
 *      - BusinessProfile
 *    parameters:
 *      - in: query
 *        name: business_profile_id
 *        schema:
 *          type: integer
 *        required: true
 *        description: The id of the business profile to get
 *    responses:
 *      '200':
 *        description: Successful get
 *        content:
 *          application/json:
 *            schema:
 *              type: object
 *              properties:
 *                message:
 *                  type: string
 *                  example: Welcome to the backend!
 *      '400':
 *        description: Bad request
 *        content:
 *          application/json:
 *            schema:
 *              type: object
 *              properties:
 *                error:
 *                  type: string
 *                  example: Business Profile not found
 */

async function BusinessProfileHandler(req, res) {

    try {
        const id = req.query.id;  
        const businessProfile = await getBusinessProfile(req.query.id);
    if (!businessProfile) {
        return res.status(400).json({ error: 'Business Profile not found' });
    }
    res.json(businessProfile);
        
    } catch (error) {
        console.error('Error in BusinessProfileHandler:', error);
        return res.status(500).json({ error: 'Internal Server Error' });
    }
    
}

module.exports = {
    BusinessProfileHandler
};