'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Likepost extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  };
  Likepost.init({
    PostID: DataTypes.INTEGER,
    CommentID: DataTypes.INTEGER,
    UserID: DataTypes.INTEGER,
    Timestamp: DataTypes.DATE
  }, {
    sequelize,
    modelName: 'Likepost',
    tableName: 'likespost',
  });
  return Likepost;
};