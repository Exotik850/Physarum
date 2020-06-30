Sys sys;
Trail trail;

void setup() {
  size(600, 600);
  //background(25);
  sys = new Sys(1000);
  trail = new Trail(width, height);
}

void draw() {
  //background(25);
  sys.update();
  trail.update();
  //trail.show();
}

void swap(float a, float b) {
  float temp = a;
  a = b;
  b = temp;
}

void mousePressed(){
 saveFrame("output/bleh_###.png"); 
}
