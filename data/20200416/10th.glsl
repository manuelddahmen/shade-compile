#ifdef GL_FRAGMENT_PRECISION_HIGH
precision highp float;
#else
precision mediump float;
#endif
float tf = 10.0;
uniform float time;
uniform vec2 resolution;
const float M = 16.0;
vec3 arrows[int(M)];
float len(vec3 c) {
	return length(c) ;
}
float len(vec2 c) {
	return length(c) ;
}
vec2 random2( vec2 p ) {
    return fract(sin(vec2(dot(p,vec2(127.1,311.7)),
    	dot(p,vec2(269.5,183.3))))*43758.5453);
}
vec2 rotate2d( vec2 center, float angle, vec2 p) {
	mat2 rot = mat2(cos(angle),-sin(angle),
	        sin(angle), cos(angle)) ;
	vec2 p2 = p-center;
	return ( rot*p2) + center;
}
vec3 choose1(vec3 a, vec3 b, vec3 c, int n) {
	if(n==0) return a;
	if(n==1) return b;
	return c;
}
vec3 mixCoord(vec3 p) {
	float s = 1.56789;
	float r1 = s;
	vec3 p0  = fract(p*r1);
	int a1 = int(p0. x) ;
	int a2 =  int(p0.y);
	if(a1==a2)
	     a2 ++;
         int a3 =a1+a2 ;
         if(a1<a2&&a2<a3)
               return p.xyz;
                   if(a2<a1&&a1<a3)
               return p.yxz;
                   if(a3<a1&&a1<a2)
               return p.zxy;
               if(a1<a3&&a3<a2)
               return p.xzy;
                   if(a2<a3&&a3<a1)
               return  p.yzx;
                   if(a3<a2&&a2<a1)
               return p.zyx;
         return p;
}
float floatMod(float x, float y) {
	return float(abs(x) - float(abs(x/y))*y);
	}
vec3 arrow(vec2 xy , int i, int m) {
	vec2 p =


		vec2(
			((resolution.x) )*floatMod(float(i) , float(M)) *float(m) ,
		        (resolution.y) *float(i /m) *float(m))
	         ;

	float p1 = (1./(0.1+sin(distance(p, xy )*time) )) ;
	vec3 p2 = vec3(p1,p1, p1) ;

	return p2;
}

void main(void) {
	float mx = max(resolution.x, resolution.y);
	float mc = 0.0;
	vec2 uv = vec2(gl_FragCoord.xy/mx) ;
	vec3 color=  vec3(0) ;
	int n =int(sqrt(M)) ;
       int m = n*n;
	for(int i=0; i<m ; i++) {
       arrows[i] = arrow(vec2(gl_FragCoord.xy), i, m);
	color += (arrows[i]);
	}
	//choose11(cross(arrows[i-1], arrows[i]), mix(arrows[i-1], arrows[i], time), arrows[i], 0);


	gl_FragColor = vec4(color , 1.0);
}
