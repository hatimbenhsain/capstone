//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec4 u_uv;
uniform float brasierX;
uniform float brasierY;

//uniform float baseA=0.8;

void main()
{
	//float xx=v_vTexcoord.x*
	float posX = (v_vTexcoord.x - u_uv[0]) / (u_uv[2] - u_uv[0]);
	float posY = (v_vTexcoord.y - u_uv[1]) / (u_uv[3] - u_uv[1]);
	float darkA=sqrt(pow((posX-brasierX), 2.0)+pow(posY-brasierY, 2.0));
	//darkA=darkA/180.0;
	//darkA=darkA*2.0;
	//darkA=pos;
	if(darkA>1.0){
		darkA=1.0;	
	}
	
	//darkA=0.0;
	
	vec4 Color = texture2D( gm_BaseTexture, v_vTexcoord );
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	gl_FragColor=vec4(0.0,0.0,0.0,gl_FragColor.a*darkA);
	//gl_FragColor=vec4(0.0,0.0,0.0,darkA);
}
