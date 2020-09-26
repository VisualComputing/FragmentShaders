PImage pifire;
PShape psfire;

void setup() {
  size(1920, 1080, P3D);  
  pifire = loadImage("fire_breathing.jpg");
  psfire = fireTri(pifire);
}

void draw() {    
  background(0);
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
