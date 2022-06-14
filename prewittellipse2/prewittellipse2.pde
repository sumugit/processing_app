/* @pjs preload="rockyGray.jpg, rockyNoise.jpg";*/
static int ADSCAlE = 2000000;
float[][] prewittH = {{-1, 0, 1}, {-1, 0, 1}, {-1, 0, 1}};// horizontal direction
float[][] prewittV = {{-1, -1, -1}, {0, 0, 0}, {1, 1, 1}}; // vertical direction

PImage img;

void setup(){
  size(350, 350);
  noStroke();
  smooth();
  background(255);
  //input image
  img = loadImage("myphoto.PNG");
}
    
void draw(){
    float GradMagnitude, GradRad;
    //prewittHは水平方向, prewittVは垂直方向
    float min_x = 1000, max_x = -1000, min_y = 1000, max_y = -1000;
            int i = int(random(1, img.width-1));
            int j = int(random(1, img.height-1));
            //結果の合計値格納用
            float sum_x = .0, sum_y = .0;
            //ある注目画素を中心とした上下左右の９つの画素値に対して,以下に示すような係数をそれぞれ乗算し,結果を合計
            for(int l = -1; l <= 1; l++){
                for(int k = -1; k <= 1; k++){
                    //img.pixels[(j) * img.width + i]が注目画素
                    sum_x += prewittH[l + 1][k + 1] * color(img.pixels[(j + l) * img.width + i + k]);
                    sum_y += prewittV[l + 1][k + 1] * color(img.pixels[(j + l) * img.width + i + k]);
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
            ellipse(0, 0, 5*d + 10, 3*d + 5);
            popMatrix();
} 