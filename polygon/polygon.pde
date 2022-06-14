int width = 100;
int height = 100;

void setup() {
    size(100, 100);
    noStroke();
    fill(144, 238, 144);
    smooth();
    frameRate(1);
}

void nPolygon(int n, int r){
    beginShape();
    for(int i = 0; i < n; i++)
        vertex(r*cos(i*TWO_PI/n - HALF_PI) + r, r*sin(i*TWO_PI/n - HALF_PI) + r);
    endShape();
}

int vertexNum = 3;
void draw(){
    background(255);
    if(vertexNum < 30) nPolygon(vertexNum++, width/2);
    else vertexNum = 3;
}