int n = 0;
float[] turtle = {0, 0}; //initialize
float length;

void setup(){
    size(800, 800);
    textFont(createFont("Tempus Sans ITC", 24));
    fill(0);
    smooth(); 
}

//一本道をたどるように描いていく
void moveTurtle(float dx, float dy){
  //update line
  line(turtle[0], turtle[1], turtle[0]+dx, turtle[1]+dy); //draw line
  //save moved point
  turtle[0] += dx;
  turtle[1] += dy;
}

//A
void PeanoA(int level){
    if(level==0) return;
    PeanoB(--level);
    moveTurtle(length, 0);
    PeanoA(level);
    moveTurtle(0, length);
    PeanoA(level);
    moveTurtle(-length, 0);
    PeanoD(level);  
}

//B
void PeanoB(int level){
    if(level==0) return;
    PeanoA(--level);
    moveTurtle(0, length);
    PeanoB(level);
    moveTurtle(length, 0);
    PeanoB(level);
    moveTurtle(0, -length);
    PeanoC(level);  
}

//C
void PeanoC(int level){
    if(level==0) return;
    PeanoD(--level);
    moveTurtle(-length, 0);
    PeanoC(level);
    moveTurtle(0, -length);
    PeanoC(level);
    moveTurtle(length, 0);
    PeanoB(level);
}

//D
void PeanoD(int level){
    if(level==0) return;
    PeanoC(--level);
    moveTurtle(0, -length);
    PeanoD(level);
    moveTurtle(-length, 0);
    PeanoD(level);
    moveTurtle(0, length);
    PeanoA(level);
}

void mousePressed(){
  if((mouseButton==LEFT) && (n<8)) n++;
  else if((mouseButton==RIGHT) && (n>1)) n--;
} 

void draw(){
    turtle[0] = turtle[1] = width / pow(2,n+1);
    //update length
    length = width / pow(2,n);
    background(255);
    text("n = " + n, 10, 30);
    translate(0, height);
    //x軸を1倍, y軸を-1倍にする(x0, y0)
    scale(1, -1);
    PeanoB(n);
}