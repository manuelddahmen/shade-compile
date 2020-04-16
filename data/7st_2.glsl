#ifdef GL_FRAGMENT_PRECISION_HIGH
precision highp float;
#else
precision mediump float;
#endif

uniform vec2 resolution;
uniform float time;
void main(void) {
	vec2 uv = gl_FragCoord.xy / resolution.xy;

	gl_FragColor = vec4(fract(uv*time) , 1.0, 1.0);
}
