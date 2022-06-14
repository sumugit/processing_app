int width = 400;
int height = 400;

//最初に一度だけ実行
void setup() {
    size(400, 400);
    smooth();
    noStroke();
    fill(200, 255, 200);
    ellipseMode(CORNER);
    frameRate(30);
}

double abs(double a){
    if(a < 0) return -a;
    else return a;
}

int d = 20, x = 0, y=0;
//反発係数は0.8, 空気抵抗係数を0.0005とする
double vx = 5, vy = 5, g = 0.98f, e = 0.8, k = 0.005;
//プログラムが終了するまで継続的に呼び出され処理される
void draw() {
    background(255);
    ellipse(x, y, d, d);
    //速度の更新
    vy += g - k*vy; 
    vx -= k*vx;
    x += vx; y += vy; //これは一コマ当たりの進み(速度)
    //x方向の枠を超えた時
    if(x > width - d){
        x = width - d;
        vx = -1*e*vx; 
    }
    if(x < 0){
        x = 0;
        vx = -1*e*vx;
    }
    //y方向の枠を超えた時
    if(y > height - d){
        y = height - d;
        vy = -1*e*vy + g; //+gすることで直前の速度で計算
    }
    if(y < 0){
        y = 0;
        vy = -1*e*vy + g; //+gすることで直前の速度で計算
    }
}
