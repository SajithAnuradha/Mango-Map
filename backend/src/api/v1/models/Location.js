module.exports = (sequelize, DataTypes) => {
  const Location = sequelize.define('Location', {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    type: {
      type: DataTypes.STRING(50),
      allowNull: false,
    },
    latitude: {
      type: DataTypes.DECIMAL(10, 8),
      allowNull: false,
      validate: {
        notNull: {
          msg: 'Latitude cannot be null',
        },
      },
    },
    longitude: {
      type: DataTypes.DECIMAL(11, 8),
      allowNull: false,
      validate: {
        notNull: {
          msg: 'Longitude cannot be null',
        },
      },
    },
    google_place_id: {
      type: DataTypes.STRING(255),
      allowNull: false,
      validate: {
        notNull: {
          msg: 'Google Place ID cannot be null',
        },
      },
    },
    formatted_address: {
      type: DataTypes.TEXT,
      allowNull: true,
    },
    city: {
      type: DataTypes.STRING(255),
      allowNull: true,
    },
    state: {
      type: DataTypes.STRING(255),
      allowNull: true,
    },
    country: {
      type: DataTypes.STRING(255),
      allowNull: true,
    },
    postal_code: {
      type: DataTypes.STRING(255),
      allowNull: true,
    },
    additional_info: {
      type: DataTypes.JSON,
      allowNull: true,
    },
  });

  // associations with the other models
  Location.associate = (models) => {
    // a location has one business profile (1:1 relationship)
    Location.hasOne(models.BusinessProfile, {
      foreignKey: 'location_id',
    });

    // a location has many location based images (1:M relationship)
    Location.hasMany(models.LocationBasedImage, {
      foreignKey: 'location_id',
    });
  };

  return Location;
};
