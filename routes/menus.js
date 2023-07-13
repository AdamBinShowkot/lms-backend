const express = require("express");
const userRouter = express.Router();

const { API } = require("../util/constant");
const authMiddleware = require("../middlewares/auth_middleware");
const GetMenusController =require("../controllers/menus/get");

userRouter.get(
  API.API_CONTEXT + API.GET_MENUS,
  //authMiddleware,
  GetMenusController
);




module.exports = userRouter;
