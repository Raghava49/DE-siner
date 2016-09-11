fs = require 'fs'
directory = []
file = []
iddir = 0
idfile = 0

exports.explore_dir = (dir) ->
  for i in fs.readdirSync dir
    if @is_file dir + '/' +i
      file[idfile] = i
      idfile += 1
    else
      directory[iddir] = i
      iddir += 1
 	return {directory, file}

exports.is_file= (name) ->
   return fs.statSync(name).isFile
exports.raghava = ->
	alert("raghava")
