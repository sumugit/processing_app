boolean isGrid = true, isAxis = true;
float rad = 0;
PImage imgLeaf, imgRoof, imgTrunk, imgWall, imgZebra;
PShape trunk, base;
void setup(){
    size(800, 800, P3D);
    imgLeaf = loadImage("leaf.jpg");
    imgRoof = loadImage("roof.jpg");
    imgTrunk = loadImage("trunk.jpg");
    imgWall = loadImage("wall.jpg");
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
void drawBody(float s, float x, float z, int r, int g, int b, boolean dir){
    pushMatrix();
    fill(r, g, b);
    scale(s);
    translate(x + .05, .2, z);
    rotateY(PI/2);
    if(dir) rotateY(rad*PI/180);
    else rotateY(-rad*PI/180);
    //ここを変更
    drawBox(1.3, .3, .55, 3);
    //正面部品
    if(dir){
        //目
        pushMatrix();
        fill(255, 0, 0);
        translate(.65, .05, .01*int(55/4));
        rotateY(PI/2);
        box(.01*int(55/4), .05, .05);
        popMatrix();
        //目
        pushMatrix();
        translate(.65, .05, -.01*int(55/4));
        rotateY(PI/2);
        box(.01*int(55/4), .05, .05);
        popMatrix();
        //口
        pushMatrix();
        fill(255);
        translate(.66, -.1, 0);
        rotateY(PI/2);
        box(.55, .1, .02);
        popMatrix();
    }
    popMatrix();
    //胴体上
    pushMatrix();
    fill(r, g, b);
    scale(s);
    translate(x, .5, z);
    rotateY(PI/2);
    if (dir) rotateY(rad*PI/180);
    else rotateY(-rad*PI/180);
    drawBox(1., .3, .55, 3);
    popMatrix();
}

//タイヤの描画
void drawTire(float s, float x, float z, boolean dir){
    //回転の中心
    pushMatrix();
    fill(255, 254, 59);
    scale(s);
    translate(x + .05, .2, z);
    rotateY(PI/2);
    if (dir) rotateY(rad*PI/180);
    else rotateY(-rad*PI/180);
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
void drawCar(float s, float x, float z, int r, int g, int b, boolean dir){
    drawBody(s, x, z, r, g, b, dir);
    drawTire(s, x, z, dir);
}

//四角錐を描画
void pyramid(int p){
        fill(255);
        beginShape(TRIANGLES);
        if(p == 1){
            //葉の描画
            texture(imgLeaf);
            textureMode(NORMAL);
        } else if(p == 2){
            //家の屋根の描画
            texture(imgRoof);
            textureMode(NORMAL);
        }
        vertex(0, .5, 0, .5, 0); vertex(-.5, 0, -.5, 0, 1); vertex(.5, 0, -.5, 1, 0);
        vertex(0, .5, 0, .5, 0); vertex(.5, 0, -.5, 0, 1); vertex(.5, 0, .5, 1, 0);
        vertex(0, .5, 0, .5, 0); vertex(.5, 0, .5, 0, 1); vertex(-.5, 0, .5, 1, 0);
        vertex(0, .5, 0, .5, 0); vertex(-.5, 0, .5, 0, 1); vertex(-.5, 0, -.5, 1, 0);
        vertex(-.5, 0, -.5, .5, 0); vertex(.5, 0, .5, 0, 1); vertex(.5, 0, -.5, 1, 0);
        vertex(-.5, 0, -.5, .5, 0); vertex(-.5, 0, .5, 0, 1); vertex(.5, 0, .5, 1, 0);
        endShape(); 
} 

//箱を描画
void drawBox(float s, float h, float d, int p){
    beginShape(QUADS);
    //pはどのboxを描画するか
    if(p == 1){
        //幹
        texture(imgTrunk); 
    } else if(p == 2){
        //家の壁
        texture(imgWall); 
    } else if(p == 3){
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

//葉全体の描画
void leaves(){
    fill(255);
    pushMatrix();
    translate(0, .5, 0);
    scale(.6, .6, .6);
    pyramid(1);
    popMatrix();
    pushMatrix();
    translate(0, .25, 0);
    scale(.8, .8, .8);
    pyramid(1);
    popMatrix();
    pushMatrix();
    pyramid(1);
    popMatrix();
}

//幹の描画
void trunk(){
    fill(255);
    pushMatrix();
    scale(.2, .4, .2);
    translate(0, .5, 0);
    drawBox(1, 1, 1, 1);
    popMatrix();
}

//木の描画
void drawTree(float s, float x, float z){
    noStroke();
    pushMatrix();
    scale(s, s, s);
    translate(x, 0, z);
    trunk();
    pushMatrix();
    translate(0, .4, 0);
    leaves();
    popMatrix();
    popMatrix();
}

//家の描画
void drawHouse(float s, float x, float z){
    fill(255);
    //土台
    pushMatrix();
    scale(s);
    translate(x, 0.3, z);
    drawBox(0.6, 0.6, 0.6, 2);
    popMatrix();
    //屋根
    pushMatrix();
    scale(s);
    translate(x, 0.6, z);
    pyramid(2);
    popMatrix();
}


void draw(){
    background(255);
    float cameraY = map(mouseY, 0, height, 400, -200);
    float x1, z1, x2, z2, radius1 = 3, radius2 = 4.3;
    camera(300 * cos(-rad*PI/450), cameraY, 300 * sin(-rad*PI/450), 0, 0, 0, 0, -1, 0);
    pushMatrix();
    //drawAxis('X', color(255, 0, 0, 60)); 
    //drawAxis('Y', color(0, 255, 0, 60));
    //drawAxis('Z', color(0, 0, 255, 60));
    x1 = radius1 * cos(radians(-rad));
    z1 = radius1 * sin(radians(-rad));
    x2 = radius2 * cos(radians(rad));
    z2 = radius2 * sin(radians(rad));
    spotLight(220, 220, 255, 0, 100, 0, 0, -1, 0, PI/2, 0);
    pushMatrix();
    fill(118, 118, 118);
    translate(0, -5, 0);
    rotateX(PI/2);
    pillar(10, 250, 250);
    fill(230, 230, 230);
    pillar(10.1, 190, 190);
    fill(118, 118, 118);
    pillar(10.2, 185, 185);
    fill(157, 200, 56);
    pillar(10.3, 130, 130);
    popMatrix();
    drawCar(50, x1, z1, 255, 254, 59, true);
    drawCar(50, x2, z2, 200, 0, 0, false);
    drawTree(50, -.3, -.3);
    drawTree(50, -1, -1);
    drawTree(50, 1.3, 1.3);
    drawTree(50, .8, .3);
    drawTree(50, .7, -.5);
    drawTree(50, -.9, .2);
    drawTree(50, -.3, .9);
    drawTree(50, .9, -1.2);
    drawHouse(50, 1.7, .2);
    drawHouse(50, -.75, 1.7);
    popMatrix();
    rad++;
} 