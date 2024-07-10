const express = require('express');

const {
  userLoginHandler,
  userPasswordChangeHandler,
} = require('../controllers/auth.controller');

const router = express.Router();

router.post('/login', userLoginHandler);
router.put('/change-pass', userPasswordChangeHandler);

module.exports = router;
