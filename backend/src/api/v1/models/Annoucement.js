module.exports = (sequelize, DataTypes) => {
  const Annoucement = sequelize.define('Annoucement', {
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
  });

  // associations with the other models
  Annoucement.associate = (models) => {
    // a promotion belongs to a business profile (1:M relationship)
    Annoucement.belongsTo(models.BusinessProfile, {
      foreignKey: 'business_profile_id',
    });
  };

  return Annoucement;
};
