//最初に一度だけ実行
void setup() {
    size(20, 400);
    smooth();
    noStroke();
    fill(200, 255, 200);
    ellipseMode(CORNER);
    frameRate(30);
}

int d = 20, y = 0, vx = 1;
//プログラムが終了するまで継続的に呼び出され処理される
void draw() {
    background(255);
    ellipse(0, y, d, d);
    y += vx;
    if(y>400) exit();
}
