const dao = require("../../util/dao");
const Joi = require("joi");

// my sql date Format
// YYYY-MM-DD

const schema = Joi.object().keys({
    memberShipNo:Joi.string().trim().min(3).max(50).required(),
    createDate: Joi.string().trim().min(3).max(50).required(),
    name:Joi.string().trim().required(),
    dateOfBirth:Joi.string().trim().required(),
    fathersName:Joi.string().trim(),
    mothersName:Joi.string().trim().required(),
    presentAddress:Joi.string().trim().required(),
    permanentAddress:Joi.string().trim().required(),
    mobileNo:Joi.string().trim().required(),
    whatsAppNo:Joi.string().trim().required(),
    occupation:Joi.number().required(),
    bloodGroup:Joi.number().required(),
    qualification:Joi.string().trim().required(),
    institute:Joi.string().trim().required(),
    isFemale:Joi.number().required(),
    gender:Joi.number().required(),
    imageId:Joi.number().required(),
    nidId:Joi.number().required(),
    isNid:Joi.number().required()
});

const CreateController = async (req, res) => {
  const isValidate = schema.validate(req.body);
  if (isValidate.error) {
    return res.status(400).json({ error: isValidate.error });
  }

  try {
    const donner = await InsertDonner(req);
    if (donner.insertId > 0) {
      return res.status(200).json({ IsSuccess:true,message:"Donner Create Successfully",data:donner});
    } else {
      res.status(401).send("Something went wrong");
    }
  } catch (error) {
    res.status(500).send("Internal server error");
    throw error;
  }
};

const InsertDonner = async (req) => {
  const { 
    memberShipNo,
    createDate,
    name,
    dateOfBirth,
    fathersName,
    mothersName,
    presentAddress,
    permanentAddress,
    mobileNo,
    whatsAppNo,
    occupation,
    bloodGroup,
    qualification,
    institute,
    gender,
    isFemale,
    nidId,
    isNid,
    imageId
  } = req.body;

  try {
    const sql=`INSERT INTO donner(memberShipNo,createDate,name,dateOfBirth,fatherName,motherName,presentAddress,permanentAddress,mobileNo,whatsAppNo,occupation,bloodGroup,qualification,institute,gender,isFemale,imageId,nidId,isNid) VALUES ('${memberShipNo}','${createDate}','${name}','${dateOfBirth}','${fathersName}','${mothersName}','${presentAddress}','${permanentAddress}','${mobileNo}','${whatsAppNo}','${occupation}','${bloodGroup}','${qualification}','${institute}','${gender}','${isFemale}','${imageId}','${nidId}','${isNid}')`;

    const donner = await dao.execute_value(sql);
    return donner;
  } catch (error) {
    console.log('Donner Insert Error Insert Error.')
    throw error;
  }
};

module.exports = CreateController;
