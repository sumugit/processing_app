/* @pjs font="TEMPSITC.TTF"; */ 
int n = 0;
int x_0 = 400, y_0 = 20, x_1 = 100, y_1 = 540, x_2 = 700, y_2 = 540; 
void setup(){
    size(800, 600);
    textFont(createFont("Tempus Sans ITC", 24));
    fill(0);
    smooth(); 
} 
void drawSiepinskiGasket(int level, float x1, float y1, float length){
    float x2, y2, x3, y3, x4, y4;
    if(level == 1){
        // finish the recursive call
        x2 = x1 + length; // calculate triange coordinate
        y2 = y1;
        x3 = x1 + length/2;
        y3 =  y1 + length * sin(PI/3);
        triangle(x1, y1, x2, y2, x3, y3); // draw triangle
        return;
    }
    else if(level > 1){
        drawSiepinskiGasket(--level, x1, y1, length); // draw triange
        x2 = (x1 + x_0)/2; // calculate center coordinate
        y2 = (y1 + y_0)/2;
        drawSiepinskiGasket(level, x2, y2, length/2); // draw top side triange
        x3 = (x1 + x_1)/2;
        y3 = (y1 + y_1)/2;
        drawSiepinskiGasket(level, x3, y3, length/2); // draw left side triange
        x4 = (x1 + x_2)/2;
        y4 = (y1 + y_2)/2;
        drawSiepinskiGasket(level, x4, y4, length/2); // draw right side triange
    } 
} 

void mousePressed(){
    if((mouseButton == LEFT) && (n < 8)) n++;
    else if((mouseButton == RIGHT) && (n > 0)) n--;
} 

void draw(){
    background(255);
    fill(0);
    text("n = " + n, 10, 30);
    triangle(x_0, y_0, x_1, y_1, x_2, y_2);
    fill(255);
    drawSiepinskiGasket(n, (x_0 + x_1)/2, (y_0 + y_1)/2, 300);
} 