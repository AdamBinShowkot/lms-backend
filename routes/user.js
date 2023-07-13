const express = require("express");
const userRouter = express.Router();

const { API } = require("../util/constant");
const authMiddleware = require("../middlewares/auth_middleware");
const getApproverusersController =require("../controllers/users/getApproveruser");
const getPrinterUsersController=require("../controllers/users/getPrinteruser");

userRouter.get(
  API.API_CONTEXT + API.GET_APPROVE_USER,
  authMiddleware,
  getApproverusersController
);

userRouter.get(
  API.API_CONTEXT + API.GET_PRINTER_USER,
  authMiddleware,
  getPrinterUsersController
);



module.exports = userRouter;
