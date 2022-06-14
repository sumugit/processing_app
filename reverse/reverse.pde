
void setup(){
    size(700, 400);
    PImage img = loadImage("myimage.png");
    //draw image
    image(img, 0, 0);
    PImage rvImage = reverseImage(img);
    //draw reversed image
    image(rvImage, img.width, 0); 
}

PImage reverseImage(PImage image1){
    PImage rvImage = createImage(image1.width, image1.height, ALPHA);
    image1.loadPixels();
    int max = image1.height*image1.width;
    int w = image1.width;
    for(int p=0; p< max; p++){
        rvImage.pixels[p] = image1.pixels[(p - (p%w)) + w - (p%w) - 1];
    }
    //refrect rgb on rvImage
    rvImage.updatePixels();
    return rvImage;
}
