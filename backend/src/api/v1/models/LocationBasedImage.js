module.exports = (sequelize, DataTypes) => {
  const LocationBasedImage = sequelize.define('LocationBasedImage', {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    photo: {
      type: DataTypes.STRING(512),
      allowNull: false,
      validate: {
        notNull: {
          msg: 'Photo cannot be null',
        },
        isUrl: {
          msg: 'Photo must be a valid URL',
        },
      },
    },
    location_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      validate: {
        notNull: {
          msg: 'Location ID cannot be null',
        },
      },
      reference: {
        model: 'Location',
        key: 'id',
      },
    },
    user_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      validate: {
        notNull: {
          msg: 'User ID cannot be null',
        },
      },
      reference: {
        model: 'NormalUser',
        key: 'id',
      },
    },
    review: {
      type: DataTypes.STRING(512),
      allowNull: true,
    },
  });

  // associations with the other models
  LocationBasedImage.associate = (models) => {
    // a location based image belongs to a location (1:M relationship)
    LocationBasedImage.belongsTo(models.Location, {
      foreignKey: 'location_id',
    });

    // a location based image belongs to a normal user (1:M relationship)
    LocationBasedImage.belongsTo(models.NormalUser, {
      foreignKey: 'user_id',
    });

    // a location based image has many likes (1:M relationship)
    LocationBasedImage.hasMany(models.LocationBasedImageLike, {
      foreignKey: 'image_id',
      onDelete: 'CASCADE',
    });
  };

  return LocationBasedImage;
};
