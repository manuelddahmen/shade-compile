#ifdef GL_FRAGMENT_PRECISION_HIGH
precision highp float;
#else
precision mediump float;
#endif
float tf = 10.0;
uniform float time;
uniform vec2 resolution;
vec3 arrows[10] ;
float len(vec3 c) {
	return length(c) ;
}

vec2 random2( vec2 p ) {
    return fract(sin(vec2(dot(p,vec2(127.1,311.7)),
    	dot(p,vec2(269.5,183.3))))*43758.5453);
}
vec2 rotate2d( vec2 center, float angle, vec2 p) {
	mat2 rot =
	mat2(cos(6.3*angle),-sin(6.3*angle),
	        sin(6.3*angle), cos(6.3*angle)) ;
	vec2 p2 = p-center;
	return ( rot*p2) + center;
}


void main(void) {
	float mx = max(resolution.x, resolution.y);
	float mc = 0.0;
	vec2 uv = vec2(gl_FragCoord.xy/mx);
	arrows[0] = vec3(rotate2d(uv*time , length(uv),
		 uv), 1.0) ;
	vec3 color0 = arrows[0];
	vec3 color = color0;
    for(int i=1; i<10; i++) {
         arrows[i] = fract(sin(arrows[0]))-arrows[i-1] ;
	color += cross(arrows[i-1], arrows[i]);
    }
    if(abs(len(color)) > abs(mc))
			mc = abs(len(color)) ;

	gl_FragColor = vec4(abs(color/mc) , 1.0);
}
