module.exports = (sequelize, DataTypes) => {
  const BusinessReview = sequelize.define('BusinessReview', {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    profile_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      validate: {
        notNull: {
          msg: 'Profile ID cannot be null',
        },
      },
      reference: {
        model: 'BusinessProfile',
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
    content: {
      type: DataTypes.STRING(1024),
      allowNull: true,
    },
    rating: {
      type: DataTypes.INTEGER,
      allowNull: true,
      validate: {
        isInt: {
          msg: 'Rating must be an integer',
        },
        min: {
          args: 0,
          msg: 'Rating must be at least 0',
        },
        max: {
          args: 5,
          msg: 'Rating must be at most 5',
        },
      },
    },
  });

  // associations with the other models
  BusinessReview.associate = (models) => {
    // a business review belongs to a business profile (1:M relationship)
    BusinessReview.belongsTo(models.BusinessProfile, {
      foreignKey: 'profile_id',
    });

    // a business review belongs to a normal user (1:M relationship)
    BusinessReview.belongsTo(models.NormalUser, {
      foreignKey: 'user_id',
    });

    // a business review has many photos (1:M relationship)
    BusinessReview.hasMany(models.BusinessPhoto, {
      foreignKey: 'review_id',
      onDelete: 'CASCADE',
    });
  };

  return BusinessReview;
};
