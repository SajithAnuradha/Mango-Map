# /config/config.json

# This is the real config file that contains the actual database configuration.
# It should be used in production environments.
real_config = {
    'host': 'localhost',
    'port': 5432,
    'username': 'admin',
    'password': 'password',
    'database': 'mydb'
}

# /config/config.template.json

# This is the template config file that serves as a blueprint for the real config file.
# It contains default values and placeholders that need to be replaced with actual values.
# It should be used as a starting point when setting up a new environment.
template_config = {
    'host': 'localhost',
    'port': 5432,
    'username': 'your_username',
    'password': 'your_password',
    'database': 'your_database'
}
