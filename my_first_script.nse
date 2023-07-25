--The HEAD
--The HEAD of the script contains meta information about your script. It contains:
--require statements that require packages needed for the script to run.


-- HEAD

local nmap = require "nmap"
local shortport = require "shortport"


-- DESCRIPTION

description = [[
My first script!
]]


-- AUTHOR, LICENSE, and CATEGORIES

author = "Your Name" 
license = "Same as Nmap--See https://nmap.org/book/man-legal.html"
categories = {"safe"}


-- RULE
--The RULE of the script is the portion of the code that determines if the script will run or not. 
--For example, if port 80 isn’t open, maybe we can’t run our HTTP-specific script! In that case, we should stop.

portrule = function(host, port)
	local port_to_check = { number = 4000, protocol = "tcp" }
	local port_state = nmap.get_port_state(host, port_to_check)

	return port_state ~= nil
		and port_state.state == "open"
end


-- ACTION

action = function(host, port)
	return "Yes, this port is open!"
end
