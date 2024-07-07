module.exports = (sequelize, DataTypes) => {
  const BusinessPhoto = sequelize.define('BusinessPhoto', {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    review_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      validate: {
        notNull: {
          msg: 'Review ID cannot be null',
        },
      },
      reference: {
        model: 'BusinessReview',
        key: 'id',
      },
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
  });

  // associations with the other models
  BusinessPhoto.associate = (models) => {
    // a business photo belongs to a business review (1:M relationship)
    BusinessPhoto.belongsTo(models.BusinessReview, {
      foreignKey: 'review_id',
    });

    // a business photo has many likes (1:M relationship)
    BusinessPhoto.hasMany(models.BusinessPhotoLike, {
      foreignKey: 'photo_id',
      onDelete: 'CASCADE',
    });
  };

  return BusinessPhoto;
};
