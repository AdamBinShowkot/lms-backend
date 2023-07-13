require("dotenv").config();
const express = require("express");
const cors = require('cors')
const app = express();
const body_parser = require("body-parser");
const port = process.env.PORT | 3000;
const router = require("./routes/router");
const db = require("./util/db");
const expressListRoutes = require("express-list-routes");
const pool = require("./util/db");
const {get_data}=require('./util/dao')

app.use(express.json({limit: '50mb'}));
app.use(body_parser.json());
app.use(cors())
app.use(router);

const testget=async()=>{
  let sql=`Insert into usergroup (name,description,IsActive) values ('test','test',1);`
  const data=await get_data('Select * from usergroup');
  //const data=await get_data(sql);
  console.log(data)
}

app.listen(port, async () => {
  expressListRoutes(router, { prefix: "", spacer: 15 });

  //testget();
  
  // con.connect((err) => {
  //   if (err) throw err;
  //   console.log("database connected");
  // });


  console.log(`Server running on http://localhost:${port}`);
});
