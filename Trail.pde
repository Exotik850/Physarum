class Trail {
  float[][] grid;
  float minVal = 0;
  float maxVal = 200;
  int br = 1;
  float d = 1;

  Trail(int x, int y) {
    grid = new float[x][y];
    for (int i = 0; i < x; i++) {
      for (int j = 0; j < y; j++) {
        grid[i][j] = 0;
      }
    }
  }

  void show() {
    loadPixels();
    for (int i = 0; i < width - 1; i++) {
      for (int j = 0; j < height - 1; j++) {
        int index = i + j * width;
        int amt = int(map(grid[i][j], minVal, maxVal, 0, 255));
        pixels[index] = color(amt, amt, amt);
      }
    }
    updatePixels();
  }

  void update() {
    blur();
    decay();
  }

  void blur() {
    float[][] temp = new float[width][height];

    for (int y = br; y < height - br; y++) {
      for (int x = br; x < width - br; x++) {
        float total = 0;
        for (int kx = -br; kx <= br; kx++)
          total += grid[x + kx][y];
        temp[x][y] = total / (br * 2 + 1);
      }
    }
    for (int i = 0; i < width; i++) {
      for (int j = 0; j < height; j++) {
        grid[i][j] = temp[i][j];
      }
    }
    for (int x = br; x < width - br; ++x) {
      for (int y = br; y < height - br; ++y) {
        float total = 0;
        for (int ky = -br; ky <= br; ++ky)
          total += grid[x][y + ky];
        grid[x][y] = total / (br * 2 + 1);
      }
    }
  }


  void decay() {
    for (int i = 0; i < width - 1; i++) {
      for (int j = 0; j < height - 1; j++) {
        grid[i][j] -= d;
      }
    }
  }
}
