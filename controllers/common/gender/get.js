const dao=require('../../../util/dao');

const GetGenderController=async(req,res)=>{
    try{
        const genderLists=await getData(res);

        return res.status(200).json({IsSuccess:true,data:genderLists});
    }catch{
        res.status(500).json({IsSuccess:false,message:"Internal Server Error."})
    }
}

const getData=async(res)=>{
    try{
        const sqlQueries=`Select * from sex where IsActive=1`;
        const data=await dao.execute_value(sqlQueries);

        return data;
    }catch{
        res.status(500).json({IsSuccess:false,message:"Internal Server Error."});
    }

}

module.exports=GetGenderController;