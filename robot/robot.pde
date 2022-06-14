/* @pjs font="TEMPSITC.TTF";*/ 
void setup(){
    size(800, 800, P3D);
    noStroke();
    smooth();
    textFont(createFont("Tempus Sans ITC", 24)); 
}

void draw(){
    background(0);
    translate(width / 2, 3*height / 4, 0);
    rotateX(map(mouseY, 0, height, PI, -PI));
    rotateY(map(mouseX, 0, width, -PI, PI));
    //drawAxis('X', color(255, 0, 0, 120)); // X-axis + YZ-plane
    //drawAxis('Y', color(0, 255, 0, 120)); // Y-axis + XZ-plane
    //drawAxis('Z', color(0, 0, 255, 120)); // Z-axis + XY-plane 
    robot();
}

//draw man
void robot(){
    fill(254, 127, 156);
    //draw legs
    pushMatrix();
    translate(-20, -30, 0);
    pillar(60, 10, 10);
    popMatrix();
    pushMatrix();
    translate(20, -30, 0);
    pillar(60, 10, 10);
    popMatrix();
    //draw body
    pushMatrix();
    translate(0, -145, 0);
    pillar(150, 15 , 50);
    popMatrix();
    //draw arm
    pushMatrix();
    rotateZ(PI/6);
    translate(-40, -170, 0);
    pillar2(80, 15 , 15);
    translate(50, 0, 0);
    sphere(15);
    popMatrix();
    pushMatrix();
    rotateZ(-PI/6);
    translate(40, -170, 0);
    pillar2(80, 15 , 15);
    translate(-50, 0, 0);
    sphere(15);
    popMatrix();
    //draw head
    pushMatrix();
    translate(0, -255, 0);
    sphere(30);
    popMatrix();
}

 //円柱の作成(長さ,上面の半径,底面の半径)
void pillar(float length, float radius1 , float radius2){
    float x,y,z;
    pushMatrix();
    //底面の作成
    beginShape(TRIANGLE_FAN);
    y = -length / 2;
    vertex(0, y, 0);
    for(int deg = 0; deg <= 360; deg = deg + 10){
        x = cos(radians(deg)) * radius1;
        z = sin(radians(deg)) * radius1;
        vertex(x, y, z);
    }
    endShape();              
    //上面の作成
    beginShape(TRIANGLE_FAN);
    y = length / 2;
    vertex(0, y, 0);
    for(int deg = 0; deg <= 360; deg = deg + 10){
        x = cos(radians(deg)) * radius2;
        z = sin(radians(deg)) * radius2;
        vertex(x, y, z);
    }
    endShape();
    //側面の作成
    beginShape(TRIANGLE_STRIP);
    for(int deg =0; deg <= 360; deg = deg + 5){
        x = cos(radians(deg)) * radius1;
        y = -length / 2;
        z = sin(radians(deg)) * radius1;
        vertex(x, y, z);
        x = cos(radians(deg)) * radius2;
        y = length / 2;
        z = sin(radians(deg)) * radius2;
        vertex(x, y, z);
    }
    endShape();
    popMatrix();
}

 //円柱の作成(長さ,上面の半径,底面の半径)
void pillar2(float length, float radius1 , float radius2){
    float x,y,z;
    pushMatrix();
    //底面の作成
    beginShape(TRIANGLE_FAN);
    x = -length / 2;
    vertex(x, 0, 0);
    for(int deg = 0; deg <= 360; deg = deg + 10){
        y = cos(radians(deg)) * radius1;
        z = sin(radians(deg)) * radius1;
        vertex(x, y, z);
    }
    endShape();              
    //上面の作成
    beginShape(TRIANGLE_FAN);
    x = length / 2;
    vertex(x, 0, 0);
    for(int deg = 0; deg <= 360; deg = deg + 10){
        y = cos(radians(deg)) * radius2;
        z = sin(radians(deg)) * radius2;
        vertex(x, y, z);
    }
    endShape();
    //側面の作成
    beginShape(TRIANGLE_STRIP);
    for(int deg =0; deg <= 360; deg = deg + 5){
        y = cos(radians(deg)) * radius1;
        x = -length / 2;
        z = sin(radians(deg)) * radius1;
        vertex(x, y, z);
        y = cos(radians(deg)) * radius2;
        x = length / 2;
        z = sin(radians(deg)) * radius2;
        vertex(x, y, z);
    }
    endShape();
    popMatrix();
}

void axis(char s, color c){
    int len = 200;
    fill(c);
    stroke(c);
    box(len, 1, 1);
    pushMatrix();
    translate(len / 2, 0, 0);
    sphere(3);
    text(s, 5, -5, 0);
    popMatrix();
    pushMatrix();
    translate(0, -len / 2, -len / 2);
    int ngrids = 20; // # of grid
    int xs = len / ngrids, ys = len / ngrids; // grid interval
    for(int i = 1; i < ngrids; i++){line(0, 0, ys * i, 0, len, ys * i); // horizontal grid
    line(0, xs * i, 0, 0, xs * i, len); // vertical grid
    }
    popMatrix(); 
    } 
    
void drawAxis(char s, color c){
    switch(s){
        case 'X':
            axis(s, c);
            break;
        case 'Y':
            pushMatrix();
            rotateZ(PI / 2);
            axis(s, c);
            popMatrix();
            break;
        case 'Z':
            pushMatrix();
            rotateY(-PI / 2);
            axis(s, c);
            popMatrix();
            break;
    } 
} 