-------------------------------------------------------------------------------
-- Copyright (C) Hispidence 2013-2021
--
--
-- shaders.lua
--
-- Shader source code
-------------------------------------------------------------------------------
local m = {}


m.invisShaderSource = [[
vec4 effect(vec4 colour, Image texture, vec2 texture_coords, vec2 screen_coords) {
  vec4 result = vec4(0.0f, 0.0f, 0.0f, 0.0f);// Texel(texture, texture_coords);
  return result;
  }
]]



---------------------------------------------------------------------------------------------------
--	fadeShaderSource
--	
--  Used when the player character dies. It fades the game to black, and then fades the game
--  back in once the game has reset its state to the last checkpoint
---------------------------------------------------------------------------------------------------
m.fadeShaderSource = [[
  uniform vec3 fadeTo;
  uniform float fadeFactor;

  vec4 effect(vec4 colour, Image texture, vec2 texture_coords, vec2 screen_coords) {
    vec4 result;
    vec4 col = Texel(texture, texture_coords);
    vec4 fade = vec4(fadeTo, col.a);
    result = (col * (1.0f - fadeFactor)) + (fade * fadeFactor);
    return result;
  }
]]



---------------------------------------------------------------------------------------------------
--	debugShaderWorldSource
--	
--  Used to make the game darker when debugging, so the collision shape lines show up more
--  prominently
---------------------------------------------------------------------------------------------------
m.debugShaderWorldSource = [[
  vec4 effect(vec4 colour, Image texture, vec2 texture_coords, vec2 screen_coords) {
    vec4 result = Texel(texture, texture_coords);
    result.xyz = result.xyz * 0.75;
    return result;
  }
]]



---------------------------------------------------------------------------------------------------
--	debugShaderDebugSource
--	
--  Used to make the game darker when debugging, so the collision shape lines show up more
--  prominently
---------------------------------------------------------------------------------------------------
m.debugShaderDebugSource = [[
  vec4 effect(vec4 colour, Image texture, vec2 texture_coords, vec2 screen_coords) {
    vec4 result = Texel(texture, texture_coords);
    result.w = result.w * 0.5;
    return result;
  }
]]

return m
