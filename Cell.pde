class Cell {
  PVector pos;
  PVector vel;
  float sensLength = 10;
  float sensTheta = radians(45);
  float speed = 3;
  float resid = 3;


  Cell(float x, float y) {
    pos = new PVector(x, y);
    //pos.rotate(pos.heading() - atan2(height / 2 - pos.y, width / 2 - pos.x));
  }

  void update() {
    float[] phl = new float[3];
    phl[1] = trail.getCell(int((width + (sensLength * cos(pos.heading() - sensTheta))) % width), int((height + (sensLength * sin(pos.heading() - sensTheta)))) % height);
    phl[0] = trail.getCell(int((width + (sensLength * cos(pos.heading()))) % width), int((height + (sensLength * sin(pos.heading())))) % height);
    phl[2] = trail.getCell(int((width + (sensLength * cos(pos.heading() + sensTheta))) % width), int((height + (sensLength * sin(pos.heading() + sensTheta)))) % height);

    float max = 0;
    int num = 0;

    for (int i = -1; i < 1; i++) {
      if (phl[i + 1] > max) {
        max = phl[i + 1];
        num = i;
      }
    }
    trail.tgrid[int((width + pos.x) % width)][int((height + pos.y) % height)] += resid;
    pos.rotate(num * -sensTheta);
    pos.x = (width + (speed * cos(pos.heading()))) % width;
    pos.y = (height + (speed * sin(pos.heading()))) % height;
    circle(pos.x, pos.y, 3);
  }
}
