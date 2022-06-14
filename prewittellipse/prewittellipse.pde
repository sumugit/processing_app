/* @pjs preload="rockyGray.jpg, rockyNoise.jpg";*/
static int ADSCAlE = 1500000;
float[][] prewittH = {{-1, 0, 1}, {-1, 0, 1}, {-1, 0, 1}};// horizontal direction
float[][] prewittV = {{-1, -1, -1}, {0, 0, 0}, {1, 1, 1}}; // vertical direction

void setup(){
  size(350, 350);
  //input image
  PImage img = loadImage("myphoto.PNG");
  noStroke();
  smooth();
  background(255);
  //draw
  filtering(img, prewittH, prewittV);
}
    
void filtering(PImage img, float f_x[][], float f_y[][]){
    float GradMagnitude, GradRad;
    //f_xは水平方向, f_yは垂直方向
    float min_x = 1000, max_x = -1000, min_y = 1000, max_y = -1000;
    for(int s = 1; s < img.height - 1; s++){// 入力画像の縦方向
        for(int t = 1; t < img.width - 1; t++){ // 入力画像の横方向
            int i = int(random(1, img.width-1));
            int j = int(random(1, img.height-1));
            //結果の合計値格納用
            float sum_x = .0, sum_y = .0;
            //ある注目画素を中心とした上下左右の９つの画素値に対して,以下に示すような係数をそれぞれ乗算し,結果を合計
            for(int l = -1; l <= 1; l++){
                for(int k = -1; k <= 1; k++){
                    //img.pixels[(j) * img.width + i]が注目画素
                    sum_x += f_x[l + 1][k + 1] * color(img.pixels[(j + l) * img.width + i + k]);
                    sum_y += f_y[l + 1][k + 1] * color(img.pixels[(j + l) * img.width + i + k]);
                }
            }
        //水平方向の画素値の最大値, 最小値の更新
        if(sum_x < min_x) min_x = sum_x;
        else if(sum_x > max_x) max_x = sum_x;
        //垂直方向の画素値の最大値, 最小値の更新
        if(sum_y < min_y) min_y = sum_y;
        else if(sum_y > max_y) max_y = sum_y;

        GradMagnitude = sqrt(sq(sum_x) + sq(sum_y));
        GradRad = atan(sum_y/sum_x);

        fill(img.pixels[j * img.width + i]);
            float d = GradMagnitude/ADSCAlE;
            pushMatrix();
            //参照している座標に合わせて回転
            translate(i, j);
            rotate(GradRad + PI/2); //勾配に対して直交するので90度さらに回転
            //draw ellipse
            ellipse(0, 0, d+30, d);
            popMatrix();
        }
    }
} 