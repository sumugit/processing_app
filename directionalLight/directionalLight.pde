void setup() {
    size(400, 300, P3D);
    noStroke();
    fill(192);
}

void draw() {
    background(32);
    //directionalLight(r, g, b, nx, ny, nz) (r, g, b)の色で(nx, ny, nz)の平行光線を設定
    directionalLight(255, 255, 255, map(mouseX, 0, width, 1, -1), map(mouseY, 0, height, 1, -1), -1);
    //デフォルト
    //lights();
    translate(100, 150, 0);
    sphere(60);
    translate(200, 0, 0);
    sphere(60);
}
