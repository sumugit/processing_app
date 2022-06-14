void setup(){
    size(400, 300, P3D);
    noStroke();
}

void draw(){
    background(255);
    lights();
    //camera(視点X, 視点Y, 視点Z, 中心点X, 中心点Y, 中心点Z, 天地X, 天地Y, 天地Z);
    camera(200, -150, 200, 0, 0, 0, 0, 1, 0);
    scale(100, 100, 100);
    coloredCube(255);
}

void coloredCube(float alpha){
    pushMatrix();
    scale(.5, .5, .5);
    beginShape(QUADS);
    fill(255, 0, 0, alpha); 
    vertex(1, -1, -1); vertex(1, -1, 1);vertex(1, 1, 1); vertex(1, 1, -1); // Red
    fill(0, 255, 0, alpha); 
    vertex(1, 1, 1); vertex(-1, 1, 1); vertex(-1, 1, -1); vertex(1, 1, -1); // Green
    fill(0, 0, 255, alpha);
    vertex(-1, 1, 1); vertex(1, 1, 1); vertex(1, -1, 1); vertex(-1, -1, 1); // Blue
    fill(255, 255, 0, alpha); 
    vertex(-1, -1, -1); vertex(-1, -1, 1); vertex( 1, -1, 1); vertex( 1, -1, -1); // Yellow
    fill(255, 0, 255, alpha); 
    vertex(-1, 1, -1); vertex(-1, 1, 1); vertex(-1, -1, 1); vertex(-1, -1, -1); // Magenta
    fill(0, 255, 255, alpha);
    vertex(1, 1, -1); vertex(-1, 1, -1); vertex(-1, -1, -1); vertex(1, -1, -1); // Cyan
    endShape();
    popMatrix();
    } 