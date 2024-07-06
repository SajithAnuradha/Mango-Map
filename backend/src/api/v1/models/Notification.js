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
      type: DataTypes.STRING(255),
      allowNull: false,
      validate: {
        notNull: {
          msg: 'Description cannot be null',
        },
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
  Notification.associate = (models) => {
    // a Notification belongs to a normal user (1:M relationship)
    Notification.belongsTo(models.NormalUser, {
      foreignKey: 'user_id',
    });
  };

  return Notification;
};
