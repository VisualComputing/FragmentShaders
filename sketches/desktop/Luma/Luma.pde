PImage label;
PShape can;
float angle;

PShader lumaShader;
boolean luma;

void setup() {
  size(1280, 720, P3D);  
  label = loadImage("fire.jpg");
  can = createCan(200, 400, 64, label);
  lumaShader = loadShader("luma.glsl");
}

void draw() {    
  background(0);
  translate(width/2, height/2);
  rotateY(angle);  
  shape(can);  
  angle += 0.01;
}

PShape createCan(float r, float h, int detail, PImage tex) {
  textureMode(NORMAL);
  PShape sh = createShape();
  sh.beginShape(QUAD_STRIP);
  sh.noStroke();
  sh.texture(tex);
  for (int i = 0; i <= detail; i++) {
    float angle = TWO_PI / detail;
    float x = sin(i * angle);
    float z = cos(i * angle);
    float u = float(i) / detail;
    sh.normal(x, 0, z);
    sh.vertex(x * r, -h/2, z * r, u, 0);
    sh.vertex(x * r, +h/2, z * r, u, 1);    
  }
  sh.endShape(); 
  return sh;
}

void keyPressed() {
  luma = !luma;
  if (luma) {
    shader(lumaShader);
  }
  else {
    resetShader();
  }
}
