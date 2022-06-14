void setup() {
  size(400, 400);
}

void draw() {
  background(255);

  //axis
  strokeWeight(1);
  stroke(200);
  line(width/2, 0, width/2, height); //y-axis
  line(0, height/2, width, height/2); //x-axis

  //draw
  noFill();
  strokeWeight(2);
  stroke(0, 200, 0); //drawing color
  strokeJoin(ROUND);
  drawAstroid(width/2, height/2, 200);  // x-pos, y-pos, size
}

void drawAstroid(int ox, int oy, int size) {
  pushMatrix(); //use stack
  translate(ox, oy); //move axis
  beginShape();
  for (int theta = 0; theta < 360; theta++) {
    float x = size * (cos(radians(theta)) * cos(radians(theta)) * cos(radians(theta)));
    float y = size * (sin(radians(theta)) * sin(radians(theta)) * sin(radians(theta)));
    vertex(x, y);
  }
  endShape(CLOSE);
  popMatrix(); //pop
}