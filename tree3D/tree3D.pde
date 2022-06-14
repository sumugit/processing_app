boolean isGrid = true, isAxis = true;
void setup(){
    size(400, 300, P3D);
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
void leaf(int r, int g, int b){
        fill(r, g, b);
        beginShape(TRIANGLES);
        vertex(0, .5, 0); vertex(-.5, 0, -.5); //(0, .5, 0)が頂点
        vertex(.5, 0, -.5);vertex(0, .5, 0);
        vertex(.5, 0, -.5);vertex(.5, 0, .5);
        vertex(0, .5, 0); vertex(.5, 0, .5);
        vertex(-.5, 0, .5);vertex(0, .5, 0);
        vertex(-.5, 0, .5); vertex(-.5, 0, -.5);
        vertex(-.5, 0, -.5); vertex(.5, 0, .5); 
        vertex(.5, 0, -.5);vertex(-.5, 0, -.5); 
        vertex(-.5, 0, .5); vertex(.5, 0, .5);
        endShape(); 
} 

void leaves(){
    pushMatrix();
    translate(0, .5, 0);
    scale(.6, .6, .6);
    leaf(0, 224, 0);
    popMatrix();
    pushMatrix();
    translate(0, .25, 0);
    scale(.8, .8, .8);
    leaf(0, 192, 0);
    popMatrix();
    leaf(0, 128, 0);
}

void trunk(){
    fill(128, 64, 0);
    pushMatrix();
    scale(.2, .4, .2);
    translate(0, .5, 0);
    box(1);
    popMatrix();
}

void drawTree(float s){
    noStroke();
    pushMatrix();
    scale(s, s, s);
    trunk();
    pushMatrix();
    translate(0, .4, 0);
    leaves();
    popMatrix();
    popMatrix();
}

void draw(){
    background(255);
    lights();
    float cameraY = map(mouseY, 0, height, 400, -200);
    float theta = map(mouseX, 0, width, 0, TWO_PI);
    camera(300 * cos(theta), cameraY, 300 * sin(theta), 0, 0, 0, 0, -1, 0);
    pushMatrix();
    drawAxis('X', color(255, 0, 0, 60)); 
    drawAxis('Y', color(0, 255, 0, 60));
    drawAxis('Z', color(0, 0, 255, 60));  
    drawTree(100);
    popMatrix();
} 