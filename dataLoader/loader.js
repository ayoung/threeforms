var yaml    = require('js-yaml');
var fs      = require('fs');
var sqlite3 = require('sqlite3');
var _       = require('underscore');
var docPath = './Documents/The Belgic Confession';
var baselinedb = 'baseline.db3';
var newdb = '../assets/db/content.db3';
var childProcess = require('child_process');

// refresh
if(fs.existsSync(newdb))
  childProcess.exec('rm ' + newdb);

// clone db file
childProcess.exec('cp ' + baselinedb + ' ' + newdb, loadDocuments);

function loadDocuments(err) {
  if(err) {
    console.log(err);
    return;
  }

  var db = new sqlite3.Database(newdb);

  var files = fs.readdirSync(docPath);
  _.each(files, function(file, idx) {
    if(file === '.DS_Store')
      return;

    console.log('Processing: ' + file);

    var doc = require(docPath + '/' + file);
    db.run("insert into articles (number, title, text) values (?, ?, ?);",
      doc.article, doc.title, doc.text);
  });

  db.close();
}