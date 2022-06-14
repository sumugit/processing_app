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
  stroke(0); //drawing color
  strokeJoin(ROUND);
  drawLissajous(width/2, height/2, 200);  // x-pos, y-pos, size
}

void drawLissajous(int ox, int oy, int size) {
  pushMatrix(); //use stack
  translate(ox, oy); //move axis
  beginShape();
  for (int theta = 0; theta < 360; theta++) {
    float x = size * cos(radians(6*theta));
    float y = size * sin(radians(5*theta));
    vertex(x, y);
  }
  rotate(radians(90));
  endShape(CLOSE);
  popMatrix(); //pop
}