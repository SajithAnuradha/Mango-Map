module.exports = (sequelize, DataTypes) => {
  const UserAuth = sequelize.define('UserAuth', {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    email: {
      type: DataTypes.STRING(255),
      allowNull: false,
      validate: {
        notNull: {
          msg: 'Email cannot be null',
        },
      },
    },
    password: {
      type: DataTypes.STRING(1024),
      allowNull: false,
      validate: {
        notNull: {
          msg: 'Password cannot be null',
        },
      },
    },
    normal_user_id: {
      type: DataTypes.INTEGER,
      allowNull: true,
      reference: {
        model: 'NormalUser',
        key: 'id',
      },
    },
    business_user_id: {
      type: DataTypes.INTEGER,
      allowNull: true,
      reference: {
        model: 'BusinessUser',
        key: 'id',
      },
    },
    type: {
      type: DataTypes.ENUM('normal', 'business'),
      allowNull: false,
      validate: {
        notNull: {
          msg: 'Type cannot be null',
        },
        isIn: {
          args: [['normal', 'business']],
          msg: 'Type must be either normal or business',
        },
      },
    },
  });

  // associations with the other models
  UserAuth.associate = (models) => {
    // a user auth belongs to a normal user (1:M relationship)
    UserAuth.belongsTo(models.NormalUser, {
      foreignKey: 'normal_user_id',
    });

    // a user auth belongs to a business user (1:M relationship)
    UserAuth.belongsTo(models.BusinessUser, {
      foreignKey: 'business_user_id',
    });
  };

  return UserAuth;
};
