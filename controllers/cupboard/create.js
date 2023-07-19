const dao = require("../../util/dao");
const Joi = require("joi");

const schema = Joi.object().keys({
    name:Joi.string().trim().min(3).max(50).required(),
    description: Joi.string().trim().min(3).max(50).required(),
 // phone:Joi.string().regex(/^[0-9]{11}$/).min(11).max(11).required(),
    rowNo:Joi.number().required(),
    colNo:Joi.number().required()
});

const CreateController = async (req, res) => {
  const isValidate = schema.validate(req.body);
  if (isValidate.error) {
    return res.status(400).json({ error: isValidate.error });
  }

  try {
    const cupboard = await InsertCupboard(req);
    //console.log("REG",register)
    if (cupboard.insertId > 0) {
      return res.status(200).json({ IsSuccess:true,message:"Cupboard Create Successfully",data:cupboard});
    } else {
      res.status(401).send("Something went wrong");
    }
  } catch (error) {
    res.status(500).send("Internal server error");
    throw error;
  }
};

const InsertCupboard = async (req) => {
  const { 
    name,
    description,
    rowNo,
    colNo
  } = req.body;
  try {
    const sql = `INSERT INTO cupboard(name,description,rowNo,colNo) VALUES ('${name}','${description}','${rowNo}','${colNo}')`;

    const cupboard = await dao.execute_value(sql);
    return cupboard;
  } catch (error) {
    console.log('Cupboard Insert Error.')
    throw error;
  }
};

module.exports = CreateController;
