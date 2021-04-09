//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	 vec4 Color = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	if(Color.r>0.75){
		gl_FragColor=vec4(0.0,0.0,0.0,Color.a);
	}else{
		gl_FragColor=vec4(1.0,1.0,1.0,Color.a);
	}
    //gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
}
