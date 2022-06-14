final int WIDTH = 360;
final int HEIGHT = 180;
final int width = 20;
final int height = 20;

void setup() {
  size(360, 180);
  background(#00008B);
}

void star(){
    beginShape();
    for(int i = 0; i < 5; i++){
        float theta = 2 * TWO_PI / 5 * i - HALF_PI;
        vertex(.5 * cos(theta), .5 * sin(theta));
        }
    endShape(); 
} 

void draw() {
    int r = height / 2, i;
    fill(#FFFFFF);
    rect(0, 60, 360, 60);
    smooth();
    noStroke();
    fill(#00008B);
    //星左上
    pushMatrix();
    translate(WIDTH/3, HEIGHT/3 + 15);
    scale(20, 20);
    star();
    popMatrix();
    //星左下
    pushMatrix();
    translate(WIDTH/3, HEIGHT/3 + 45);
    scale(20, 20);
    star(); 
    popMatrix();
    //星右上
    pushMatrix();
    translate(2*WIDTH/3, HEIGHT/3 + 15);
    scale(20, 20);
    star(); 
    popMatrix();
    //星右下
    pushMatrix();
    translate(2*WIDTH/3, HEIGHT/3 + 45);
    scale(20, 20);
    star(); 
    popMatrix();
    //星真ん中
    pushMatrix();
    translate(WIDTH/2, HEIGHT/3 + 30);
    scale(20, 20);
    star(); 
    popMatrix();
}
