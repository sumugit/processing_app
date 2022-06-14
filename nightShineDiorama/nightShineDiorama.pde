boolean isGrid = true, isAxis = true;
PImage imgZebra;
void setup(){
    size(800, 800, P3D);
    imgZebra = loadImage("zebra.png");
    noStroke(); 
}
void axis(char s, color c){
    int len = 200;fill(c);
    stroke(c);
    pushMatrix();
    if(isAxis){
        box(len, 1, 1);
        pushMatrix();
        translate(len / 2, 0, 0);
        sphere(3);
        text(s, 5, -5, 0);
        popMatrix();
    }
    
    if(isGrid){
        pushMatrix();
        translate(0, -len / 2, -len / 2);
        int ngrids = 20, xs = len / ngrids, ys = len / ngrids;
        for(int i = 1; i < ngrids; i++){
            line(0, 0, ys * i, 0, len, ys * i); 
            line(0, xs * i, 0, 0, xs * i, len); 
        }
        popMatrix();
    }
    popMatrix();
    noStroke();
} 
    
void drawAxis(char s, color c){
    switch(s){
        case 'X': axis(s, c);break;
        case 'Y': pushMatrix();rotateZ(PI / 2);axis(s, c);popMatrix();break;
        case 'Z': pushMatrix();rotateY(-PI / 2);axis(s, c);popMatrix();break;
        }
    }
    
void keyPressed(){
    switch(key){
        case 'g': if(isGrid) isGrid = false;
        else isGrid = true;break;
        case 'a': if(isAxis) isAxis = false;else isAxis = true;break;
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

//車の土台
void drawBody(float s, float x, float z, int r, int g, int b){
    pushMatrix();
    fill(r, g, b);
    scale(s);
    translate(x + .05, .2, z);
    rotateY(PI/2);
    //ここを変更
    drawBox(1.3, .3, .55, 3);
    //正面部品
    //目
    pushMatrix();
    emissive(map(mouseX, 0, width, 0, 242), map(mouseX, 0, width, 0, 242), map(mouseX, 0, width, 0, 176));
    fill(255, 0, 0);
    translate(.65, .05, .01*int(55/4));
    rotateY(PI/2);
    box(.01*int(55/4), .05, .05);
    popMatrix();
    //目
    pushMatrix();
    emissive(map(mouseX, 0, width, 0, 242), map(mouseX, 0, width, 0, 242), map(mouseX, 0, width, 0, 176));
    translate(.65, .05, -.01*int(55/4));
    rotateY(PI/2);
    box(.01*int(55/4), .05, .05);
    popMatrix();
    //口
    pushMatrix();
    emissive(0, 0, 0);
    fill(255);
    translate(.66, -.1, 0);
    rotateY(PI/2);
    box(.55, .1, .02);
    popMatrix();
    popMatrix();
    //胴体上
    pushMatrix();
    fill(r, g, b);
    scale(s);
    translate(x, .5, z);
    rotateY(PI/2);
    drawBox(1., .3, .55, 3);
    popMatrix();
}

//タイヤの描画
void drawTire(float s, float x, float z){
    //回転の中心
    pushMatrix();
    fill(255, 254, 59);
    scale(s);
    translate(x + .05, .2, z);
    rotateY(PI/2);
    //後輪
    pushMatrix();
    fill(0);
    translate(-.35, -.05, .25);
    pillar(.1, .15, .15);
    fill(255);
    pillar(.1, .1, .1);
    popMatrix();
    //後輪
    pushMatrix();
    fill(0);
    translate(-.35, -.05, -.25);
    pillar(.1, .15, .15);
    fill(255);
    pillar(.1, .1, .1);
    popMatrix();
    //前輪
    pushMatrix();
    fill(0);
    translate(.25, -.05, .25);
    pillar(.1, .15, .15);
    fill(255);
    pillar(.1, .1, .1);
    popMatrix();
    //前輪
    pushMatrix();
    fill(0);
    translate(.25, -.05, -.25);
    pillar(.1, .15, .15);
    fill(255);
    pillar(.1, .1, .1);
    popMatrix();

    popMatrix();
}

//車の描画
void drawCar(float s, float x, float z, int r, int g, int b){
    drawBody(s, x, z, r, g, b);
    drawTire(s, x, z);
}

//箱を描画
void drawBox(float s, float h, float d, int p){
    beginShape(QUADS);
    //pはどのboxを描画するか
    if(p == 3){
        //車の模様
        texture(imgZebra); 
    }
    textureMode(NORMAL);
    //各面(計6面)で描画
    vertex(-s/2, h/2, -d/2, 0, 0);vertex(-s/2, -h/2, -d/2, 0, 1);vertex(s/2, -h/2, -d/2, 1, 1);vertex(s/2, h/2, -d/2, 1, 0);
    vertex(s/2, h/2, -d/2, 0, 0);vertex(s/2, -h/2, -d/2, 0, 1);vertex(s/2, -h/2, d/2, 1, 1);vertex(s/2, h/2, d/2, 1, 0);
    vertex(s/2, h/2, d/2, 0, 0);vertex(s/2, -h/2, d/2, 0, 1);vertex(-s/2, -h/2, d/2, 1, 1);vertex(-s/2, h/2, d/2, 1, 0);
    vertex(-s/2, h/2, d/2, 0, 0);vertex(-s/2, -h/2, d/2, 0, 1);vertex(-s/2, -h/2, -d/2, 1, 1);vertex(-s/2, h/2, -d/2, 1, 0);
    vertex(-s/2, h/2, d/2, 0, 0);vertex(-s/2, h/2, -d/2, 0, 1);vertex(s/2, h/2, -d/2, 1, 1);vertex(s/2, h/2, d/2, 1, 0);
    vertex(-s/2, -h/2, -d/2, 0, 0);vertex(-s/2, -h/2, d/2, 0, 1);vertex(s/2, -h/2, d/2, 1, 1);vertex(s/2, -h/2, -d/2, 1, 0);
    endShape();
}


void draw(){
    background(0);
    directionalLight(100, 100, 100, -1, -.5, -1);
    float cameraY = map(mouseY, 0, height, 400, -200);
    camera(300, cameraY, -300, 0, 0, 0, 0, -1, 0);
    pushMatrix();
    drawAxis('X', color(255, 0, 0, 60)); 
    drawAxis('Y', color(0, 255, 0, 60));
    drawAxis('Z', color(0, 0, 255, 60));  
    drawCar(100, 0, 0, 255, 254, 59);
    popMatrix();
} 