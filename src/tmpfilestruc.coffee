path = require "path"
_ = require "underscore"

class Tmpfilestruc

  constructor: ->
    @options =
      recursionlevel: 5
      files: 10
      directories: 5
      nameLength: 8
      suffix: [".txt", ".doc", ".xls"]
    @tmpoptions = {}

  createStructure: (root, options = {}) ->
    @tmpoptions = _.defaults options, @options
    names = @createFileNames()
    for name in names
      fse.ensureFileSync path.join root, name
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
