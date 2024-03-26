// express 패키지 import
const express = require("express"); 
const app = express();

// API Key를 별도 관리 : dot(.)env 활용, .env라는 파일에 key를 보관하고, dotenv가 .env파일을 활용해서, process.env 객체에 포함시킴.
const dotenv = require('dotenv');
dotenv.config();

const clientId = process.env.CLIENT_ID
const clientSecret = process.env.CLIENT_SECRET

// nodejs 서버가 또 다른 client가 되어 Naver 서버에 요청을 보내기 위해 사용.
const request = require('request');
const template = require('./public/template.js');

// express의 static 미들웨어 활용.
app.use(express.static('public'))

// express의 json 미들웨어 활용.
app.use(express.json());

console.log(`현재 파일명: ${__filename}`);
console.log(`index.html의 파일 경로: ${__dirname}`);


// root url : localhost:3000/ == localhost:3000
// 해당 경로로 요청이 들어왔을 때 호출될 함수.
// 두 인자값(arguments)을 받음 : request(req), response(res)
app.get("/", (req, res) => {
    res.sendFile(__dirname, 'index.html');
});

app.get("/search", (req, res) => {
    let title= ' ';
    title = req.query.search;

    const api_url = 'https://openapi.naver.com/v1/search/book.json?query='+ encodeURI(req.query.search);

    const options = {
        url: api_url,
        form: {
            query: title,
            d_titl:title
        },
        headers: {'X-Naver-Client-Id':clientId, 'X-Naver-Client-Secret': clientSecret}
     };

    request.get(options, function (error, response, body) {
      if (!error && response.statusCode == 200) {
        const parsedBody = JSON.parse(body);
        const bookInfo = parsedBody['items'][0];
        const titl = bookInfo['title'];
        const img = bookInfo['image'];
        const author = bookInfo['author'];
        const pub = bookInfo['publisher'];
        const price = bookInfo['price'];
        const desc = bookInfo['description'];
        const result = template.result(titl, img, author, pub, price, desc);

        res.send(result);
      } else {
        console.log('error = ' + response.statusCode);
        res.redirect('/');
      }
    });
});

app.listen(3000, () => {
    console.log('http://127.0.0.1:3000/ app listening on port 3000!');
});