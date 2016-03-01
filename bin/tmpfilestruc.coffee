program = require "commander"
fse = require "fs-extra"
path = require "path"

packageObj = fse.readJsonSync path.join __dirname, "../package.json"



program
  .version packageObj.version
  .usage '[options] <file ...>'
  .option '-rl --recursionlevel <n>', 'Levels of recursion for the folders', parseInt
  .option '-nf --files <n>', 'Number of files per folder', parseInt
  .option '-nd --directories <n>', 'Number of subdirectories per folder', parseInt
  .option '-d --directory <dir>', 'Root directory for the tmp filestruc'
  .parse(process.argv)
console.log program
