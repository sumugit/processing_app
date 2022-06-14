int width = 400;
int height = 400;

//最初に一度だけ実行
void setup() {
    size(400, 400);
    smooth();
    noStroke();
    fill(#00008B);
    ellipseMode(CORNER);
    frameRate(30);
}

void star(){
    beginShape();
    for(int i = 0; i < 5; i++){
        float theta = 2 * TWO_PI / 5 * i - HALF_PI;
        vertex(.5 * cos(theta), .5 * sin(theta));
        }
    endShape(); 
}

int d = 20, x0 = 100, y0= 30, x, y, vx = 5, vy = 5, i, r = 50, delta = 0;
//プログラムが終了するまで継続的に呼び出され処理される
void draw() {
    background(255);
    translate(x0, y0);
    scale(100, 100);
    rotate(delta);
    star();
    x0 += vx; y0 += vy;
    delta += 1;
    if(delta == 360) delta = 0;
    if(x0 > width - r){
        x0 = width - r;
        vx = -vx;
    }
    if(x0 < r){
        x0 = r;
        vx = -vx;
    }
    if(y0 > height - r){
        y0 = height - r;
        vy = -vy;
    }
    if(y0 < r) {
        y0 = r;
        vy = -vy;
    }
}
