const dao = require("../../util/dao");
const Joi = require("joi");


const GetController = async (req, res) => {
  try {
    const cupboard = await getData(res);
    
    return res.status(200).json({IsSuccess:true,data:cupboard})
  } catch (error) {
    res.status(500).send("Internal server error");
    throw error;
  }
};

const getData = async (res) => {
  try {
    const sql = `Select * from cupboard order by id desc`;
    const cupboard = await dao.execute_value(sql);
    return cupboard;
  } catch (error) {
    console.log('Cupboard Get Error.')
    return res.status(500).json({IsSuccess:false,message:"Internal Server Error."})
  }
};

module.exports = GetController;
