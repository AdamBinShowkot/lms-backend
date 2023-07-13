const mysql = require('mysql');
const util = require('util');
const mysql2 = require('promise-mysql')

// const connection =mysql.createConnection({
//   // host: process.env.DB_HOST,
//   // user: process.env.DB_USER,
//   // password: process.env.DB_PASSWORD,
//   // database: process.env.DB_NAME,
//   port: process.env.DB_PORT,
//   host:process.env.DB_HOST,
//   database:process.env.DB_NAME,
//   user:process.env.DB_USER,
//   password:process.env.DB_PASSWORD
// });

const pool=mysql.createPool({
  //connectionLimit : 10,
  host            : process.env.DB_HOST,
  user            : process.env.DB_USER,
  password        : process.env.DB_PASSWORD,
  database        : process.env.DB_NAME
})

// exports.getConnection = () => {
//   return new Promise((resolve, reject) => {
//       pool.getConnection(function (err, connection) {
//           if (err) {
//               return reject(err);
//           }
//           resolve(connection);
//       });
//   });
// };

// Ping database to check for common exception errors.
pool.getConnection((err, connection) => {
  if (err) {
    if (err.code === 'PROTOCOL_CONNECTION_LOST') {
      console.error('Database connection was closed.')
    }
    if (err.code === 'ER_CON_COUNT_ERROR') {
      console.error('Database has too many connections.')
    }
    if (err.code === 'ECONNREFUSED') {
      console.error('Database connection was refused.')
    }
  }
  if (connection) connection.release()
    return
  }
)
  
// Promisify for Node.js async/await.
pool.query = util.promisify(pool.query)
  


// const connection = async () => {
//   return await mysql2.createConnection({
//     port: process.env.DB_PORT,
//     host:process.env.DB_HOST,
//     database:process.env.DB_NAME,
//     user:process.env.DB_USER,
//     password:process.env.DB_PASSWORD
//     // host:"202.22.203.92",
//     // database:"samakaal",
//     // user:"Deen",
//     // password:"Deen@1909"
//   })
// }


module.exports = pool;
