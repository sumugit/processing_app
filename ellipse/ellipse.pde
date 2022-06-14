
void setup() {
  size(350, 350);
  //input image
  PImage img = loadImage("myimage.png");
  noStroke();
  smooth();
  background(255);
  //draw
  filter(img);
}

void filter(PImage img) {
  //load pixels
  img.loadPixels(); 
  int w = img.width;
  for(int y = 0; y < img.height; y+=10){
        for(int x = 0; x < img.width; x+=10){
            fill(img.pixels[y*w + x]);
            float d = random(10, 20);
            pushMatrix();
            //参照している座標に合わせて回転
            translate(x, y);
            rotate(-PI / 3);
            //draw ellipse
            ellipse(0, 0, d+30, d);
            popMatrix();
        }
    }
}