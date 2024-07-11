require('dotenv').config();
const fs = require('fs');
const { uploadFileToBlob } = require('../src/api/v1/util/azurePhotoUpload');
// read the .env file

function uploadPhoto(filePath) {
  // check whether the file exits
  if (!fs.existsSync(filePath)) {
    return { error: 'File not found' };
  }

  // read the specified file from the file system
  fs.readFile(filePath, async (err, data) => {
    if (err) {
      return { error: 'Error reading the file' };
    }

    // else get the file data as a byte strea, and upload to the azure storage account
    const fileData = Buffer.from(data);
    // get the file size
    const size = fileData.length;
    // get the file name
    const fileName = filePath.split('\\').pop();
    const payload = {
      buffer: fileData,
      name: fileName,
      size,
    };
    console.log('started to upload the file');
    const url = await uploadFileToBlob(payload);
    console.log('file uploaded successfully');
    console.log(url);
    return url;
  });
} // run the function with a file path
uploadPhoto('C:\\Users\\User\\Downloads\\network-cyberproject.drawio.pdf');
