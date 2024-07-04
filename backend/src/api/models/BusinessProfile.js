module.exports = (sequelize, DataTypes) => {
  const BusinessProfile = sequelize.define('BusinessProfile', {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    profile_name: {
      type: DataTypes.STRING(255),
      allowNull: false,
      validate: {
        notNull: {
          msg: 'Profile name cannot be null',
        },
      },
    },
    description: {
      type: DataTypes.STRING(255),
      allowNull: false,
      validate: {
        notNull: {
          msg: 'Description cannot be null',
        },
      },
    },
    profile_token: {
      type: DataTypes.STRING(1024),
      allowNull: false,
      validate: {
        notNull: {
          msg: 'Profile token cannot be null',
        },
      },
    },
    otp: {
      type: DataTypes.INTEGER,
      allowNull: false,
      validate: {
        notNull: {
          msg: 'OTP cannot be null',
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
    },
  });

  // associations with the other models
  BusinessProfile.associate = (models) => {
    // a business profile belongs to a business location (1:M relationship)
    BusinessProfile.belongsTo(models.Location, {
      foreignKey: 'location_id',
    });

    // a business profile has many reviews (1:M relationship)
    BusinessProfile.hasMany(models.BusinessReview, {
      foreignKey: 'profile_id',
      onDelete: 'CASCADE',
    });

    // a business profile has many chats (1:M relationship)
    BusinessProfile.hasMany(models.BusinessChat, {
      foreignKey: 'profile_id',
      onDelete: 'CASCADE',
    });
  };

  return BusinessProfile;
};
