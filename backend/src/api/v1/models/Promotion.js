module.exports = (sequelize, DataTypes) => {
  const Promotion = sequelize.define('Promotion', {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    title: {
      type: DataTypes.STRING(255),
      allowNull: false,
      validate: {
        notNull: {
          msg: 'Title cannot be null',
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
    business_profile_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      validate: {
        notNull: {
          msg: 'Business profile ID cannot be null',
        },
      },
      reference: {
        model: 'BusinessProfile',
        key: 'id',
      },
    },
    normal_user_id: {
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
  });

  // associations with the other models
  Promotion.associate = (models) => {
    // a promotion belongs to a business profile (1:M relationship)
    Promotion.belongsTo(models.BusinessProfile, {
      foreignKey: 'business_profile_id',
    });
    // a promotion belongs to a normal user (1:M relationship)
    Promotion.belongsTo(models.NormalUser, {
      foreignKey: 'user_id',
    });
  };

  return Promotion;
};
