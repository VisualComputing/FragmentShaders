uniform mat4 modelview;
uniform mat4 transform;
uniform mat3 normalMatrix;
uniform vec4 lightPosition;

attribute vec4 position;
attribute vec4 color;
attribute vec3 normal;

varying vec4 vertColor;

void main() {
  gl_Position = transform * position;    
  vec3 ecPosition = vec3(modelview * position);  
  vec3 ecNormal = normalize(normalMatrix * normal);
  vec3 lightDirection = normalize(lightPosition.xyz - ecPosition);
  vec3 cameraDirection = normalize(0 - ecPosition);
  vec3 lightDirectionReflected = reflect(-lightDirection, ecNormal);
  float intensity = max(0.0, dot(lightDirectionReflected, cameraDirection));
  vertColor = vec4(intensity, intensity, intensity, 1) * color;             
}
