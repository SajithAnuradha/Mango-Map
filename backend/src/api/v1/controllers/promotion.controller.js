const { postPromotion } = require('../services/promotionUserTable');
const { validatePromotion } = require('../validations/promotion.validation');

/**
 * @swagger
 * api/v1/promotion/id/business/id:
 *   post:
 *     summary: Post Promotion
 *     description: Post a new promotion with the provided details
 *     tags:
 *       - Promotion
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *     responses:
 *       200:
 *         description: Post Promotion
 *         content:
 *           application/json:
 *
 *       400:
 *         description: Bad request
 *         content:
 *           application/json:
 *
 */
async function postPromotionUserHandler(req, res) {
  // parse the body of the request through the validation
  const { error } = validatePromotion(req.body);
  if (error) {
    return res.status(400).json({ error: error.details[0].message });
  }

  // parse the request body data to post the promotion
  const promotion = await postPromotion(req.body);

  // return the promotion id as the response
  res.json({ id: promotion.id });
}

module.exports = {
  postPromotionUserHandler,
};
