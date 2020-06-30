class Trail {
  float[][] grid;
  float[][] tgrid;
  int br = 3;
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
    for (int i = 0; i < grid.length; i++) {
      for (int j = 0; j < grid[i].length; j++) {
        int index = i + j * width;
        int amt = int(map(grid[i][j], 0, trailMax, 0, 255));
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
    for (int y = br; y < height - br; y++) {
      for (int x = br; x < width - br; x++) {
        float total = 0;
        for (int kx = -br; kx <= br; kx++)
          total += grid[x + kx][y];
        tgrid[x][y] = total / (br * 2 + 1);
      }
    }

    for (int x = br; x < width - br; ++x) {
      for (int y = br; y < height - br; ++y) {
        float total = 0;
        for (int ky = -br; ky <= br; ++ky)
          total += grid[x][y + ky];
        tgrid[x][y] = total / (br * 2 + 1);
      }
    }
  }

  void decay() {
    for (int i = 0; i < tgrid.length; i++) {
      for (int j = 0; j < tgrid[i].length; j++) {
        if (tgrid[i][j] > 1)
          tgrid[i][j] -= 1;
      }
    }
  }
}
