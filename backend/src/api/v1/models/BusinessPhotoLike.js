module.exports = (sequelize, DataTypes) => {
  const BusinessPhotoLike = sequelize.define("BusinessPhotoLike", {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    photo_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      validate: {
        notNull: {
          msg: "Photo ID cannot be null",
        },
      },
      reference: {
        model: "BusinessPhoto",
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
    },
  });

  // associations with the other models
  BusinessPhotoLike.associate = (models) => {
    // a business photo like belongs to a business photo (1:M relationship)
    BusinessPhotoLike.belongsTo(models.BusinessPhoto, {
      foreignKey: "photo_id",
    });

    // a business photo like belongs to a business user (1:M relationship)
    BusinessPhotoLike.belongsTo(models.NormalUser, {
      foreignKey: "user_id",
    });
  };

  return BusinessPhotoLike;
};
