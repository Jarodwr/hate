--Ini parsing library
local inifile = require "library.inifile.inifile"
--Parse the configuration file and set a global variable for easy access
config = inifile.parse("config.ini", "love")