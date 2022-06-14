
void setup(){
    size(1050, 400);
    PImage img = loadImage("myimage.png");
    //draw image
    image(img, 0, 0);
    PImage leftImage = leftmirroring(img);
    PImage rightImage = rightmirroring(img);
    //draw left-mirror image
    image(leftImage, img.width, 0); 
    //draw right-mirror image
    image(rightImage, 2*img.width, 0);
}

PImage leftmirroring(PImage image1){
    PImage leftImage = createImage(image1.width, image1.height, ALPHA);
    image1.loadPixels();
    int max = image1.height*image1.width;
    int w = image1.width;
    for(int p=0; p< max; p++){
        if((p%w) < w/2){
        leftImage.pixels[p] = image1.pixels[p];
        } else {
            //left mirroring
            leftImage.pixels[p] = image1.pixels[p - (p%w) + w/2 - p%(w/2)];
        }
    }
    //refrect rgb on leftImage
    leftImage.updatePixels();
    return leftImage;
}

PImage rightmirroring(PImage image1){
    PImage rightImage = createImage(image1.width, image1.height, ALPHA);
    image1.loadPixels();
    int max = image1.height*image1.width;
    int w = image1.width;
    for(int p=0; p< max; p++){
        if((p%w) < w/2){
            //right mirroring
            rightImage.pixels[p] = image1.pixels[p - (p%w) + w - p%(w/2) - 1];
        } else {
            rightImage.pixels[p] = image1.pixels[p];
        }
    }
    //refrect rgb on leftImage
    rightImage.updatePixels();
    return rightImage;
}

