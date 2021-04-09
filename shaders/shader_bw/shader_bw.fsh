//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

vec2 newCoord;

uniform vec4 u_uv;
uniform float offset[240];
uniform int displaced;
uniform int bw;
uniform vec2 unitexel;

void main()
{
	//float posX = (v_vTexcoord.x - u_uv[0]) / (u_uv[2] - u_uv[0]);
	float posY = 240.0 * (v_vTexcoord.y - u_uv[1]) / (u_uv[3] - u_uv[1]);
	if(displaced==1){
		int yy=int(floor(posY));
		float xx=offset[yy];
		newCoord=v_vTexcoord+vec2(xx*unitexel.x,0.0);
	}else{
		newCoord=v_vTexcoord;
	}
		
	vec4 Color = v_vColour * texture2D( gm_BaseTexture,newCoord);
	if(bw==1){
		if(Color.r>0.75){
			gl_FragColor=vec4(0.0,0.0,0.0,Color.a);
		}else{
			gl_FragColor=vec4(1.0,1.0,1.0,Color.a);
		}
	}else{
		gl_FragColor=Color;
	}
    //gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
}
