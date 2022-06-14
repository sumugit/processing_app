//最初に一度だけ実行
void setup() {
    size(400, 20);
    smooth();
    noStroke();
    fill(200, 255, 200);
    ellipseMode(CORNER);
    frameRate(30);
}

int d = 20, x = 0, vx = 1;
//プログラムが終了するまで継続的に呼び出され処理される
void draw() {
    background(255);
    ellipse(x, 0, d, d);
    x += 2*vx;
}
