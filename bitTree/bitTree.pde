int n = 0;
void setup(){
    size(1500, 1500);
    textFont(createFont("Tempus Sans ITC", 24));
    fill(0);
    smooth(); 
} 
void bitTree(int level, float length){
     if(0 == level){ 
         // finish the recursive call
         line(0, 0, 0, -1*length); // draw line at current coordinate systems
         return;
    }
    bitTree(--level, length); // draw branch
    //draw left branch
    pushMatrix(); 
    translate(0, -1*length); // translate (0, -1*length)
    rotate(-PI / 6); // rotate (-PI / 6)
    bitTree(level, length*0.8);
    popMatrix();

    //draw right branch
    pushMatrix();
    translate(0, -1*length); // translate (0, -1*length)
    rotate(PI / 6); // rotate (PI / 6)
    bitTree(level, length*0.8);
    popMatrix();
} 

void mousePressed(){
    if((mouseButton == LEFT) && (n < 11)) n++;
    else if((mouseButton == RIGHT) && (n > 0)) n--;
} 

void draw(){
    background(255);
    fill(0);
    text("n = " + n, 10, 30);
    translate(750, height);
    bitTree(n, 300);
} 