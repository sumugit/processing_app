/* @pjs preload="rocky.jpg";*/
PImage img;
void setup(){
    size(400, 300, P3D);
    img = loadImage("myimage.png");
    noStroke();
}

void texturedCube(){
    pushMatrix();
    translate(-.5, -.5, -.5);
    beginShape(QUADS);
    texture(img); //テクスチャーイメージのロード.vertex を定義する前に実行する必要がある.
    textureMode(NORMAL); //テクスチャーモード
    //vertex(x, y, z, u, v)
    /*
    x バーテックスのx座標 (intまたはfloat)
    y バーテックスのy座標 (intまたはfloat)
    z バーテックスのz座標 (intまたはfloat)
    u テクスチャマッピングの水平座標 (intまたはfloat)
    v テクスチャマッピングの垂直座標 (intまたはfloat)
    */
    vertex(0, 1, 0, 0, 0);vertex(0, 0, 0, 0, 1);vertex(1, 0, 0, 1, 1);vertex(1, 1, 0, 1, 0);
    vertex(1, 1, 0, 0, 0);vertex(1, 0, 0, 0, 1);vertex(1, 0, 1, 1, 1);vertex(1, 1, 1, 1, 0);
    vertex(1, 1, 1, 0, 0);vertex(1, 0, 1, 0, 1);vertex(0, 0, 1, 1, 1);vertex(0, 1, 1, 1, 0);
    vertex(0, 1, 1, 0, 0);vertex(0, 0, 1, 0, 1);vertex(0, 0, 0, 1, 1);vertex(0, 1, 0, 1, 0);
    vertex(0, 1, 1, 0, 0);vertex(0, 1, 0, 0, 1);vertex(1, 1, 0, 1, 1);vertex(1, 1, 1, 1, 0);
    vertex(0, 0, 0, 0, 0);vertex(0, 0, 1, 0, 1);vertex(1, 0, 1, 1, 1);vertex(1, 0, 0, 1, 0);
    endShape();
    popMatrix();
}

void draw(){
    background(255);
    lights();
    translate(200, 150, -150);
    rotateX(map(mouseY, 0, height, PI, -PI));
    rotateY(map(mouseX, 0, width, -PI, PI));
    scale(200, 200, 200);
    texturedCube(); 
} 