final int WIDTH = 400;
final int HEIGHT = 400;

size(400, 400);
background(255);
colorMode(HSB, 100);

int r = HEIGHT/3;
for(int i=0; i<100; i++) {
    stroke(i, 100, 100);
    float theta = (PI/50)*i - HALF_PI;
    int x, y;
    x = int(r*cos(theta) + WIDTH/2);
    y = int(r*sin(theta) + HEIGHT/2);
    line(WIDTH/2, HEIGHT/2, x, y);
}
fill(#FFFFFF);
noStroke();
ellipse(WIDTH/2, HEIGHT/2, r/2, r/2);