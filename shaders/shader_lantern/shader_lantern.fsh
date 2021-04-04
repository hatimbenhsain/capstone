//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float brasierX;
uniform float brasierY;

//uniform float baseA=0.8;

void main()
{
	//float xx=v_vTexcoord.x*
	float darkA=sqrt(pow((v_vTexcoord.x-brasierX), 2.0)+pow(v_vTexcoord.y-brasierY, 2.0));
	//darkA=darkA/180.0;
	if(darkA>1.0){
		darkA=1.0;	
	}
	
	//darkA=0.0;
	
	vec4 Color = texture2D( gm_BaseTexture, v_vTexcoord );
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	gl_FragColor=vec4(0.0,0.0,0.0,Color.a*darkA);
}
