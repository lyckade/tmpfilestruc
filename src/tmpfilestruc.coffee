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

    @tmpoptions = {}

  createFileNames: (options = {}) ->
    options = _.defaults options, @options
    names = @createNames options.files, options
    for i in [0...names.length]
      names[i] = names[i] + @options.suffix[Math.floor(Math.random()*@options.suffix.length)]
    names

  createDirectoryNames: (options = {}) ->
    options = _.defaults options, @options
    @createNames options.directories, options

  createNames: (nr, options) ->
    names = []
    for i in [0...nr]
      names.push "#{i}#{@createName options}"
    names

  createName: (options = {}) ->
    options = _.defaults options, @options
    Math.random().toString(36).substring(options.nameLength)



module.exports = new Tmpfilestruc()
