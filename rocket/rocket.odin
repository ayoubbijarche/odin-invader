package rocket
import rl"vendor:raylib"
import e"../ecs"
import player"../player"
import io"core:fmt"



create_rockets :: proc(world : ^e.World){
  // for entities in world.entity{
  //   if positions , has_positions := &world.positions[e.Entity(1)]; has_positions{
  //   e.create_position(world , {positions.x+18 , positions.y} , entity)
  //   }
  // }
  entity := e.create_entity(world)
  e.create_position(world ,  player.player_pos(world) , entity)
  e.create_texture(world , rl.LoadTexture("./assets/rocket.png") , entity)
}

update :: proc(world : ^e.World){

  for entity in world.entity{
    if positions , has_positions := &world.positions[e.Entity(1)]; has_positions{
      positions.y -= 50 * rl.GetFrameTime() 
    }
  }
}

shoot_rockets :: proc(world : ^e.World){
  if rl.IsMouseButtonPressed(rl.MouseButton(0)){
    io.println("shot")
    create_rockets(world)
  }
}