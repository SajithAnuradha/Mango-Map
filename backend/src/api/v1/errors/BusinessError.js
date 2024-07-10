module.exports = class BusinessError extends Error {
  constructor(message, status = 400) {
    super(message);
    this.name = 'BusinessError';
    this.status = status;
  }

  getStatusCode() {
    return this.status;
  }
};
