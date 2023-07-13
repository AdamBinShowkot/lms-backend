const express = require("express");
const appRouter = express.Router();

const authenticationRouter = require("./authentication");
const userRouter=require('./user');
const menuRouter=require('./menus');


appRouter.use(authenticationRouter);
appRouter.use(userRouter);
appRouter.use(menuRouter);

module.exports = appRouter;
