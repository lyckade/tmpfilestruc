path = require "path"
_ = require "underscore"
fse = require "fs-extra"

class Tmpfilestruc

  constructor: ->
    @options =
      recursionlevel: 5
      files: 10
      directories: 5
      nameLength: 8
      suffix: [".txt", ".doc", ".xls"]
    @tmpoptions = {}
    @fse = fse

  createStructure: (root, options = {}, recursionLevel=1) ->
    @tmpoptions = _.defaults options, @options
    fileNames = @createFileNames()
    for name in fileNames
      fse.ensureFileSync path.join root, name
      console.log path.join root, name
    return true if @tmpoptions.recursionlevel is recursionLevel
    folders = @createDirectoryNames()
    for folder in folders
      folderPath = path.join root, folder
      fse.ensureDirSync folderPath
      @createStructure folderPath, options, recursionLevel+1
    @tmpoptions = {}

  createFileNames: ->
    names = @createNames @tmpoptions.files
    for i in [0...names.length]
      names[i] = names[i] + @options.suffix[Math.floor(Math.random()*@options.suffix.length)]
    names

  createDirectoryNames: ->
    @createNames @tmpoptions.directories

  createNames: (nr) ->
    names = []
    for i in [0...nr]
      names.push "#{i}#{@createName()}"
    names

  createName: ->
    Math.random().toString(36).substring(@tmpoptions.nameLength)



module.exports = new Tmpfilestruc()
