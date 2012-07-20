/*
 * Simple connect server for phantom.js
 * Adapted from Modernizr
 */

var connect = require('connect')
  , http    = require('http')
  , fs      = require('fs')
  , util    = require('util')
  , app     = connect().use(connect.static(__dirname + '/../'));

http.createServer(app).listen(3000);

util.log(__dirname);

fs.writeFileSync(__dirname + '/pid.txt', process.pid, 'utf-8');