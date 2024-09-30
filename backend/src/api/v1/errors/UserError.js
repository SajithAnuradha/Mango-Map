class UserError extends Error {
  constructor(message, status) {
    super(message);
    this.status = status;
  }
}

class UserAlreadyExistsError extends UserError {
  constructor(message) {
    super(message, 404);
  }
}

module.exports = {
  UserError,
  UserAlreadyExistsError,
};
