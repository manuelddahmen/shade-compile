	#ifdef GL_FRAGMENT_PRECISION_HIGH
precision highp float;
#else
precision mediump float;
#endif

uniform float time;
//uniform int pointerCount;
//uniform vec3 pointers[10];
uniform vec2 resolution;
vec3 arrows[100] ;
vec2 points() {
	return vec2(0.0);
	}
float len(vec3 c) {
	return max(c. x, max(c. y, c. z)) ;
	}
	/*
vec4 abs() {
     return abs
} */
void main(void) {
	float mx = max(resolution.x, resolution.y);
	float mc = 0.0;
	vec3 uv = vec3(cos(gl_FragCoord.xy )/ mx,sin( time));
	//vec3 color = vec3()
	//	uv,
	//	0.25 + 0.5 * sin(time));
	vec3 color0 = uv;
	vec3 color = color0;
    for(int i=0; i<100; i++)
         arrows[i] = abs(color0*(sin(float(i)/10.0)+time)) ;
	for(int i=0; i<100; i++) {
		color += cross(uv, arrows[i]) ;
		}
    if(abs(len(color)) > abs(mc))
			mc = abs(len(color)) ;

	gl_FragColor = vec4(abs(color) /mc, 1.0);
}
