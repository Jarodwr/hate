--Ini parsing library
local inifile = require "library.inifile.inifile"
--Parse the configuration file
local config = inifile.parse("config.ini", "love")

function love.conf(settings)
	settings.identity = config["love"]["identity"]
	settings.appendentity = config["love"]["appendentity"]
	settings.version = config["love"]["version"]
	settings.console = config["love"]["console"]
	settings.accelerometerjoystick = config["love"]["accelerometerjoystick"]
	settings.externalstorage = config["love"]["externalstorage"]
	settings.gammacorrect = config["love"]["gammacorrect"]
	settings.identity = config["love"]["identity"]
	settings.audio = config["love.audio"]
	settings.window = config["love.window"]
	settings.modules = config["love.modules"]
end
