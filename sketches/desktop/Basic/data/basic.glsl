uniform int width;
uniform int height;

void main() {   
  if(gl_FragCoord.y < height / 4)
    gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
  else if(gl_FragCoord.y > height / 4 && gl_FragCoord.y < height / 2)
    gl_FragColor = vec4(0.0, 0.0, 1.0, 1.0);
  else
    gl_FragColor = vec4(1.0, 1.0, 0.0, 1.0);
}  
