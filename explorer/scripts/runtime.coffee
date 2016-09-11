exp = require './explorer.coffee'

contents = exp.explore_dir('G:/electron-quick-start-master')
alert contents.directory
$('.folder_contents').append(contents.directory + contents.file)
