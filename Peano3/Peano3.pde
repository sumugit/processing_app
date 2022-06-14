static final int[][] dirs = { { 1, 0 }, { 0, -1 }, { -1, 0 }, { 0, 1 }};

int n = 0;
float px, py, dist;

// 指定方向へ単位直線を描画する

void turtle(int dir) {
  dir = dir & 3;
  //println(dir);
  float nx = px + dirs[dir][0] * dist;
  float ny = py + dirs[dir][1] * dist;
  line(px, py, nx, ny);
  px = nx;
  py = ny;
}

// 指定レベルのヒルベルト曲線を描く
// dirはペンの(このレベルでの)最終的な移動方向。
// spinは右回りか左回りかを示す。

void hilbert(int level, int dir, int spin) {
  if (level == 0) return;

  hilbert(level - 1, dir + spin, -spin);
  turtle(dir + spin);
  //hilbert(level - 1, dir - 2*spin, spin); // (A)
  //turtle(dir);
  //hilbert(level - 1, ...); // (B)
  //turtle(dir - spin)
  hilbert(level - 1, dir, spin); // (C)
}

// level 1～7を繰り返し描画

void setup() {
  size(800, 800);
  textFont(createFont("Tempus Sans ITC", 24));
  fill(0);
  smooth(); 
}

void mousePressed(){
    if((mouseButton == LEFT) && (n < 8)) n++;
    else if((mouseButton == RIGHT) && (n > 0)) n--; 
} 

void draw() {
    background(255);
    text("n = " + n, 10, 30);
    int div = 1 << n; //nビット左シフト
    dist = width / (float)div;
    //println(n + ":" + dist);
    px = py = dist / 2;
    hilbert(n, 3, 1);

}