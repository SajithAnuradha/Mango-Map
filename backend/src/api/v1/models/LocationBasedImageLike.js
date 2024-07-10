module.exports = (sequelize, DataTypes) => {
  const LocationBasedImageLike = sequelize.define("LocationBasedImageLike", {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    image_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      validate: {
        notNull: {
          msg: "Image ID cannot be null",
        },
      },
      reference: {
        model: "LocationBasedImage",
        key: "id",
      },
    },
    user_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      validate: {
        notNull: {
          msg: "User ID cannot be null",
        },
      },
      reference: {
        model: "NormalUser",
        key: "id",
      },
    },
  });

  // associations with the other models
  LocationBasedImageLike.associate = (models) => {
    // a location based image like belongs to a location based image (1:M relationship)
    LocationBasedImageLike.belongsTo(models.LocationBasedImage, {
      foreignKey: "image_id",
    });

    // a location based image like belongs to a normal user (1:M relationship)
    LocationBasedImageLike.belongsTo(models.NormalUser, {
      foreignKey: "user_id",
    });
  };

  return LocationBasedImageLike;
};
