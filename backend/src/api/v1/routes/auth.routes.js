const express = require('express');

const {
  userLoginHandler,
  userPasswordChangeHandler,
} = require('../controllers/auth.controller');
const { authorize } = require('../middlewares/auth');

const router = express.Router();

router.post('/login', userLoginHandler);
router.put('/change-pass', authorize, userPasswordChangeHandler);

module.exports = router;
