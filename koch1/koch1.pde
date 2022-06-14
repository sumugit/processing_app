/* @pjs font="TEMPSITC.TTF"; */
int n = 0;
void setup(){
    size(800, 300);
    textFont(createFont("Tempus Sans ITC", 24));
    fill(0);
    smooth(); 
} 

void drawKoch(int level, float x1, float y1, float angle, float length){
    // level:# recusive, P0(x1, y1), angle, length
    float x2, y2;
    if(0 == level){
        // finish the recursive call
        x2 = x1 + length * cos(angle); // calculate P1(x2, y2)
        y2 = y1 + length * sin(angle);
        line(x1, y1, x2, y2); // draw line
        return;
    }
    drawKoch(--level, x1, y1, angle, length /= 3); // draw P0-P1
    x2 = x1 + length * cos(angle); // calculate P1(x2, y2)
    y2 = y1 + length * sin(angle);
    drawKoch(level, x2, y2, angle - PI / 3, length); // draw P1-P2
    x2 += length * cos(angle - PI / 3); // calculate P2(x2, y2)
    y2 += length * sin(angle - PI / 3);
    drawKoch(level, x2, y2, angle + PI / 3, length); // draw P2-P3
    x2 = x1 + 2 * length * cos(angle); // calculate P3(x2, y2)
    y2 = y1 + 2 * length * sin(angle);
    drawKoch(level, x2, y2, angle, length); // draw P3-P4 
} 

void mousePressed(){
    if((mouseButton == LEFT) && (n < 8)) n++;
    else if((mouseButton == RIGHT) && (n > 0)) n--; 
} 
void draw(){
    background(255);
    text("n = " + n, 10, 30);
    drawKoch(n, .0, float(height - 10), .0, float(width)); 
} 