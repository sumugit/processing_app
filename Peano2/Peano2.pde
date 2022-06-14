int n = 0;
int w = 800;
int h = 800;
float x1 = 0.25*w, y1 = 0.25*h;
float length1 = -0.5*h;
void setup(){
    size(800, 800);
    textFont(createFont("Tempus Sans ITC", 24));
    fill(0);
    smooth(); 
} 

void Peano(float level, float x1, float y1, float length){
    if(level > 0){
        dlu(--level, x1, y1, length/2);
        line(x1, y1, x1 - length, y1); //draw line
        x1 = x1 - length;
        Peano(--level, x1, y1, length/2);
        line(x1, y1, x1, y1 + length);
        y1 = y1 + length;
        Peano(--level, x1, y1, length/2);
        line(x1, y1, x1 + length, y1);
        x1 = x1 + length;
        urd(--level, x1, y1, length/2);
    }
    else return;
}

void urd(float level, float x1, float y1, float length){
    if(level > 0){
        rul(--level, x1, y1, length/2);
        line(x1, y1, x1, y1 - length); //draw line
        y1 = y1 - length;
        urd(--level, x1, y1, length/2);
        line(x1, y1, x1 + length, y1);
        x1 = x1 + length;
        urd(--level, x1, y1, length/2);
        line(x1, y1, x1, y1 + length);
        y1 = y1 + length;
        Peano(--level, x1, y1, length/2);
    }
    else return;   
}

void rul(float level, float x1, float y1, float length){
    if(level > 0){
        urd(--level, x1, y1, length/2);
        line(x1, y1, x1 + length, y1); //draw line
        x1 = x1 + length;
        rul(--level, x1, y1, length/2);
        line(x1, y1, x1, y1 - length);
        y1 = y1 - length;
        rul(--level, x1, y1, length/2);
        line(x1, y1, x1 - length, y1);
        x1 = x1 - length;
        dlu(--level, x1, y1, length/2);
    }
    else return;
}

void dlu(float level, float x1, float y1, float length){
    if(level > 0){
        Peano(--level, x1, y1, length/2);
        line(x1, y1, x1, y1 + length); //draw line
        y1 = y1 + length;
        dlu(--level, x1, y1, length/2);
        line(x1, y1, x1 - length, y1);
        x1 = x1 - length;
        dlu(--level, x1, y1, length/2);
        line(x1, y1, x1, y1 - length);
        y1 = y1 - length;
        rul(--level, x1, y1, length/2);
    }
    return;
}

void mousePressed(){
    if((mouseButton == LEFT) && (n < 8)) n++;
    else if((mouseButton == RIGHT) && (n > 0)) n--; 
} 
void draw(){
    background(255);
    text("n = " + n, 10, 30);
    Peano(n, x1, y1, length1);
} 