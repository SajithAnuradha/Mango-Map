module.exports = (sequelize, DataTypes) => {
  const Notification = sequelize.define('Notification', {
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
      type: DataTypes.STRING(1000),
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
  });

  // Associations with other models
  Notification.associate = (models) => {
    // A notification belongs to a normal user (1:M relationship)
    Notification.belongsTo(models.NormalUser, {
      foreignKey: 'user_id',
    });

    // A notification belongs to a business profile (1:M relationship)
    Notification.belongsTo(models.BusinessProfile, {
      foreignKey: 'business_profile_id',
    });
  };

  return Notification;
};
