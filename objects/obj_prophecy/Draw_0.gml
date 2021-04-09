/// @description Insert description here
// You can write your code in this editor
shader_set(shader_bw);

var tex=sprite_get_texture(sprite_index,image_index);
shader_set_uniform_f(_unitexel,texture_get_texel_width(tex),texture_get_texel_height(tex))
var uv = sprite_get_uvs(sprite_index,image_index);
shader_set_uniform_f(_uniUV, uv[0],uv[1], uv[2],uv[3]);
shader_set_uniform_f_array(_offset,displacedLines);
if(displacement) shader_set_uniform_i(_displaced,1);
else shader_set_uniform_i(_displaced,0);
if(bwMode) shader_set_uniform_i(_bw,1);
else shader_set_uniform_i(_bw,0);

draw_self();


shader_reset();
