local authorized_players = minetest.setting_get("maintenancemode")

if authorized_players then
	authorized_players = authorized_players:split(",")
end

minetest.register_on_joinplayer(function(player)
	if not authorized_players then return end

	local playername = player:get_player_name()

	for _,value in pairs(authorized_players) do
		if value == playername then
			return
		end
	end

	minetest.kick_player(playername,"Server closed for maintenance")
end)
