package main
import rl"vendor:raylib"
import io"core:fmt"
import e"ecs"
import player"player"
import rocket"rocket"


main :: proc(){
  rl.InitWindow(800 , 600 , "window")
  world := e.create_world()
  player.create_player(&world)
  
  for !rl.WindowShouldClose(){
    player.update(&world)
    rocket.shoot_rockets(&world)
    rocket.update(&world)
    rl.BeginDrawing()
      rl.ClearBackground(rl.WHITE)
         e.render_entities(&world)
    rl.EndDrawing()
    
  }
  
  e.unload_entities(&world)
}