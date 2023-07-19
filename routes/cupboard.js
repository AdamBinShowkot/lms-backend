const express = require("express");
const cupboardRouter = express.Router();

const { API } = require("../util/constant");
const authMiddleware = require("../middlewares/auth_middleware");
const GetController=require('../controllers/cupboard/get')
const CreateController=require('../controllers/cupboard/create')

cupboardRouter.get(
  API.API_CONTEXT + API.CUP_BOARD_LISTS,
  authMiddleware,
  GetController
);

cupboardRouter.post(
    API.API_CONTEXT + API.CUP_BOARD_CREATE,
    authMiddleware,
    CreateController
);




module.exports = cupboardRouter;
