function globalErrorHandler(err, req, res) {
  if (err) {
    console.error(err.stack);
    // determine the status code of the error if error has one
    const statusCode = err.status || 500;
    // send the response
    res.status(statusCode).json({
      error: {
        message: err.message,
        status: statusCode,
        timestamp: new Date().toISOString(),
      },
    });
  }
}

module.exports = {
  globalErrorHandler,
};
