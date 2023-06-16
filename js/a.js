import mysql from "mysql";

const a = mysql.createConnection({
  host: "localhost",
  database: "juegos",
  user: "lautaro",
  password: 'pass' 
});

a.connect(err => {
  const sqlTable = 'select juego, id from juegos order by id asc';

  if(err) console.log(err)
  else {
    a.query(sqlTable, (e, r, f) => {
      if(e) console.log(e)
      r.forEach(({ id, juego }) => console.log(`${id} - ${juego}`))
      a.end(e => console.log(e))
    })
  }
})


