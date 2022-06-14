boolean isGrid = true, isAxis = true;
void setup(){
    size(800, 800, P3D);
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
void drawBody(){
    fill(255, 254, 59);
    pushMatrix();
    translate(5, 20, 0);
    box(130, 30, 55);
    popMatrix();
    pushMatrix();
    translate(0, 50, 0);
    box(100, 30, 55);
    popMatrix();
    pushMatrix();
    fill(255, 0, 0);
    translate(70, 25, int(55/4));
    rotateY(PI/2);
    box(int(55/4), 5, 5);
    popMatrix();
    pushMatrix();
    translate(70, 25, -int(55/4));
    rotateY(PI/2);
    box(int(55/4), 5, 5);
    popMatrix();
    pushMatrix();
    fill(255);
    translate(71, 10, 0);
    rotateY(PI/2);
    box(55, 10, 2);
    popMatrix();
}

//タイヤの描画
void drawTire(){
    //後輪
    fill(0);
    pushMatrix();
    translate(-30, 15, 25);
    pillar(10, 15, 15);
    fill(255);
    pillar(10, 10, 10);
    popMatrix();
    fill(0);
    pushMatrix();
    translate(-30, 15, -25);
    pillar(10, 15, 15);
    fill(255);
    pillar(10, 10, 10);
    popMatrix();
    //前輪
    fill(0);
    pushMatrix();
    translate(30, 15, 25);
    pillar(10, 15, 15);
    fill(255);
    pillar(10, 10, 10);
    popMatrix();
    fill(0);
    pushMatrix();
    translate(30, 15, -25);
    pillar(10, 15, 15);
    fill(255);
    pillar(10, 10, 10);
    popMatrix();
}

//車を描画
void drawCar(){
    drawBody();
    drawTire();
}


void draw(){
    background(255);
    lights();
    float cameraY = map(mouseY, 0, height, 400, -200);
    float theta = map(mouseX, 0, width, 0, TWO_PI);
    camera(300 * cos(theta), cameraY, 300 * sin(theta), 0, 0, 0, 0, -1, 0);
    pushMatrix();
    //drawAxis('X', color(255, 0, 0, 60)); 
    //drawAxis('Y', color(0, 255, 0, 60));
    //drawAxis('Z', color(0, 0, 255, 60));  
    drawCar();
    popMatrix();
} 