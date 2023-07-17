const express = require("express");
const commonRouter = express.Router();

const { API } = require("../util/constant");
const authMiddleware = require("../middlewares/auth_middleware");
const GetBloodGroupController=require('../controllers/common/bloodGroup/get');
const GetGenderController=require('../controllers/common/gender/get')

commonRouter.get(
  API.API_CONTEXT + API.COMMON_BLOOD_GROUP,
  GetBloodGroupController
);

commonRouter.get(
    API.API_CONTEXT + API.COMMON_GENDER,
    GetGenderController
);




module.exports = commonRouter;
