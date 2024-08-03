package ecs
import rl"vendor:raylib"


Entity :: distinct int

Position :: struct{
  x , y : f32
}

TextureRender :: struct{
  texture : rl.Texture2D
}

World :: struct{
  entity : [dynamic]Entity,
  positions : map[Entity]Position,
  texture : map[Entity]TextureRender,
  next_entity : Entity
}

create_world :: proc()-> World{
  return World{
    entity = make([dynamic]Entity),
    positions = make(map[Entity]Position),
    texture = make(map[Entity]TextureRender),
    next_entity = 0
  }
}



create_entity :: proc(world : ^World) -> Entity{
  entity := world.next_entity
  append(&world.entity , entity)
  world.next_entity += 1
  return entity
}

create_position :: proc(world: ^World , position : Position , entity : Entity){
  world.positions[entity] = position
}

create_texture :: proc(world : ^World , texture : rl.Texture2D , entity : Entity){
  world.texture[entity] = TextureRender{
    texture = texture
  } 
}


render_entities :: proc(world : ^World){
  for entity in world.entity{
    if position , has_position := &world.positions[entity]; has_position{
      if texture , has_texture := &world.texture[entity]; has_texture{
        rl.DrawTexture(texture.texture , i32(position.x) , i32(position.y) , rl.WHITE)
      }
    }
  }
}

unload_entities :: proc(world : ^World){
  for entity in world.entity{
    if texture , has_texture := &world.texture[entity]; has_texture{
      rl.UnloadTexture(texture.texture)
    }
  }
}