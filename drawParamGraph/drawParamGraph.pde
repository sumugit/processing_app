void setup(){size(600, 600); // height must be equal to width
background(255);
//PFont font = loadFont("FreeSerifItalic-18.vlw");
//textFont(font, 18);
//textAlign(CENTER);
//fill(0);
smooth();
//drawFuncs(drawGrid(10));
drawFuncs(30);
} 

float func(float v){ return(v * v); } // y=x^2 

void drawFuncs(int unit){ // draw func()
    noStroke();
    fill(255, 0, 0);
    float x = -3.25, step = .25; // x value in function y = x^2 .25 = 0.25
    float x1, y1; // (x1, y1) is a position in Window
    while(x < 3.25){
        x1 = xInWindow(x, unit);
        y1 = yInWindow(func(x), unit);
        ellipse(x1, y1, 6, 6); //plot grid
        x += step;
    }
} 
float xInWindow(float x, int unit){ return(x * unit + width / 2); } // x in Window 
float yInWindow(float y, int unit){ return(- y * unit + height / 2); } // y in Window 

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