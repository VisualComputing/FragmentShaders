import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import nub.primitives.*; 
import nub.core.*; 
import nub.processing.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class raster extends PApplet {





// 1. Nub objects
PShader shader;
Scene scene;
Node node;
Vector v1, v2, v3;
// timing
TimingTask spinningTask;
boolean yDirection;

// 2. Model color to render to
boolean cmy;
// 3. P2D or P3D
String renderer = P3D;

// 4. Window dimension
int dim = 10;

public void settings() {
  size(PApplet.parseInt(pow(2, dim)), PApplet.parseInt(pow(2, dim)), renderer);
}

public void setup() {
  scene = new Scene(this);
  if (scene.is3D())
    scene.setType(Scene.Type.ORTHOGRAPHIC);
  scene.setRadius(width/2);
  scene.fit(1);

  spinningTask = new TimingTask() {
    @Override
    public void execute() {
      scene.eye().orbit(scene.is2D() ? new Vector(0, 0, 1) :
        yDirection ? new Vector(0, 1, 0) : new Vector(1, 0, 0), PI / 100);
    }
  };

  node = new Node() {
    @Override
    public void graphics(PGraphics pg) {
      pg.noStroke();
      pg.beginShape(TRIANGLES);
      pg.fill(255, 0, 0);
      pg.vertex(v1.x(), v1.y());
      pg.fill(0, 255, 0);
      pg.vertex(v2.x(), v2.y());
      pg.fill(0, 0, 255);
      pg.vertex(v3.x(), v3.y());
      pg.endShape();
    }
  };
  // init the triangle that's gonna be rasterized
  randomizeTriangle();
  shader = loadShader("frag.glsl", "vert.glsl");
  // same as:
  //shader = loadShader("frag.glsl");
  // don't forget to ask why?
  shader(shader);
}

public void draw() {
  background(0);
  scene.drawAxes();
  scene.render();
}

public void randomizeTriangle() {
  int low = -width/2;
  int high = width/2;
  v1 = new Vector(random(low, high), random(low, high));
  v2 = new Vector(random(low, high), random(low, high));
  v3 = new Vector(random(low, high), random(low, high));
}

public void keyPressed() {
  if (key == 'r')
    randomizeTriangle();
  if (key == ' ')
    if (spinningTask.isActive())
      spinningTask.stop();
    else
      spinningTask.run();
  if (key == 'y')
    yDirection = !yDirection;
  if (key == 'c') {
    cmy = !cmy;
    shader.set("cmy", cmy);
  }
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "raster" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
