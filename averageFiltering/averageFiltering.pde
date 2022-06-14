/* @pjs preload="rocky.jpg";*/ 
int w = 3;
// filter width
int hw = int(w / 2);// half size of filter width
float a = 1. / (w * w);
float[][] averageFilter = {{a, a, a}, {a, a, a}, {a, a, a}};// 3x3 average filter
void setup(){
    size(800, 350);
    PImage src = loadImage("myimage.png");
    image(src, 0, 0);
    image(filtering(src, averageFilter), src.width, 0);
}
PImage filtering(PImage img, float f[][]){
    PImage filteredImg = createImage(img.width, img.height, RGB);
    img.loadPixels();
    filteredImg.loadPixels();
    for(int j = hw; j < img.height - hw; j++){ // scan image
        for(int i = hw; i < img.width - hw; i++){
            float sum_r = .0, sum_g = .0, sum_b = .0;
            for(int l = -hw; l <= hw; l++){ // filtering process
                for(int k = -hw; k <= hw; k++){
                    int p = (j + l) * img.width + i + k;
                    sum_r += f[l + hw][k + hw] * red(img.pixels[p]);
                    sum_g += f[l + hw][k + hw] * green(img.pixels[p]);
                    sum_b += f[l + hw][k + hw] * blue(img.pixels[p]);
                    }
                }
            filteredImg.pixels[j * img.width + i] = color(sum_r, sum_g, sum_b);
            }
        }
        filteredImg.updatePixels();
        return(filteredImg);
} 