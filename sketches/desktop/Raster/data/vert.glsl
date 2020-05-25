// Pattern 1: variables are sent by processing
uniform mat4 transform;
attribute vec4 position;
attribute vec4 color;
varying vec4 vertColor;

void main() {
  // Pattern 2: data among shaders
  vertColor = color;
  // Patter 3: consistency of geometry operations
  // gl_Position should be defined in clipspace
  gl_Position = transform * position;
}
