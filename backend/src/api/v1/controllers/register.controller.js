function registerNormalUser(req, res) {
  res.json({ message: 'Register normal user' });
}

function registerBusinessUser(req, res) {
  res.json({ message: 'Register business user' });
}

module.exports = {
  registerNormalUser,
  registerBusinessUser,
};
