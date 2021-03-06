tfs = require "../src/tmpfilestruc"
tfs.log = (txt) -> console.log txt

describe "tmpfilestruc", ->
  tfs.tmpoptions = tfs.options
  it "should have default options", ->
    expect(tfs.options.files).toBe 10

  it "should create directory names", ->
    dirNames = tfs.createDirectoryNames()
    expect(dirNames.length).toBe(tfs.options.directories)

  it "should create file names", ->
    fileNames = tfs.createFileNames()
    expect(fileNames.length).toBe(tfs.options.files)

  it "should create a unique name", ->
    name1 = tfs.createName()
    name2 = tfs.createName()
    expect(name1).not.toBe(name2)

  ###it "should create files and directories", ->
    tfs.fse.ensureDirSync = (folder) ->
      console.log folder
    tfs.fse.ensureFileSync = (fp) ->
      console.log fp
    tfs.createStructure ""
    ###
