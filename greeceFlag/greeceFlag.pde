final int WIDTH = 270;
final int HEIGHT = 180;
final int INTERVAL = 40;

size(270, 180);
background(#FFFFFF);

for(int i=0; i<HEIGHT; i += INTERVAL){
    noStroke();
    fill(#0039A6);
    rect(0, i, WIDTH, INTERVAL/2);
}

//左上部分の描画
rect(0, 0, 100, 100);
fill(#FFFFFF);
rect(40, 0, 20, 100);
rect(0, 40, 100, 20);