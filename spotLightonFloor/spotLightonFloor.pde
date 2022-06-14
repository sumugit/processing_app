void setup() {
    size(400, 300, P3D);
    noStroke();
}

void drawFloor() {
    fill(128);
    int s = 5;
    for(int z = -100; z < 100; z += s) {
        for (int x = -100; x < 100; x += s) {
            beginShape(QUADS);
            vertex(x, 0, z); vertex(x, 0, z + s);
            vertex(x + s, 0, z + s); vertex(x + s, 0, z);
            endShape();
        }
    }
}

void draw() {
    background(192);
    lights();
    translate(200, 200, -50);
    rotateX(radians(160));
    rotateY(radians(-30));
    spotLight(255, 255, 255, 50, 50, -50, -1, -1, 1, PI/2, 100);
    drawFloor();
}
