/* @pjs preload="rockyGray.jpg, rockyNoise.jpg";*/
float[][] prewittH = {{-1, 0, 1}, {-1, 0, 1}, {-1, 0, 1}};// horizontal direction
float[][] prewittV = {{-1, -1, -1}, {0, 0, 0}, {1, 1, 1}}; // vertical direction
void setup(){
    size(1050, 330);
    PImage src = loadImage("myfhoto.PNG");
    image(src, 0, 0);
    image(filtering(src, prewittH), src.width, 0);
    image(filtering(src, prewittV), 2 * src.width, 0);
}
    
PImage filtering(PImage img, float f[][]){
    PImage filteredImg = createImage(img.width, img.height, ALPHA);
    float[] diff = new float[img.width * img.height]; // array for save dfferentials
    float min = 1000, max = -1000;
    for(int j = 1; j < img.height - 1; j++){// scan image
        for(int i = 1; i < img.width - 1; i++){
            float sum = .0;
            for(int l = -1; l <= 1; l++)// filtering process
                for(int k = -1; k <= 1; k++)
                    sum += f[l + 1][k + 1] * color(img.pixels[(j + l) * img.width + i + k]);
        if(sum < min) min = sum;
        else if(sum > max) max = sum;
        diff[j * img.width + i] = sum; //これがエッジの大きさに影響与える
        }
    }
    float max_v = max > abs(min) ? max : abs(min);
    filteredImg.loadPixels();
    for(int p = 0; p < img.width * img.height; p++) // save magnitude
        filteredImg.pixels[p] = color(255 * (1 - abs(diff[p] / max_v)));
    filteredImg.updatePixels();
    return(filteredImg);
} 