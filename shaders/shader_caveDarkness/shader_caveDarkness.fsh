//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	vec4 Color = texture2D( gm_BaseTexture, v_vTexcoord );
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	gl_FragColor=vec4(112.0/255.0,93.0/255.0,176.0/255.0,Color.a);
}
