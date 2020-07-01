class Cell {
  PVector pos;
  float sensLength = 9;
  float sensTheta = radians(10);
  float turnTheta = radians(10);
  float speed = 1;
  float resid = 5;


  Cell(float x, float y) {
    pos = new PVector(x, y);
    pos.rotate(map(random(1), 0, 1, 0, TWO_PI));
    //pos.rotate(pos.heading() - atan2(height / 2 - pos.y, width / 2 - pos.x));
  }

  void update() {
    float[] phl = new float[3];
    phl[0] = ((pos.x > 0) || (pos.x < width)) || ((pos.y > 0) || (pos.y < height)) ? trail.getCell(int(sensLength * cos(pos.heading() - sensTheta) + pos.x), int(sensLength * sin(pos.heading() - sensTheta) + pos.y)) : 0;
    phl[1] = ((pos.x > 0) || (pos.x < width)) || ((pos.y > 0) || (pos.y < height)) ? trail.getCell(int(sensLength * cos(pos.heading()) + pos.x), int(sensLength * sin(pos.heading()) + pos.y)): 0;
    phl[2] = ((pos.x > 0) || (pos.x < width)) || ((pos.y > 0) || (pos.y < height)) ? trail.getCell(int(sensLength * cos(pos.heading() + sensTheta) + pos.x), int(sensLength * sin(pos.heading() + sensTheta) + pos.y)): 0;
 
    float ang;
    float ma = phl[1] + phl[0];
    float ml = phl[1] + phl[2];
    
    ang = (ma > ml) ? -turnTheta : turnTheta;
    

    if (trail.grid[int(constrain(pos.x, 0, width - 1))][int(constrain(pos.y, 0, height - 1))] + resid < trail.trailMax)
      trail.grid[int(constrain(pos.x, 0, width - 1))][int(constrain(pos.y, 0, height - 1))] += resid;
    //push();
    //translate(pos.x, pos.y);
    //pos.rotate(ang + map(random(1), 0, 1, -HALF_PI / 160, HALF_PI / 160));
    pos.rotate(-ang);
    //pop();
    pos.x = (width + (speed * cos(pos.heading()) + pos.x)) % width;
    pos.y = (height + (speed * sin(pos.heading()) + pos.y)) % height;
    //circle(pos.x, pos.y, 3);
  }
}
