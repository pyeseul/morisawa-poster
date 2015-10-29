PImage img;
float y = 0.0;
float w = 0.0;
int i = 0;
color g1, g2;

void setup() {
  
  size(430, 600, P2D);
  
  img = loadImage("morisawa_logo.png");
  
  // define colors for gradient
  g2 = color(102, 102, 255);
  g1 = color(254, 254, 254, 10);
  
  noLoop();
  
}

void draw() {
  
  // draw morisawa logo images
  while (y < height) {
    w = (float)width/(float)(i+1);
    println("test" + y + " " + w);
    i++;
    for (float x = 0; x < width; x+=w) {      
      image (img, x, y, w, w*0.22);
    }
    y+=w*0.22;
  }
  
  // draw gradient
  setGradient(0, 300, width, height, g1, g2);
  
}

void setGradient(int x, int y, float w, float h, color c1, color c2) {
  
  noFill();
  
  for (int i = y; i < y+h; i++) {
    float inter = map(i, y, y+h, 0, 1);
    color c = lerpColor(c1, c2, inter);
    stroke(c);
    line(x, i, x+w, i);
    
  }
}