const Joi = require("joi");
const bcrypt = require("bcrypt");
const dao = require("../../util/dao");
const jwt = require("jsonwebtoken");

const schema = Joi.object().keys({
  userName: Joi.string().alphanum().min(3).max(10).required(),
  password: Joi.string().trim().min(5).max(15).required(),
});

const loginController = async (req, res) => {
  const isValidate = schema.validate(req.body);
  if (isValidate.error) {
    return res.status(400).json({ error: isValidate.error });
  }
  let data = [];
  try {
    const { userName, password } = req.body;
    const query=`select * from users where userName= '${userName}'`;
    data = await dao.get_data(query);

    if (data.length > 0) {
      const isPasswordCorrect = await bcrypt.compare(
        password,
        data[0].password
      );
      //console.log(isPasswordCorrect)
      if (isPasswordCorrect) {
        const token = generateToken(data);
        return res.status(200).json({
          message: "Login success",
          IsSuccess:true,
          id:data[0].id,
          userName:data[0].userName,
          groupId:data[0].userGroupId,
          token: token,
        });
      }
      return res.status(401).json({
        message: "Invalid credentials",
      });
    }
    return res.status(401).json({
      message: "Invalid credentials",
    });
  } catch (error) {
    return res.status(500).send("Internal server error");
  }
  res.json({
    data: data,
  });
};

const generateToken = (data) => {
  const newData = data[0];
  const dataForSign = {
    user: {
      firstname: newData.firstName,
      lastname:newData.lastName,
      username: newData.userName,
      email: newData.email,
    },
  };
  const token = jwt.sign(
    dataForSign, 
    process.env.JWT_SECRET,
    {
      expiresIn:'5h'
    }
    );
  return token;
};

module.exports = loginController;
