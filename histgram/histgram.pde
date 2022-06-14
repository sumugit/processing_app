/* @pjs preload="rocky.jpg";*/
size(768, 350);
background(255);
PImage img = loadImage("myphoto.PNG");
image(img, 0, 0);
int[] r = new int[256], g = new int[256], b = new int[256];
img.loadPixels();

//画像の1px毎のrgbに関する度数分布表を作成
for(int p = 0; p < img.width * img.height; p++){
    r[int(red(img.pixels[p]))]++; 
    g[int(green(img.pixels[p]))]++;
    b[int(blue(img.pixels[p]))]++;
}

int maxVal = 0;

//画像のrgb値で最も大きい値を取り出す
for(int i = 0; i < 256; i++){
    if(maxVal < r[i]) maxVal = r[i];
    if(maxVal < g[i]) maxVal = g[i];
    if(maxVal < b[i]) maxVal = b[i];
}

for(int i = 0; i < 256; i++){
    stroke(i, 0, 0);
    //r[i] / maxValで正規化. *200でスケールの調整
    //height, widthは実はデフォルトで指定できた.
    line(i, height, i, height - 200. * r[i] / maxVal);
    stroke(0, i, 0);
    line(i + 256, height, i + 256, height - 200. * g[i] / maxVal);
    stroke(0, 0, i);
    line(i + 512, height, i + 512, height - 200. * b[i] / maxVal);
} 