const pool = require("./db");

const get_data =async(sql) => {
  try{
    const data = await pool.query(sql);
    return data;
  }catch (error) {
    console.log("error fetching data");
  }
  
};

const testResolve=(data)=>{
  console.log(data)
  let data3=data.then((data2)=>{
    return Promise.resolve(data2)
  }).catch(err=>{

  })
  
}

const execute_value = async (query) => {
  try{
    const execute_data = await pool.query(query);
    return execute_data;
  }catch (error) {
    console.log("error fetching data");
  }
};

const execute_values = async (query) => {
  try {
    await client.query("BEGIN");
    for (let q of query) await client.query(q);
    await client.query("COMMIT");
  } catch (error) {
    client.query("ROLLBACK");
    console.log("error in executed values", error);
  }
};
module.exports = { get_data, execute_value, execute_values };
