/* @pjs preload="diceTexture.jpg, rocky.jpg";*/
PImage img; void setup(){
    size(400, 300, P3D);
    img = loadImage("myphoto.png");
}

void texturedCube(){
    pushMatrix();
    translate(-.5, -.5, -.5);
    beginShape(QUADS);
    textureMode(IMAGE); //IMAGEを指定すると画像を切り抜きできる
    texture(img);
    vertex(0, 1, 0, 0, 0);
    vertex(0, 0, 0, 0, 100);
    vertex(1, 0, 0, 100, 100);
    vertex(1, 1, 0, 100, 0);
    vertex(1, 1, 0, 100, 0);
    vertex(1, 0, 0, 100, 100);
    vertex(1, 0, 1, 200, 100);
    vertex(1, 1, 1, 200, 0);
    vertex(0, 1, 1, 200, 0);
    vertex(0, 1, 0, 200, 100);
    vertex(1, 1, 0, 300, 100);
    vertex(1, 1, 1, 300, 0);
    vertex(0, 0, 0, 0, 100);
    vertex(0, 0, 1, 0, 200);
    vertex(1, 0, 1, 100, 200);
    vertex(1, 0, 0, 100, 100);
    vertex(0, 1, 1, 100, 100);
    vertex(0, 0, 1, 100, 200);
    vertex(0, 0, 0, 200, 200);
    vertex(0, 1, 0, 200, 100);
    vertex(1, 1, 1, 200, 100);
    vertex(1, 0, 1, 200, 200);
    vertex(0, 0, 1, 300, 200);
    vertex(0, 1, 1, 300, 100);
    endShape();
    popMatrix();
}

void draw(){
    background(255);
    lights();
    translate(200, 150, -50);
    rotateX(map(mouseY, 0, height, PI, -PI));
    rotateY(map(mouseX, 0, width, -PI, PI));
    scale(150, 150, 150);
    texturedCube(); 
} 