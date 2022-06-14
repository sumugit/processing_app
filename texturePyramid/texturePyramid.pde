boolean isGrid = true, isAxis = true;
PImage img;
void setup(){
    size(400, 300, P3D);
    img = loadImage("eye.jpg");
    noStroke(); 
}
void axis(char s, color c){
    int len = 200;
    fill(c);
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
void aspect(int r, int g, int b){
        fill(r, g, b);
        beginShape(TRIANGLES);
        texture(img);
        textureMode(NORMAL);
        vertex(0, .5, 0, .53, .2); vertex(-.5, 0, -.5, .15, .75); vertex(.5, 0, -.5, .8, .75);
        vertex(0, .5, 0, .53, .2); vertex(.5, 0, -.5, .15, .75); vertex(.5, 0, .5, .8, .75);
        vertex(0, .5, 0, .53, .2); vertex(.5, 0, .5, .15, .75);vertex(-.5, 0, .5, .8, .75);
        vertex(0, .5, 0, .53, .2);vertex(-.5, 0, .5, .15, .75); vertex(-.5, 0, -.5, .8, .75);
        vertex(-.5, 0, -.5, 0, 0); vertex(.5, 0, -.5, 1, 0);vertex(.5, 0, .5, 1, 1); 
        vertex(.5, 0, .5, 1, 1); vertex(-.5, 0, -.5, 0, 0); vertex(-.5, 0, .5, 0, 1); 
        endShape(); 
} 

void drawPyramid(float s){
    noStroke();
    pushMatrix();
    scale(s, s, s);
    pushMatrix();
    aspect(255, 255, 255);
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
    //drawAxis('X', color(255, 0, 0, 60)); 
    //drawAxis('Y', color(0, 255, 0, 60));
    //drawAxis('Z', color(0, 0, 255, 60));  
    drawPyramid(200);
    popMatrix();
} 