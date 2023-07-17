const express = require("express");
const appRouter = express.Router();

const authenticationRouter = require("./authentication");
const userRouter=require('./user');
const menuRouter=require('./menus');
const commonRouter=require('./common')


appRouter.use(authenticationRouter);
appRouter.use(commonRouter);
appRouter.use(userRouter);
appRouter.use(menuRouter);

module.exports = appRouter;
