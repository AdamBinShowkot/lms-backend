module.exports = {
  API: {
    API_CONTEXT: "/api/v1/",
    LOGIN: "login",
    REGISTER: "register",

    COMMON_GENDER:'common/getGender',
    COMMON_OCCUPATION:'common/getOccupation',
    COMMON_BLOOD_GROUP:'common/getBloodGroup',

    CUP_BOARD_CREATE:'cupboard/create',
    CUP_BOARD_LISTS:'cupboard/lists',

    DONNER_CREATE:'donner/create',
    DONNER_LISTS:'donner/lists',
    
    GET_MENUS:"getMenus",

    GET_APPROVE_USER:'user/approver',
    GET_PRINTER_USER:'user/printer'
  },
  TABLE: {
    USERS: "users",
    USERGROUP: "usergroup",
    USERTYPE:'usertype',
    PERMISSION_GROUP:'permissiongroup',
    MODULE_PERMISSION:'modulepermission',
    PERMISSIONS:'permissions',
    PROJECTS:'projects',
    MODULES: "modules",
    MENUS:'menus',
    CUP_BOARD: "cupboard"
  },
};
