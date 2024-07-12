function getPaginationParameters(req) {
  const page = parseInt(req.query.page) || 1;
  const limit = parseInt(req.query.limit) || 20;

  return {
    page,
    limit,
  };
}

module.exports = {
  getPaginationParameters,
};
