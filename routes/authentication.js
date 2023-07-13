const express = require("express");
const authenticationRouter = express.Router();

const loginController = require("../controllers/authentication/login_controller");
const registerController = require("../controllers/authentication/register_controller");
const { API } = require("../util/constant");

authenticationRouter.post(API.API_CONTEXT + API.LOGIN, loginController);
authenticationRouter.post(API.API_CONTEXT + API.REGISTER, registerController);

module.exports = authenticationRouter;
