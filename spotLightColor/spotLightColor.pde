int theta = 0;

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
    translate(300, 200, -50);
    rotateX(radians(160));
    rotateY(radians(-30));
    //赤
    spotLight(255, 0, 0, 50*cos(radians(theta)), 50, -50*sin(radians(theta)), -1, -1, 1, PI/2, 50);
    //緑
    spotLight(0, 255, 0, 50*cos(radians(theta + 120)), 50, -50*sin(radians(theta + 120)), -1, -1, 1, PI/2, 50);
    //青
    spotLight(0, 0, 255, 50*cos(radians(theta + 240)), 50, -50*sin(radians(theta + 240)), -1, -1, 1, PI/2, 50);
    translate(-50, 0, 50);
    drawFloor();
    theta++;
    if(theta > 360) theta = 0;
}
