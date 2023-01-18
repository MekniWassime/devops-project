require('dotenv').config()
var express = require('express');
var app = express();
var httpProxy = require('http-proxy');
var apiProxy = httpProxy.createProxyServer();
var upstream = `http://${process.env.UPSTREAM_HOST}:${process.env.TARGET_PORT}`


app.all('*', function (req, res) {
    console.log("redirecting to upstream server");
    apiProxy.web(req, res, { target: upstream });
});
console.log(`listening on port ${process.env.PORT}\n upstream: ${upstream}`)
app.listen(process.env.PORT);