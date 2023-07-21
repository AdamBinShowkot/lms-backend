const dao=require('../../../util/dao');

const GetOccupationController=async(req,res)=>{
    try{
        const occupationLists=await getData(res);

        return res.status(200).json({IsSuccess:true,data:occupationLists});
    }catch{
        res.status(500).json({IsSuccess:false,message:"Internal Server Error."})
    }
}

const getData=async(res)=>{
    try{
        const sqlQueries=`Select * from occupation where IsActive=1`;
        const data=await dao.execute_value(sqlQueries);

        return data;
    }catch{
        res.status(500).json({IsSuccess:false,message:"Internal Server Error."});
    }

}

module.exports=GetOccupationController;