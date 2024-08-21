module.exports = class APIError extends Error {
  constructor(message, status) {
    super(message);
    this.status = status;
  }
};
