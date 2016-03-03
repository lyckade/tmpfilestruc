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
    @log = (txt) -> console.log txt


  createStructure: (root, options = {}, recursionLevel=1) ->
    @tmpoptions = _.defaults options, @options
    fileNames = @createFileNames()
    for name in fileNames
      filePath = path.join root, name
      fse.ensureFileSync filePath
      @log "File created: #{filePath}"
    return true if @tmpoptions.recursionlevel is recursionLevel
    folders = @createDirectoryNames()
    for folder in folders
      folderPath = path.join root, folder
      @log "Dir created: #{folderPath}"
      fse.ensureDirSync folderPath
      @createStructure folderPath, options, recursionLevel+1
    @tmpoptions = {}

  createFileNames: ->
    names = @createNames @tmpoptions.files
    for i in [0...names.length]
      names[i] = "#{names[i]}#{@createFileSuffix()}"
    names

  createDirectoryNames: ->
    @createNames @tmpoptions.directories

  createNames: (nr) ->
    names = []
    for i in [0...nr]
      names.push "#{i}_#{@createName()}"
    names

  createName: ->
    Math.random().toString(36).substring(@tmpoptions.nameLength)

  createFileSuffix: ->
    @options.suffix[Math.floor(Math.random()*@options.suffix.length)]



module.exports = new Tmpfilestruc()
