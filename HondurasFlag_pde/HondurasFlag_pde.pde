final int WIDTH = 360;
final int HEIGHT = 180;
final int width = 20;
final int height = 20;

void setup() {
  size(360, 180);
  background(#00008B);
}

void draw() {
    int r = height / 2, i;
    fill(#FFFFFF);
    rect(0, 60, 360, 60);
    smooth();
    noStroke();
    fill(#00008B);
    //星左上
    beginShape();
    for(i=0; i<5; i++){
        float theta = (2*TWO_PI/5)*i - HALF_PI;
        int x, y;
        x = int(r*cos(theta) + WIDTH/3);
        y = int(r*sin(theta) + HEIGHT/3 + 15);
        vertex(x, y);
    }
    endShape();
    //星左下
    beginShape();
    for(i=0; i<5; i++){
        float theta = (2*TWO_PI/5)*i - HALF_PI;
        int x, y;
        x = int(r*cos(theta) + WIDTH/3);
        y = int(r*sin(theta) + HEIGHT/3 + 45);
        vertex(x, y);
    }
    endShape();
    //星右上
    beginShape();
    for(i=0; i<5; i++){
        float theta = (2*TWO_PI/5)*i - HALF_PI;
        int x, y;
        x = int(r*cos(theta) + 2*WIDTH/3);
        y = int(r*sin(theta) + HEIGHT/3 + 15);
        vertex(x, y);
    }
    endShape();
    //星右下
    beginShape();
    for(i=0; i<5; i++){
        float theta = (2*TWO_PI/5)*i - HALF_PI;
        int x, y;
        x = int(r*cos(theta) + 2*WIDTH/3);
        y = int(r*sin(theta) + HEIGHT/3 + 45);
        vertex(x, y);
    }
    endShape();   
    //星真ん中
    beginShape();
    for(i=0; i<5; i++){
        float theta = (2*TWO_PI/5)*i - HALF_PI;
        int x, y;
        x = int(r*cos(theta) + WIDTH/2);
        y = int(r*sin(theta) + HEIGHT/3 + 30);
        vertex(x, y);
    }
    endShape();   

}
