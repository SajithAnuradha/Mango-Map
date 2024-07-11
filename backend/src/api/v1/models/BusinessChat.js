module.exports = (sequelize, DataTypes) => {
  const BusinessChat = sequelize.define('BusinessChat', {
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

    message: {
      type: DataTypes.STRING(512),
      allowNull: false,
      validate: {
        notNull: {
          msg: 'Message cannot be null',
        },
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
    reply_id: {
      type: DataTypes.INTEGER,
      allowNull: true,
      defaultValue: null,
      reference: {
        model: 'BusinessChat',
        key: 'id',
      },
    },
  });

  // associations with the other models
  BusinessChat.associate = (models) => {
    // a business chat belongs to a business profile (1:M relationship)
    BusinessChat.belongsTo(models.BusinessProfile, {
      foreignKey: 'profile_id',
    });

    // a business chat belongs to a normal user (1:M relationship)
    BusinessChat.belongsTo(models.NormalUser, {
      foreignKey: 'user_id',
    });

    // a business chat belongs to a business chat (1:M relationship)
    BusinessChat.belongsTo(models.BusinessChat, {
      foreignKey: 'reply_id',
    });
  };

  return BusinessChat;
};
