const express = require("express");
const donnerRouter = express.Router();

const { API } = require("../util/constant");
const authMiddleware = require("../middlewares/auth_middleware");
const CreateController=require('../controllers/donner/create')

donnerRouter.post(
    API.API_CONTEXT + API.DONNER_CREATE,
    authMiddleware,
    CreateController
);




module.exports = donnerRouter;
