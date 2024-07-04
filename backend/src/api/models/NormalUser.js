module.exports = (sequelize, DataTypes) => {
  const NormalUser = sequelize.define('NormalUser', {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    first_name: {
      type: DataTypes.STRING(50),
      allowNull: false,
      validate: {
        notNull: {
          msg: 'First name cannot be null',
        },
      },
    },
    last_name: {
      type: DataTypes.STRING(50),
      allowNull: false,
      validate: {
        notNull: {
          msg: 'Last name cannot be null',
        },
      },
    },
    birthday: {
      type: DataTypes.DATE,
      allowNull: false,
      validate: {
        notNull: {
          msg: 'Birthday cannot be null',
        },
        isBefore: {
          args: new Date().toISOString(),
          msg: 'Birthday must be before today',
        },
      },
    },

    profile_image: {
      type: DataTypes.STRING(512),
      allowNull: true,
      defaultValue: null,
      validate: {
        isUrl: {
          msg: 'Profile image must be a valid URL',
        },
      },
    },
  });

  // associations with the other models
  NormalUser.associate = (models) => {
    // a normal user has one user auth (1:1 relationship)
    NormalUser.hasOne(models.UserAuth, {
      foreignKey: 'normal_user_id',
      onDelete: 'CASCADE',
    });

    // a normal user has many business reviews (1:M relationship)
    NormalUser.hasMany(models.BusinessReview, {
      foreignKey: 'user_id',
      onDelete: 'CASCADE',
    });

    // a normal user has many location based images (1:M relationship)
    NormalUser.hasMany(models.LocationBasedImage, {
      foreignKey: 'user_id',
      onDelete: 'CASCADE',
    });

    // a normal user has many business photo likes (1:M relationship)
    NormalUser.hasMany(models.BusinessPhotoLike, {
      foreignKey: 'user_id',
      onDelete: 'CASCADE',
    });

    // a normal user has many location based image likes (1:M relationship)
    NormalUser.hasMany(models.LocationBasedImageLike, {
      foreignKey: 'user_id',
      onDelete: 'CASCADE',
    });

    // a normal user has many business chat (1:M relationship)
    NormalUser.hasMany(models.BusinessChat, {
      foreignKey: 'user_id',
      onDelete: 'CASCADE',
    });
  };

  return NormalUser;
};
