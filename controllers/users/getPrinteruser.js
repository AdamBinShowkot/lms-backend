const dao = require("../../util/dao");
const { TABLE } = require("../../util/constant");

const getPrinterUsersController = async (req, res) => {
  try {
    const students = await getUsers(req);
    if (students.length > 0) {
      return res
        .status(200)
        .json({ 
            success:true,
            data: students 
        });
    } else {
      res.status(401).send("Something went wrong");
    }
  } catch (error) {
    res.status(500).send("Internal server error");
    throw error;
  }
};

const getUsers = async (req) => {
  try {
    sql =`select firstname as firstName,lastname as lastName,username as userName,id as id , email as email,role as role from ${TABLE.USERS} where role= ?`;
    const values=['printer']

    const data = await dao.get_data(sql,values);
    return data;
  } catch (error) {
    throw error;
  }
};

module.exports = getPrinterUsersController;
