FS = require 'fs'
path = require 'path'

module.exports = (robot) ->
  Path = path.resolve __dirname, 'scripts'
  FS.exists Path, (exists) ->
    if exists
      robot.loadFile Path, file for file in FS.readdirSync(Path)
