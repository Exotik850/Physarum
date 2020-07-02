class Cell {
  float x;
  float y;
  float ang;
  float resid = 5;
  float speed = 1;
  float sLength = 9;
  float sTheta = radians(22.5);
  float turnTheta = radians(45);



  Cell(float x_, float y_) {
    x = x_;
    y = y_;
    ang = map(random(1), 0, 1, 0, TWO_PI);
  }

  void update() {
    if (((x + (speed * cos(ang)) < 0) || ((x + (speed * cos(ang))) > width - 1)) || ((y + (speed * sin(ang))) < 0) || (y + (speed * sin(ang))) > height - 1) ang += PI;
    
    float F = trail.grid[int(x + speed * cos(ang))][int(y + speed * sin(ang))];
    float FR = trail.grid[int(x + speed * cos(ang + sTheta))][int(y + speed * sin(ang + sTheta))];
    float FL = trail.grid[int(x + speed * cos(ang - sTheta))][int(y + speed * sin(ang - sTheta))];

    if ((F > FL) && (F > FR)) ang += 0;
    else if ((F < FL) && (F < FR)) ang += turnTheta * int(random(-1, 1));
    else if (FL < FR) ang += turnTheta;
    else if (FR < FL) ang -= turnTheta;
    else ang += 0;

    x += speed * cos(ang);
    y += speed * sin(ang);
    point(x, y);
    trail.grid[int(x)][int(y)] += resid;
  }
}
