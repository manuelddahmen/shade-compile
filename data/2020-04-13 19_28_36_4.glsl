				#ifdef GL_FRAGMENT_PRECISION_HIGH
precision highp float;
#else
precision mediump float;
#endif

uniform float time;
//uniform int pointerCount;
//uniform vec3 pointers[10];
uniform vec2 resolution;
vec2 arrows[100] ;



void main(void) {
	float mx = max(resolution.x, resolution.y);
	float mc = 0.0;
	vec2 uv = gl_FragCoord.xy / mx;
	//vec3 color = vec3()
	//	uv,
	//	0.25 + 0.5 * sin(time));
	vec3 color = vec3(0.0,0.0,0.0);
    for(int i=0; i<100; i++)
         arrows[i] = vec2(100.0, 100.0);
	for(int i=0; i<100; i++) {
		color += color /distance(gl_FragCoord.xy, arrows[i])
		 		 * mx ;
		if(max(color.x, max(color.y, color.z))>mc)
			mc = max(color.x, max(color.y, color.z));
		}
	//}

	gl_FragColor = vec4(color/mc, 1.0);
}
