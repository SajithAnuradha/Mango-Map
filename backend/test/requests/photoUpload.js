const axios = require('axios');
const FormData = require('form-data');
const fs = require('fs');

// Define the URL to which the POST request will be sent
const url = 'http://localhost:8888/api/v1/location';

// Define the file to be uploaded
const filePath = 'C:\\Users\\User\\Downloads\\Patric.png';

// Create a new FormData instance
const form = new FormData();

// Append the file to the form data
form.append('file', fs.createReadStream(filePath));

// Append JSON data to the form data
form.append('location_id', 1);
form.append('user_id', 1);
form.append('review', 'This is a review of the location');

console.log(3);
console.log(form.getHeaders());

// Send the POST request with the form data
axios
  .post(url, form, {
    headers: {
      ...form.getHeaders(),
    },
  })
  .then((response) => {
    console.log(`Status Code: ${response.status}`);
    console.log(`Response: ${response.data}`);
  })
  .catch((error) => {
    console.error(`Error: ${error}`);
    console.error(error.stack);
  });
