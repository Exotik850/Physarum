Sys sys;
Trail trail;

void setup() {
  size(600, 600);
  //background(25);
  sys = new Sys(width + height);
  trail = new Trail(width, height);
}

void draw() {
  //background(25);
  sys.update();
  trail.update();
  trail.show();
}

void mousePressed(){
 saveFrame("output/bleh_###.png"); 
}
