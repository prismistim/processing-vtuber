import gab.opencv.*;
import java.awt.Rectangle;
import processing.video.*;

Capture video;
OpenCV opencv;
Rectangle[] faces;
PImage kao;

int a;

void setup() {
  size(1280, 960);
  background(0);
  String[] cameras = Capture.list();
  println(cameras);
  kao = loadImage("1.png");
  video =new Capture(this, width/2, height/2, cameras[2]);
  opencv=new OpenCV(this, width/2, height/2);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);
  video.start();
}

void draw() {
  background(255);
  scale(2);
  opencv.loadImage(video);
  pushMatrix();
  scale(-1, 1);
  // image(video, -width/2, 0);
  popMatrix();

  Rectangle[] faces =opencv.detect();
  opencv.loadImage(video);
  strokeWeight(3);
  stroke(255, 255);
  fill(255,0,0, 127);
  strokeWeight(3);

  for ( int i = 0; i <faces.length; i ++) {
    pushMatrix();
    scale(-1, 1);
    translate(-width/2, 0);
    noFill();
    image(kao, faces[i].x, faces[i].y, faces[i].width, faces[i].height);
    popMatrix();
    
  }
  a++;
  if (a == 6)
    a = 1;
  kao = loadImage( a + ".png");
}



void captureEvent(Capture c) {
  c.read();
}