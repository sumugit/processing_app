boolean isAmbientLight = true, isAmbient = true;
boolean isEmissive = true;
void setup() {
    size(600, 400, P3D);
    noStroke();
    fill(255); 
}

void keyPressed() {
    switch(key){
        case 'e':
        isEmissive = !isEmissive;
        break;
        case '1':
        isAmbientLight = !isAmbientLight;
        break;
        case 'a':
        isAmbient = !isAmbient;
        break;
    }
}

 //円柱の作成(長さ,上面の半径,底面の半径)
void pillar(float length, float radius1 , float radius2){
    float x,y,z;
    pushMatrix();
    //底面の作成
    beginShape(TRIANGLE_FAN);
    z = -length / 2;
    vertex(0, 0, z);
    for(int deg = 0; deg <= 360; deg = deg + 10){
        x = cos(radians(deg)) * radius1;
        y = sin(radians(deg)) * radius1;
        vertex(x, y, z);
    }
    endShape();              
    //上面の作成
    beginShape(TRIANGLE_FAN);
    z = length / 2;
    vertex(0, 0, z);
    for(int deg = 0; deg <= 360; deg = deg + 10){
        x = cos(radians(deg)) * radius2;
        y = sin(radians(deg)) * radius2;
        vertex(x, y, z);
    }
    endShape();
    //側面の作成
    beginShape(TRIANGLE_STRIP);
    for(int deg =0; deg <= 360; deg = deg + 5){
        x = cos(radians(deg)) * radius1;
        y = sin(radians(deg)) * radius1;
        z = -length / 2;
        vertex(x, y, z);
        x = cos(radians(deg)) * radius2;
        y = sin(radians(deg)) * radius2;
        z = length / 2;
        vertex(x, y, z);
    }
    endShape();
    popMatrix();
}

void draw() {
    sphereDetail(int(map(mouseX, 0, width, 10, 200)));
    background(32);
    blendMode(SCREEN);
    directionalLight(255, 255, 255, -.5, .5, -1);
    specular(126, 199, 216);
    pushMatrix();
    emissive(0, 0, 0);
    fill(200);
    translate(width/2, height/4 + 25, 0);
    rotateX(PI/2);
    pillar(height/5, 20, 20);
    popMatrix();
    shininess(map(mouseX, 0, width, 1, 500));
    pushMatrix();
    emissive(map(mouseX, 0, width, 0, 242), map(mouseX, 0, width, 0, 242), map(mouseX, 0, width, 0, 176));
    fill(126, 199, 216, 40);
    translate(width/2, 3*height/5, 0);
    sphere(80);
    popMatrix();
    pushMatrix();
    fill(200);
    translate(width/2, 3*height/5, 0);
    sphere(30);
    popMatrix();
}
