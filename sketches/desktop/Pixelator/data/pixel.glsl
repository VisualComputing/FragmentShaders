uniform sampler2D texture;

varying vec4 vertColor;
varying vec4 vertTexCoord;

uniform float binsize;

void main() {
  int si = int(vertTexCoord.s * binsize);
  int sj = int(vertTexCoord.t * binsize);  
  gl_FragColor = texture2D(texture, vec2(float(si) / binsize, float(sj) / binsize)) * vertColor;  
}
