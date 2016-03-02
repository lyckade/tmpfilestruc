program = require "commander"
fse = require "fs-extra"
path = require "path"
_ = require "underscore"

packageObj = fse.readJsonSync path.join __dirname, "../package.json"



program
  .version packageObj.version
  .usage '[options] <file ...>'
  .option '-rl --recursionlevel <n>', 'Levels of recursion for the folders', parseInt
  .option '-nf --files <n>', 'Number of files per folder', parseInt
  .option '-nd --directories <n>', 'Number of subdirectories per folder', parseInt
  .option '-d --directory <dir>', 'Root directory for the tmp filestruc'
  .parse(process.argv)

defaults =
  recursionlevel: 2
  files: 3
  directories: 3
  directory: ""

options = _.defaults program, defaults
tfs = require "../src/tmpfilestruc"
tfs.createStructure options.directory, options
