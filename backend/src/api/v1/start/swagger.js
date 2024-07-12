const swaggerUi = require('swagger-ui-express');
const swaggerJsDoc = require('swagger-jsdoc');

// Swagger definition
const swaggerDefinitions = {
  openapi: '3.0.0',
  info: {
    title: 'API Documentation',
    version: '1.0.0',
    description: 'This is a simple API documentation',
  },
};

// Options for the swagger docs
const options = {
  // Import swaggerDefinitions
  swaggerDefinition: swaggerDefinitions,
  // Paths to files containing OpenAPI definitions
  apis: ['./src/api/v1/routes/*.js', './src/api/v1/controllers/*.js'],
};

const swaggerSpec = swaggerJsDoc(options);

module.exports = (app) => {
  app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerSpec));
};
