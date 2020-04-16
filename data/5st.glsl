#ifdef GL_FRAGMENT_PRECISION_HIGH
precision highp float;
#else
precision mediump float;
#endif
float tf = 10.0;
uniform float time;
//uniform int pointerCount;
//uniform vec3 pointers[10];
uniform vec2 resolution;
vec3 arrows[10] ;
float len(vec3 c) {
	return length(c) ;
}


void main(void) {
	float mx = max(resolution.x, resolution.y);
	float mc = 0.0;
	vec3 uv = vec3(cos(gl_FragCoord.xy/ mx*time),sin(time));
	arrows[0] = uv;
	vec3 color0 = uv;
	vec3 color = color0;
    for(int i=1; i<5; i++) {
         arrows[i] =abs(color*(sin(float(i)/tf)*time)) ;
	color += cross(arrows[i-1], arrows[i]);
    }
    if(abs(len(color)) > abs(mc))
			mc = abs(len(color)) ;

	gl_FragColor = vec4(abs(color) /mc, 1.0);
}
