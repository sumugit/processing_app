final int WIDTH = 360;
final int HEIGHT = 240;
final int width = 20;
final int height = 20;

void setup() {
  size(360, 240);
  background(#de2910);
  //drawGrid();
}

void star(){
    beginShape();
    for(int i = 0; i < 5; i++){
        float theta = 2 * TWO_PI / 5 * i - HALF_PI;
        vertex(.5 * cos(theta), .5 * sin(theta));
        }
    endShape(); 
} 

void drawGrid(){
    int x = 0, y = 0, interval = WIDTH/30;
    stroke(#ffde00);
    while(y <= HEIGHT/2){
        line(0, y, WIDTH/2, y);
        y += interval;
    }while(x <= WIDTH/2){
        line(x, 0, x, HEIGHT/2);
        x += interval;
    }
} 

void draw() {
    int r = height / 2, i;
    smooth();
    noStroke();
    fill(#ffde00);
    //大金星
    pushMatrix();
    translate(WIDTH/6, HEIGHT/4);
    scale(3*HEIGHT/10, 3*HEIGHT/10);
    star();
    popMatrix();
    //星1
    pushMatrix();
    translate(WIDTH/3, HEIGHT/10);
    scale(HEIGHT/10, HEIGHT/10);
    rotate(-36);
    star(); 
    popMatrix();
    //星2
    pushMatrix();
    translate(2*WIDTH/5, HEIGHT/5);
    scale(HEIGHT/10, HEIGHT/10);
    rotate(-72);
    star(); 
    popMatrix();
    //星3
    pushMatrix();
    translate(2*WIDTH/5, 7*HEIGHT/20);
    scale(HEIGHT/10, HEIGHT/10);
    rotate(0);
    star(); 
    popMatrix();
    //星4
    pushMatrix();
    translate(WIDTH/3, 9*HEIGHT/20);
    scale(HEIGHT/10, HEIGHT/10);
    rotate(-144);
    star(); 
    popMatrix();
}
