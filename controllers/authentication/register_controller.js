const dao = require("../../util/dao");
const Joi = require("joi");
const bcrypt = require("bcrypt");

const schema = Joi.object().keys({
  firstName:Joi.string().alphanum().min(3).max(50).required(),
  lastName: Joi.string().alphanum().min(3).max(50).required(),
  userName: Joi.string().alphanum().min(3).max(10).required(),
  phone:Joi.string().regex(/^[0-9]{11}$/).min(11).max(11).required(),
  email: Joi.string().email().required(),
  userGroupId:Joi.string().trim().required(),
  userTypeId:Joi.string().trim().required(),
  password: Joi.string().trim().min(5).max(15).required(),
});

const registerController = async (req, res) => {
  const isValidate = schema.validate(req.body);
  if (isValidate.error) {
    return res.status(400).json({ error: isValidate.error });
  }

  try {
    const isDuplicate =await duplicateEntryCheck(req);
    //console.log(isDuplicate)
    if (isDuplicate) {
      return res
        .status(400)
        .json({ message: "duplicate entry of username or password" });
    }
    const register = await registerUser(req);
    //console.log("REG",register)
    if (register.insertId > 0) {
      return res.status(200).json({ message: "Registration successful" });
    } else {
      res.status(401).send("Something went wrong");
    }
  } catch (error) {
    res.status(500).send("Internal server error");
    throw error;
  }
};

const registerUser = async (req) => {
  const { 
    firstName,
    lastName, 
    userName,
    phone, 
    email,
    userGroupId,
    userTypeId,
    password 
  } = req.body;
  try {
    const salt = await bcrypt.genSalt();
    const hashedPassword = await bcrypt.hash(password, salt);

    const sql = `INSERT INTO users(firstName,lastName,userName,phone,email,userGroupId,userTypeId,password,IsActive) VALUES ('${firstName}','${lastName}','${userName}','${phone}','${email}',${userGroupId},${userTypeId},'${hashedPassword}',1)`;

    //console.log(sql)
    const register = await dao.execute_value(sql);
    //console.log("REG",register)
    return register;
  } catch (error) {
    throw error;
  }
};

const duplicateEntryCheck = async(req) => {
  const { userName, email } = req.body;

  try {
    sql =`select * from users where email= '${email}' or userName= '${userName}'`;
    const data =await dao.get_data(sql);
    //console.log("DD",data)
    return data.length  ? true : false;
  } catch (error) {
    throw error;
  }
};

const generateToken = async (req) => {
  const { email } = req.body;
  try {
    sql = {
      text: "select name, email, role from users where email = $1",
      values: [email],
    };
    const data = await dao.get_data(sql);
    console;
  } catch (error) {
    throw error;
  }
};

module.exports = registerController;
