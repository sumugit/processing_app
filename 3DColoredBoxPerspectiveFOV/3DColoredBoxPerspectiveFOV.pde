void setup(){
    size(400, 300, P3D);
    noStroke();
}

void coloredCube(float alpha){
    pushMatrix();
    scale(.5, .5, .5);
    beginShape(QUADS);
    fill(255, 0, 0, alpha);
    vertex(1, -1, -1);
    vertex(1, -1, 1);
    vertex(1, 1, 1);
    vertex(1, 1, -1); // Red
    fill(0, 255, 0, alpha);
    vertex(1, 1, 1);
    vertex(-1, 1, 1);
    vertex(-1, 1, -1);
    vertex(1, 1, -1); // Green
    fill(0, 0, 255, alpha);
    vertex(-1, 1, 1);
    vertex(1, 1, 1);
    vertex(1, -1, 1);
    vertex(-1, -1, 1); // Blue
    fill(255, 255, 0, alpha);
    vertex(-1, -1, -1);
    vertex(-1, -1, 1);
    vertex( 1, -1, 1);
    vertex( 1, -1, -1); // Yellow
    fill(255, 0, 255, alpha);
    vertex(-1, 1, -1);
    vertex(-1, 1, 1);
    vertex(-1, -1, 1);
    vertex(-1, -1, -1); // Magenta
    fill(0, 255, 255, alpha);
    vertex(1, 1, -1);
    vertex(-1, 1, -1);
    vertex(-1, -1, -1);
    vertex(1, -1, -1); // Cyan
    endShape();
    popMatrix();
}

void draw(){
    background(255);
    lights();
    float fov = map(mouseY, 0, height, PI / 9, 8 * PI / 9); 
    float cameraZ = (height / 2) / tan(fov / 2);
    //視野角, 縦横の比率, 近い面までの距離, 遠い面までの距離
    perspective(fov, float(width) / float(height), cameraZ / 10, cameraZ * 10);
    pushMatrix();
    translate(200, 150, -50);
    rotateX(-PI / 8);
    rotateY(-PI / 6);
    pushMatrix();
    scale(100, 100, 100);
    coloredCube(255);
    popMatrix();
    popMatrix();
} 