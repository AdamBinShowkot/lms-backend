const express = require("express");
const commonRouter = express.Router();

const { API } = require("../util/constant");
const authMiddleware = require("../middlewares/auth_middleware");
const GetBloodGroupController=require('../controllers/common/bloodGroup/get');
const GetGenderController=require('../controllers/common/gender/get');
const GetOccupationController=require('../controllers/common/occcupation/get');

commonRouter.get(
  API.API_CONTEXT + API.COMMON_BLOOD_GROUP,
  GetBloodGroupController
);

commonRouter.get(
  API.API_CONTEXT + API.COMMON_GENDER,
  GetGenderController
);

commonRouter.get(
  API.API_CONTEXT+API.COMMON_OCCUPATION,
  GetOccupationController
)




module.exports = commonRouter;
