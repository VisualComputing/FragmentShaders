PShape psfire;
PShader pshader;
boolean retainedMode;

void setup() {
  size(1920, 1080, P3D);
  psfire = fireTri();
  pshader = loadShader("basic.glsl");
  pshader.set("width", width);
  pshader.set("height", height);
  shader(pshader);
}

void draw() {
  background(0);
  if (retainedMode) {
    shape(psfire);
  } else {
    beginShape(QUAD);
    noStroke();
    vertex(0, 0);
    vertex(width, 0);
    vertex(width, height);
    vertex(0, height);
    endShape();
  }
}

PShape fireTri() {
  PShape sh = createShape();
  sh.beginShape(QUAD);
  sh.noStroke();
  sh.vertex(0, 0);
  sh.vertex(width, 0);
  sh.vertex(width, height);
  sh.vertex(0, height);
  sh.endShape();
  return sh;
}

void keyPressed() {
  retainedMode = !retainedMode;
}
