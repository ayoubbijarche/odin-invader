package player
import e"../ecs"
import rl"vendor:raylib"


create_player :: proc(world: ^e.World){
   entity := e.create_entity(world)
   e.create_position(world ,{300 , 500} , entity)
   e.create_texture(world , rl.LoadTexture("./assets/ship1.png"),  entity)
}

update :: proc(world : ^e.World){
  player := e.Entity(0)
  for position in world.entity{
    if position , has_position := &world.positions[player]; has_position{
      if rl.IsKeyDown(rl.KeyboardKey.A){
        position.x -= 120 * rl.GetFrameTime()
      }
      if rl.IsKeyDown(rl.KeyboardKey.D){
        position.x += 120 * rl.GetFrameTime()
      }
    }
  }
}

player_pos :: proc(world : ^e.World) -> e.Position{
  player := e.Entity(0)
  x , y : f32
  for position in world.entity{
    if position , has_position := &world.positions[player]; has_position{
      return {x=position.x , y=position.y}
    }
  }
  return {x, y}
}