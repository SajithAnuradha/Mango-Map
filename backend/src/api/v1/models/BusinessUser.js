module.exports = (sequelize, DataTypes) => {
  const BusinessUser = sequelize.define('BusinessUser', {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    business_name: {
      type: DataTypes.STRING(255),
      allowNull: false,
      validate: {
        notNull: {
          msg: 'Business name cannot be null',
        },
      },
    },
    location: {
      type: DataTypes.STRING(255),
      allowNull: false,
      validate: {
        notNull: {
          msg: 'Location cannot be null',
        },
      },
    },
    profile_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      validate: {
        notNull: {
          msg: 'Profile ID cannot be null',
        },
      },
    },
  });

  // associations with the other models
  BusinessUser.associate = (models) => {
    // a business user has one business profile (1:1 relationship)
    BusinessUser.belongsTo(models.BusinessProfile, {
      foreignKey: 'user_id',
    });

    // a business user has one user auth (1:1 relationship)
    BusinessUser.hasOne(models.UserAuth, {
      foreignKey: 'business_user_id',
    });
  };

  return BusinessUser;
};
