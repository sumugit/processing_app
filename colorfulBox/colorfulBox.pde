int i = 0;
boolean flag = false;

void setup(){
    size(800, 600, P3D);
    noStroke(); 
} 

void draw(){
    background(255);
    translate(400, 300, -50);
    if(!flag){
        rotateY((PI*i)/180);
        rotateX((PI*i)/180);
    }
    else{
        rotateZ((PI*i)/180);
        rotateY((PI*i)/180);
    }
    i++;
    if(i > 360){
        i = 0;
        if(!flag){
            flag = true;
        }
        else{
            flag = false;
        }
    }
    scale(50, 50, 50);
    coloredCube(255);
}

void coloredCube(float alpha){
    pushMatrix();
    scale(.5, .5, .5);
    beginShape(QUADS);
    fill(255, 0, 0, alpha); // Red
    vertex(3, -3, -3); 
    vertex(3, -3, 3); 
    vertex(3, 3, 3); 
    vertex(3, 3, -3);
    fill(0, 255, 0, alpha); // Green
    vertex(3, 3, 3); 
    vertex(-3, 3, 3); 
    vertex(-3, 3, -3); 
    vertex(3, 3, -3);
    fill(0, 0, 255, alpha); // Blue
    vertex(-3, 3, 3); 
    vertex(3, 3, 3); 
    vertex(3, -3, 3); 
    vertex(-3, -3, 3);
    fill(255, 255, 0, alpha); // Yellow
    vertex(-3, -3, -3); 
    vertex(-3, -3, 3); 
    vertex( 3, -3, 3); 
    vertex( 3, -3, -3);
    fill(255, 0, 255, alpha); // Magenta
    vertex(-3, 3, -3); 
    vertex(-3, 3, 3); 
    vertex(-3, -3, 3); 
    vertex(-3, -3, -3);
    fill(0, 255, 255, alpha); // Cyan
    vertex(3, 3, -3); 
    vertex(-3, 3, -3); 
    vertex(-3, -3, -3); 
    vertex(3, -3, -3);
    endShape();
    popMatrix(); 
} 