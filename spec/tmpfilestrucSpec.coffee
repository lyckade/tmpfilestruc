tfs = require "../src/tmpfilestruc"

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
