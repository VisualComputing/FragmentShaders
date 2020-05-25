varying vec4 vertColor;
uniform bool cmy;

void main() {
  gl_FragColor = cmy ? vec4(1-vertColor.r, 1-vertColor.g, 1-vertColor.b, vertColor.a) : vertColor;
}
