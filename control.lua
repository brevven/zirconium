script.on_event( defines.events.on_console_chat, function(event)
  -- refresh recipes, in case of settings change
  if event.message and event.message == "ZirconiumRecipes" and (not event.player_index or not game.players[event.player_index] or game.players[event.player_index].admin) then
      if game.players[event.player_index].force.recipes["zirconia"] then
        game.players[event.player_index].force.recipes["zirconia"].enabled=true      
      end
      if game.players[event.player_index].force.recipes["zirconium-plate"] then
        game.players[event.player_index].force.recipes["zirconium-plate"].enabled=true      
      end
      if game.players[event.player_index].force.recipes["zircaloy-4"] then
        game.players[event.player_index].force.recipes["zircaloy-4"].enabled=true      
      end
      if game.players[event.player_index].force.recipes["cermet"] then
        game.players[event.player_index].force.recipes["cermet"].enabled=true      
      end
      if game.players[event.player_index].force.recipes["zirconium-tungstate"] then
        game.players[event.player_index].force.recipes["zirconium-tungstate"].enabled=true      
      end
  end
end)

