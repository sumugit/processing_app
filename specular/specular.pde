void setup() {
    size(400, 300, P3D);
    noStroke();
    fill(192);    
}

void draw() {
    sphereDetail(int(map(mouseX, 0, width, 3, 200)));
    background(32);
    lightFalloff(255, 255, 255);
    directionalLight(255, 255, 255, -.5, .5, -1);
    translate(100, 150, 0);
    //specular(value1, value2, value3, alpha);鏡面反射の色を設定
    specular(255, 255, 255);
    sphere(60);
    translate(200, 0, 0);
    specular(255, 0, 0);
    sphere(60);
}
