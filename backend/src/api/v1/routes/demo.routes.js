/**
 * @For Sajith Anuradha
 * Demo Only
 */

const multer = require('multer');
const express = require('express');
const { uploadFileToBlob } = require('../util/azurePhotoUpload');

const fileUpload = multer();

const router = express.Router();

router.post('/upload', fileUpload.single('file'), async (req, res) => {
  console.log(req.file); // file can access from req.file
  const file = req.file;

  const url = await uploadFileToBlob(file); // upload file to azure blob storage
  console.log(url);
  res.send('File uploaded');
});
