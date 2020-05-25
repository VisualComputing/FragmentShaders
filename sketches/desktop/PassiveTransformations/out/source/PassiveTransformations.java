import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import nub.core.*; 
import nub.primitives.*; 
import nub.processing.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class PassiveTransformations extends PApplet {





Graph graph;
Node[] nodes;
PShader shader;

public void settings() {
  size(800, 800, P3D);
}

public void setup() {
  graph = new Graph(g, width, height);
  graph.setMatrixHandler(new MatrixHandler() {
      @Override
      protected void _setUniforms() {
        shader(shader);
        Scene.setUniform(shader, "nub_transform", transform());
      }
    });
  graph.setFOV(PI / 3);
  graph.fit(1);
  nodes = new Node[50];
  for (int i = 0; i < nodes.length; i++) {
    nodes[i] = new Node() {
      @Override
      public void visit() {
        pushStyle();
        fill(isTagged(graph) ? 0 : 255, 0, 255);
        box(5);
        popStyle();
      }
    };
    graph.randomize(nodes[i]);
    nodes[i].setPickingThreshold(20);
  }
  //discard Processing matrices
  resetMatrix();
  shader = loadShader("frag.glsl", "vert.glsl");
}

public void draw() {
  background(0);
  //resetMatrix();
  graph.preDraw();
  graph.render();
}

public void mouseMoved() {
  graph.updateTag(mouseX, mouseY, nodes);
}

public void mouseDragged() {
  if (mouseButton == LEFT)
    graph.spin(pmouseX, pmouseY, mouseX, mouseY);
  else if (mouseButton == RIGHT)
    graph.translate(mouseX - pmouseX, mouseY - pmouseY, 0, 0);
  else
    graph.scale(mouseX - pmouseX);
}

public void mouseWheel(MouseEvent event) {
  graph.scale(event.getCount() * 20);
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "PassiveTransformations" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
