/* eslint-disable no-unused-vars */
const { NormalUser } = require('../models');

async function getNormalUserDetails(req, res) {
  const { id } = req.params;
  try {
    const normalUser = await NormalUser.findByPk(id);

    if (!normalUser) {
      return res.status(404).json({ error: 'Normal user not found' });
    } else {
      return res.json(normalUser);
    }
  } catch (error) {
    return res.status(500).json({ error: 'Internal server error' });
  }
}

async function deleteNormalUser(req, res) {
  const { id } = req.params;
  try {
    const normalUser = await NormalUser.findByPk(id);
    await normalUser.destroy();

    if (!normalUser) {
      return res.status(404).json({ error: 'Normal user not found' });
    } else {
      return res.status(200).json({ msg: 'successfully deleted' });
    }
  } catch (error) {
    return res.status(500).json({ error: 'Internal server error' });
  }
}

async function updateNormalUserImage(req, res) {
  const { id } = req.params;
  const normalUser = await NormalUser.findByPk(id);
  if (!normalUser) {
    return res.status(404).json({ error: 'Normal user not found' });
  } else {
    const { image } = req.body;
    try {
      await normalUser.update({ image });
      return res.json(normalUser);
    } catch (error) {
      return res.status(500).json({ error: 'Internal server error' });
    }
  }
}

module.exports = {
  getNormalUserDetails,
  deleteNormalUser,
  updateNormalUserImage,
};
