class Trail {
  float[][] grid;
  float[][] tgrid;
  int br = 1;
  int sw = 1;
  float trailMax = 50;

  Trail(int w, int h) {
    grid = new float[w][h];
    tgrid = new float[w][h];

    for (int i = 0; i < w; i++) {
      for (int j = 0; j < h; j++) {
        grid[i][j] = 0;
        tgrid[i][j] = 0;
      }
    }
  }

  float getCell(int x, int y) {
    float t = 0;

    //for(int i = -sw; i < sw; i++){
    //  for(int j = -sw; j < sw; j++)
    //  if((x + i < 0) || (x + i > width - 1)) t += 0;
    //  else if ((y + j < 0) || (y + j > height - 1)) t += 0;
    //  else t += tgrid[x + i][y + j];
    //}
    //return t;
    return tgrid[constrain(x, 0, width - 1)][constrain(y, 0, height - 1)];
  }

  void show() {
    loadPixels();
    for (int i = 0; i < width; i++) {
      for (int j = 0; j < height; j++) {
        int index = i + j * width;
        int amt = int(map(tgrid[i][j], 0, trailMax, 0, 255));
        pixels[index] = color(amt, amt, amt);
        ;
      }
    }
    updatePixels();
  }

  void update() {
    blur();
    decay();
    for (int i = 0; i < width; i++) {
      for (int j = 0; j < height; j++) {
        grid[i][j] = tgrid[i][j];
      }
    }
  }

  void blur() {
    float[][] temp = new float[width][height];
    blurH(grid, temp, br);
    trans(temp);
    blurH(temp, tgrid, br);
    trans(tgrid);
  }

  void blurH(float[][] s, float [][] d, int r) {
    for (int y = 0; y < height; y++) {
      float t = 0;
      for (int kx = -r; kx <= r; kx++) {
        t += s[(width + kx) % width][y];
      }
      d[0][y] = t / (r * 2 + 1);

      for (int x = 1; x < width; x++) {
        t -= s[(width + (x - r - 1)) % width][y]; 
        t += s[(width + (x + r)) % width][y];
        d[x][y] = t / (r * 2 + 1);
      }
    }
  }

  void trans(float[][] i) {
    for (int y = 0; y < height; y++) {
      for (int x = y + 1; x < width; x++) {
        swap(i[x][y], i[y][x]);
      }
    }
  }

  void decay() {
    for (int i = 0; i <width; i++) {
      for (int j = 0; j < height; j++) {
        if (tgrid[i][j] > 1)
          tgrid[i][j] -= 1;
      }
    }
  }
}
