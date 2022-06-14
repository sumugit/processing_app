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
    //êØç∂è„
    beginShape();
    for(i=0; i<5; i++){
        float theta = (2*TWO_PI/5)*i - HALF_PI;
        int x, y;
        x = int(r*cos(theta) + WIDTH/3);
        y = int(r*sin(theta) + HEIGHT/3 + 15);
        vertex(x, y);
    }
    endShape();
    //êØç∂â∫
    beginShape();
    for(i=0; i<5; i++){
        float theta = (2*TWO_PI/5)*i - HALF_PI;
        int x, y;
        x = int(r*cos(theta) + WIDTH/3);
        y = int(r*sin(theta) + HEIGHT/3 + 45);
        vertex(x, y);
    }
    endShape();
    //êØâEè„
    beginShape();
    for(i=0; i<5; i++){
        float theta = (2*TWO_PI/5)*i - HALF_PI;
        int x, y;
        x = int(r*cos(theta) + 2*WIDTH/3);
        y = int(r*sin(theta) + HEIGHT/3 + 15);
        vertex(x, y);
    }
    endShape();
    //êØâEâ∫
    beginShape();
    for(i=0; i<5; i++){
        float theta = (2*TWO_PI/5)*i - HALF_PI;
        int x, y;
        x = int(r*cos(theta) + 2*WIDTH/3);
        y = int(r*sin(theta) + HEIGHT/3 + 45);
        vertex(x, y);
    }
    endShape();   
    //êØê^ÇÒíÜ
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