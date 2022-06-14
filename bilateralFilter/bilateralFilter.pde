
PImage src0, src1, src2, src3, src4, src5, src6, src7;
int m = 5, n = 5;// フィルターの大きさ
int hm = int(m / 2); // フィルターの大きさの半分
int hn = int(n / 2);
void setup(){
    size(2048, 680);
    background(255);
    src0 = loadImage("chikin.jpg");
    src1 = bilateral(src0, 1, 1);
    src2 = bilateral(src1, 1, 1);
    src3 = bilateral(src2, 1, 1);
    src4 = bilateral(src3, 1, 1);
    src5 = bilateral(src4, 1, 1);
    src6 = bilateral(src5, 1, 1);
    src7 = bilateral(src6, 1, 1);
    image(src0, 0, 0);
    image(src1, src0.width, 0);
    image(src2, 2*src0.width, 0);
    image(src3, 3*src0.width, 0);
    image(src4, 0, src0.height);
    image(src5, src0.width, src0.height);
    image(src6, 2*src0.width, src0.height);
    image(src7, 3*src0.width, src0.height);
}

//h(.)を計算する関数
float h(PImage img, float s1, float s2, int k, int l, int j, int i, int col) {
    img.loadPixels();
    float calc = .0;
    if(col == 0){
        calc = exp(-1*(i * i + j * j) / 1000. / s1 / s1) * exp(
            -1*(sq(red(img.pixels[k*img.width + l]) - red(img.pixels[(k + j)*img.width + (l + i)])))
            / 100. / s2 / s2);
    } else if(col == 1){
        calc = exp(-(i * i + j * j) / 1000. / s1 / s1) * exp(
            -1*(sq(green(img.pixels[k*img.width + l]) - green(img.pixels[(k + j)*img.width + (l + i)])))
            / 100. / s2 / s2);
    } else if(col == 2){
        calc = exp(-(i * i + j * j) / 1000. / s1 / s1) * exp(
            -1*(sq(blue(img.pixels[k*img.width + l]) - blue(img.pixels[(k + j)*img.width + (l + i)])))
            / 100. / s2 / s2);   
    }
    return calc;
}

//バイラテラルフィルター
PImage bilateral(PImage img, float s1, float s2) {
    PImage filteredImg = createImage(img.width, img.height, ALPHA);
    img.loadPixels();
    filteredImg.loadPixels();

    //平滑化処理
    for(int k = hm; k < img.height - hm; k++){
        for(int l = hn; l < img.width - hn; l++){
            float sum_fhr = .0, sum_fhg = .0, sum_fhb = .0, sum_hr = .0, sum_hg = .0, sum_hb = .0;
            for(int j = -hm; j <= hm; j++){
                for(int i = -hn; i <= hn; i++){
                    //赤, 緑, 青それぞれでバイラテラルフィルターの分子を求める.
                    sum_fhr += red(img.pixels[(k + j)*img.width + (l + i)]) * h(img, s1, s2, k, l, j, i, 0);
                    sum_fhg += green(img.pixels[(k + j)*img.width + (l + i)]) * h(img, s1, s2, k, l, j, i, 1);
                    sum_fhb += blue(img.pixels[(k + j)*img.width + (l + i)]) * h(img, s1, s2, k, l, j, i, 2);
                    //赤, 緑, 青それぞれでバイラテラルフィルターの分母を求める.
                    sum_hr += h(img, s1, s2, k, l, j, i, 0);
                    sum_hg += h(img, s1, s2, k, l, j, i, 1);
                    sum_hb += h(img, s1, s2, k, l, j, i, 2);
                }
            }
            //バイラテラルフィルターを求める
            filteredImg.pixels[k * img.width + l] = color(sum_fhr/sum_hr, sum_fhg/sum_hg, sum_fhb/sum_hb);
        }
    }
    filteredImg.updatePixels();
    return(filteredImg);
}

PImage filtering(PImage img, float f[][]){
    PImage filteredImg = createImage(img.width, img.height, ALPHA);
    img.loadPixels();
    filteredImg.loadPixels();
    for(int j = hm; j < img.height - hm; j++){ // scan image
        for(int i = hn; i < img.width - hn; i++){
            float sum_r = .0, sum_g = .0, sum_b = .0;
            for(int l = -hm; l <= hm; l++){ // filtering process
                for(int k = -hn; k <= hn; k++){
                    int p = (j + l) * img.width + i + k;
                    sum_r += f[l + hm][k + hn] * red(img.pixels[p]);
                    sum_g += f[l + hm][k + hn] * green(img.pixels[p]);
                    sum_b += f[l + hm][k + hn] * blue(img.pixels[p]);
                }
            }
        filteredImg.pixels[j * img.width + i] = color(sum_r, sum_g, sum_b);
        }
    }
    filteredImg.updatePixels();
    return(filteredImg);
} 