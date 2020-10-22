-- shared module
if !SERVER && !CLIENT then return end

-- disable reload
if istable(init) then return end

module("init", package.seeall)

-- loads an init directory
function Load(dir, rec)
	-- shared init
	if file.Exists(dir.."/shared.lua", "LUA") then
		AddCSLuaFile(dir.."/shared.lua")
		include(dir.."/shared.lua")
	end

	-- server init
	if file.Exists(dir.."/init.lua", "LUA") then
		include(dir.."/init.lua")
	end

	-- client init
	if file.Exists(dir.."/cl_init.lua", "LUA") then
		AddCSLuaFile(dir.."/cl_init.lua")
		if CLIENT then include(dir.."/cl_init.lua") end
	end

	-- recursion is disabled
	if !rec then return end

	-- recursively load all sub-directories
	for i, sdir in SortedPairs(select(2, file.Find(dir.."/*", "LUA"))) do
		Load(dir.."/"..sdir, true)
	end
end
