Sys sys;
Trail trail;
int numpart;

void setup() {
  size(600, 600, FX2D);
  //background(25);
  numpart = int(100);
  sys = new Sys(numpart);
  trail = new Trail(width, height);
}

void draw() {
  //background(25);
  for (int i = 0; i < 1; i++) {
    sys.update();
    trail.update();
  }

  trail.show();
}

void swap(float p, float q) {
   float temp;
   temp = p;
   p = q;
   q = temp;
} 

void mousePressed() {
  saveFrame("output/bleh_###.png");
}
