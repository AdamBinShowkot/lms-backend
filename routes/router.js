const express = require("express");
const appRouter = express.Router();

const authenticationRouter = require("./authentication");
const userRouter=require('./user');
const menuRouter=require('./menus');
const commonRouter=require('./common');
const cupboardRouter=require('./cupboard');


appRouter.use(authenticationRouter);
appRouter.use(commonRouter);
appRouter.use(userRouter);
appRouter.use(menuRouter);
appRouter.use(cupboardRouter)

module.exports = appRouter;
