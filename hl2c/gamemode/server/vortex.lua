local DbgPrint = GetLogging("Vortex")

hook.Add("InitPostEntity", "Hl2c.Vortex.Spawn.Check", function()
	if VORTEX_POS and isvector(VORTEX_POS) then
		
		local vortex_test = ents.Create("ent_vortex_hl2c")
		vortex_test:Spawn()
		vortex_test:Activate()
		DbgPrint("[hl2c] Supper Vortex Spawned")
	end
	if S_VORTEX_POS and isvector(S_VORTEX_POS) then		
		
		local vortex_test = ents.Create("ent_vortex_hl2c")
		vortex_test.supervortex = true
		vortex_test:Spawn()
		vortex_test:Activate()
		DbgPrint("[hl2c] Supper Vortex Spawned")
	end
end)