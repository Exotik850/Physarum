class Trail {
  float[][] grid;
  float[][] tgrid;
  int br = 5;
  float trailMax = 100;

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
    return tgrid[x][y];
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
    for (int y = 0; y < height; y++) {
      for (int x = 0; x < width; x++) {
        float total = 0;
        for (int kx = -br; kx <= br; kx++)
          total += grid[(width + (x + kx)) % width][y];
        tgrid[x][y] = total / (br * 2 + 1);
      }
    }
    for (int i = 0; i < width; i++) {
      for (int j = 0; j < height; j++) {
        grid[i][j] = tgrid[i][j];
      }
    }

    for (int x = 0; x < width; x++) {
      for (int y = 0; y < height; ++y) {
        float total = 0;
        for (int ky = -br; ky <= br; ky++)
          total += grid[x][(height + (y + ky)) % height];
        tgrid[x][y] = total / (br * 2 + 1);
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
