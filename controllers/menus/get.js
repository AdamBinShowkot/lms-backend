const Joi = require("joi");
const dao = require("../../util/dao");
const { TABLE } = require("../../util/constant");


const schema=Joi.object().keys({
    UserId: Joi.string().trim().min(3).max(10).required(),
})

const GetMenusController=async(req,res)=>{
    const isValidater=schema.validate(req.query);

    if(isValidater){
        try{
            let {UserId,GroupId}=req.query;

            let ModuleLists=[];
            let MenuLists=[]
            ModuleLists=await GetUserModulePermission(UserId);

            if(ModuleLists.length){
                MenuLists=ModuleLists.reduce(async(preModule,mlData)=>{
                    let Menus=[];
                    let MenuData=[];
                    MenuData=await GetUserMenuPermissionWithGroupId(GroupId,mlData.ModuleId,res);

                    if(MenuData.length){
                        Menus=MenuData.reduce((preMenu,mnData)=>{
                            return[
                                ...preMenu,
                                mnData
                            ]
                        },[])
                    }else{
                        MenuData=await GetUserMenuPermissionWithUserId(UserId,mlData.ModuleId,res);

                        if(MenuData.length){
                            Menus=MenuData.reduce((preMenu,mnData)=>{
                                return[
                                    ...preMenu,
                                    mnData
                                ]
                            },[])
                        }
                    }
                    return[
                        ...await preModule,
                        {
                            Id:mlData.id,
                            ModuleId:mlData.ModuleId,
                            ModuleName:mlData.name,
                            IconName:mlData.IconName,
                            children:Menus
                        }
                    ]
                },[])

                return res.status(200).json({IsSuccess:true,data:await MenuLists})
            }else{
                return res.status(200).json({IsSuccess:true,data:ModuleLists})
            }

            //return res.status(200).json({IsSuccess:true,data:ModuleLists})

        }catch(err){
            return res.status(500).json({message:'Internal Server Error!'});
        }
    }else{
        return res.status(500).json({message:'Internal Server Error!'});
    }
}


const GetUserModulePermission = async (UserId) => {
    try {
        let query=`Select mdp.id,mdp.ModuleId,m.name,m.IconName from 
        modulepermission  mdp
        inner join modules m on mdp.ModuleId=m.id
        where mdp.UserId=${UserId} and mdp.IsActive=1`;
  
        const data = await dao.execute_value(query);

        return data;
    } catch (error) {
        throw error;
    }
};

const GetUserMenuPermissionWithGroupId = async (GroupId,ModuleId,res) => {
   if(GroupId && ModuleId){
        try {
            let query=`Select 
            pg.id as id , pg.MenuId , m.name as name,m.IconName,m.path , pg.IsCreate,pg.IsUpdate,pg.IsReport,pg.IsView
            from permissiongroup pg
            inner join menus m on pg.MenuId=m.id
            where pg.IsActive=1 AND pg.GroupId=${GroupId} AND m.ModuleId=${ModuleId} AND m.IsActive=1`;
    
            const data = await dao.execute_value(query);

            return data;
        } catch (error) {
            throw error;
        }
    }else{
        return res.status(500).json("Internal Server Error!") 
    }
};

const GetUserMenuPermissionWithUserId = async (UserId,ModuleId,res) => {
    if(UserId && ModuleId){
        try {
            let query=`Select 
            pg.id as id ,pg.MenuId , m.name as name,m.IconName,m.path,pg.IsCreate,pg.IsUpdate,pg.IsReport,pg.IsView
            from permissions pg
            inner join menus m on pg.MenuId=m.id
            where pg.IsActive=1 AND pg.UserId=${UserId} AND m.ModuleId=${ModuleId} AND m.IsActive=1`;
    
            const data = await dao.execute_value(query);

            return data;
        } catch (error) {
            throw error;
        }
    }else{
        return res.status(500).json("Internal Server Error!") 
    }
 };


module.exports=GetMenusController;

