void setup(){
    size(600, 600, P3D);
    noStroke(); 
} 

void draw(){
    background(255);
    translate(300, 300, -50);
    rotateX(map(mouseY, 0, height, PI, -PI));
    rotateY(map(mouseX, 0, width, -PI, PI));
    pushMatrix();
    scale(20, 20, 20);
    coloredCube(255); //put 11 boxes.
    popMatrix();
}

void coloredCube(float alpha){
    int i, j, k;
    pushMatrix();
    scale(.5, .5, .5);
    for(k = -5; k<6; k++){
        for(j = -5; j<6; j++){
            for(i = -5; i<6; i++){
                //draw cube
                beginShape(QUADS);
                fill(255 - i*23, 115 + j*23, 115 + k*23, alpha); // change color
                vertex(1 + i*3, -1 + 3*j, -1 + 3*k); vertex(1 + i*3, -1 + 3*j, 1 + 3*k); vertex(1 + i*3, 1 + 3*j, 1 + 3*k); vertex(1 + i*3, 1 + 3*j, -1 + 3*k);
                fill(115 + i*23, 255 - j*23, 115 + k*23, alpha); // change color
                vertex(1 + i*3, 1 + 3*j, 1 + 3*k); vertex(-1 + i*3, 1 + 3*j, 1 + 3*k); vertex(-1 + i*3, 1 + 3*j, -1 + 3*k); vertex(1 + i*3, 1 + 3*j, -1 + 3*k);
                fill(115 + i*23, 115 + j*23, 255 - k*23, alpha); // change color
                vertex(-1 + i*3, 1 + 3*j, 1 + 3*k); vertex(1 + i*3, 1 + 3*j, 1 + 3*k); vertex(1 + i*3, -1 + 3*j, 1 + 3*k); vertex(-1 + i*3, -1 + 3*j, 1 + 3*k);
                fill(255 - i*23, 255 - j*23, 115 + k*23, alpha); // change color
                vertex(-1 + i*3, -1 + 3*j, -1 + 3*k); vertex(-1 + i*3, -1 + 3*j, 1 + 3*k); vertex(1 + i*3, -1 + 3*j, 1 + 3*k); vertex(1 + i*3, -1 + 3*j, -1 + 3*k);
                fill(255 - i*23, 115 + j*23, 255 - k*23, alpha); // change color
                vertex(-1 + i*3, 1 + 3*j, -1 + 3*k); vertex(-1 + i*3, 1 + 3*j, 1 + 3*k); vertex(-1 + i*3, -1 + 3*j, 1 + 3*k); vertex(-1 + i*3, -1 + 3*j, -1 + 3*k);
                fill(115 + 23*i, 255 - 23*j, 255 - 23*k, alpha); // change color
                vertex(1 + i*3, 1 + 3*j, -1 + 3*k); vertex(-1 + i*3, 1 + 3*j, -1 + 3*k); vertex(-1 + i*3, -1 + 3*j, -1 + 3*k); vertex(1 + i*3, -1 + 3*j, -1 + 3*k);
                endShape();
            }
        }
    }
    popMatrix(); 
} 