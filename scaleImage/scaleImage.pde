
void setup(){
    size(640, 480);
    //background(255);
}

void draw(){
    color paleGreen = color(144, 238, 144);
    color lightPink = color(255, 182, 193);
    drawGrid(lightPink);
    scale(0.8, 1.4);
    drawGrid(paleGreen);
    PImage img = loadImage("myfhoto.PNG", "PNG");
    image(img, 0, 0);
}

//grid layout
int drawGrid(int maxVal){ // draw grids
    int unitPixels = width / maxVal / 2; // grid interval(pixels/unit)
    int xc = width / 2, yc = height / 2;
    stroke(144, 238, 144);
    for(int i = 1 - maxVal; i < maxVal; i++){
        line(0, unitPixels * i + xc, width, unitPixels * i + yc); // horizontal grid
        line(unitPixels * i + xc, 0, unitPixels * i + yc, height); // vertical grid
        if(i != 0){text(i, unitPixels * i + xc, yc + 18); // x-coordinate values
            text(i, xc - 14, unitPixels * i + yc + 5); // y-coordinate values
        }
    }
    stroke(0);
    text("O", xc - 14, yc + 18); // Origin(at the center of the Window)
    line(0, yc, width, yc); // x-axis
    line(xc, 0, xc, height); // y-axis
    return unitPixels; 
} 