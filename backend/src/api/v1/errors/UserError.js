module.exports = class UserError extends Error {
  constructor(message, status) {
    super(message);
    this.status = status;
  }
};
