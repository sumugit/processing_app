void setup(){
    size(640, 480);
    background(255); 
} 

void drawGrid(color c){
    int x = 0, y = 0, interval = 100;
    stroke(c);
    while(y < height){
        line(0, y, width, y);
        y += interval;
    }while(x < width){
        line(x, 0, x, height);
        x += interval;
    }
} 

color royalBlue = color(65, 105, 225);
color paleGreen = color(144, 238, 144);
color lightPink = color(255, 182, 193); 

void draw(){
    PImage img = loadImage("myfhoto.PNG");
    drawGrid(lightPink);
    pushMatrix();
    translate(80, 60);
    drawGrid(paleGreen);
    image(img, 0, 0);
    popMatrix();
    pushMatrix();
    translate(360, 240);
    drawGrid(royalBlue);
    image(img, 0, 0);
    popMatrix(); 
} 