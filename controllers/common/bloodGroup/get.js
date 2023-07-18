const Joi = require("joi");
const dao = require("../../../util/dao");

const GetBloodGroupController=async(req,res)=>{
    try{
        const bloodGroups=await getData(res);
        return res.status(200).json({IsSuccess:true,data:bloodGroups})
    }catch{
        return res.status(500).json({IsSuccess:false,message:"Internal Server Error."})
    }
}
const getData=async(res)=>{
    try {
        let query=`Select * from bloodgroup where IsActive=1`;
  
        const data = await dao.execute_value(query);

        return data;
    } catch (error) {
        res.status(500).json({IsSuccess:false,message:"Internal Server Error."});
    }

}

module.exports=GetBloodGroupController