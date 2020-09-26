PImage pifire;
PShape psfire;
PShader pshader;

void setup() {
  size(1920, 1080, P2D);  
  pifire = loadImage("fire_breathing.jpg");
  psfire = fireTri(pifire);
  pshader = loadShader("texfrag.glsl");
  shader(pshader);
}

void draw() {    
  background(0);
  pshader.set("binsize", 100.0 * float(mouseX) / width);
  shape(psfire);
}

PShape fireTri(PImage tex) {
  textureMode(NORMAL);
  PShape sh = createShape();
  sh.beginShape(QUAD);
  sh.noStroke();
  sh.texture(tex);
  sh.vertex(0, 0, 0, 0);
  sh.vertex(width, 0, 1, 0);
  sh.vertex(width, height, 1, 1);
  sh.vertex(0, height, 0, 1);
  sh.endShape(); 
  return sh;
}
