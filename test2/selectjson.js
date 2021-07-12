const express = require('express')
const mariadb = require('mariadb/callback')
const app = express()

app.use(express.static('public'));

app.listen('8080', () => {
    console.log("Server started")
})

var dbc = mariadb.createConnection({
    host: "localhost",
    database: "TFT",
    user: "root",
    password: "root"
})

dbc.connect((err) => {
    if (err) throw err;
    console.log("Database Connected")
})

app.get('/basicitem', (req, res) => {
    // 기본 아이템 출력을 위한 express 라우팅
    var query = "select * from basic_item"
    dbc.query(query, (err, result, fields) => {
        if (err) throw err;
        res.send(result);
    })
})

app.get('/combiitem', (req, res) => {
    // 조합 아이템 출력을 위한 express 라우팅
    var query = "select * from combi_item"
    dbc.query(query, (err, result, fields) => {
        if (err) throw err;
        res.send(result);
    })
})

app.get('/playercharacter', (req, res) => {
    // 플레이어 캐릭터 출력을 위한 express 라우팅
    var query = "select * from player_character"
    dbc.query(query, (err, result, fields) => {
        if (err) throw err;
        res.send(result);
    })
})

app.use('/image', express.static('test2/images'));
app.use(express.urlencoded());
app.use('/add', express.static('test2/insert.html'));