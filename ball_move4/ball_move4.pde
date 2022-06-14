int width = 50;
int height = 400;

//最初に一度だけ実行
void setup() {
    size(50, 400);
    smooth();
    noStroke();
    fill(200, 255, 200);
    ellipseMode(CORNER);
    frameRate(30);
}

int d = 30, x = 10, y= 0, vx = 5, vy = 5;
//プログラムが終了するまで継続的に呼び出され処理される
void draw() {
    background(255);
    ellipse(x, y, d, d);
    y += vy;
    if(y > height - d){
        y = height - d;
        vy = -vy;
    }
    if(y < 0) {
        y = 0;
        vy = -vy;
    }
}
