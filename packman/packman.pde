int width = 600;
int height = 100;

//最初に一度だけ実行
void setup() {
    size(600, 100);
    smooth();
    noStroke();
    fill(#ffff66);
    ellipseMode(CORNER);
    frameRate(30);
}

int d = 100, x = 0, interval = 0, vx = 1, count = 0, i = 1, theta = 0;
//プログラムが終了するまで継続的に呼び出され処理される
void draw() {
    background(0);
    if(theta > 25){
        theta = 50 - count;
        if(theta < 0){
            theta = 0;
            count = 0;
        }
    }
    if(x > width - d){
        x = 2*(width - d) - interval;
        if(x < 0){
            x = 0;
            interval = 0;
        }
    }
    if(interval > width - d){
        arc(x, 0, d, d, radians(0), radians(180 - theta));
        arc(x, 0, d, d, radians(180 + theta), radians(360));
    }
    else arc(x, 0, d, d, radians(theta), radians(360 - theta));    
    interval += 3*vx;
    x = interval;
    count += 1;
    theta = count;
}
