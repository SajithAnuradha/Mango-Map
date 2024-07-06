const {getLocation} = require('../services/locationTable');

/**
 * @swagger
 * /api/v1/location:
 *  get:
 *   summary: Get a location
 *  description: Get a location with the provided id
 * tags:
 *  - Location
 * parameters:
 * - in: query
 *  name: location_id
 * schema:
 * type: integer
 * required: true
 * description: The id of the location to get
 * responses:
 * 200:
 * description: Successful get
 * content:
 * application/json:
 * 400:
 * description: Bad request
 * content:
 * application/json:
 */

async function LocationHandler(req, res) {
    try {
      const { location, locationBasedImages } = await getLocation(req.query.location_id);
      if (!location) {
        return res.status(400).json({ error: 'Location not found' });
      }
      res.json({ location, locationBasedImages });
    } catch (error) {
      res.status(400).json({ error: error.message });
    }
  }


module.exports = {
    LocationHandler,
};