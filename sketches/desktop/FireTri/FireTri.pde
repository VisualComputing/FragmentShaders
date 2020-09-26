PImage pifire;
PShape psfire;

void setup() {
  size(1920, 1080, P2D);  
  pifire = loadImage("fire_breathing.jpg");
  psfire = fireTri(pifire);
}

void draw() {    
  background(0);
  shape(psfire);
}

PShape fireTri(PImage tex) {
  PShape sh = createShape();
  sh.beginShape(TRIANGLE);
  sh.noStroke();
  sh.texture(tex);
  PVector p1, p2, p3;
  p1 = new PVector(random(0, width), random(0, height));
  p2 = new PVector(random(0, width), random(0, height));
  p3 = new PVector(random(0, width), random(0, height));
  sh.vertex(p1.x, p1.y, map(p1.x, 0, width, 0, pifire.width), map(p1.y, 0, height, 0, pifire.height));
  sh.vertex(p2.x, p2.y, map(p2.x, 0, width, 0, pifire.width), map(p2.y, 0, height, 0, pifire.height));
  sh.vertex(p3.x, p3.y, map(p3.x, 0, width, 0, pifire.width), map(p3.y, 0, height, 0, pifire.height));
  sh.endShape(); 
  return sh;
}
