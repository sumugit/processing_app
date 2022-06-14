void setup() {
    size(400, 300, P3D);
    noStroke();
    fill(0, 192, 192);    
}

void draw() {
    //sphereDetail(res);セグメント数を設定
    sphereDetail(128);
    background(32);
    lightSpecular(255, 255, 255);
    directionalLight(255, 255, 255, -.5, .5, -1);
    specular(255, 255, 255);
    //map(a, b, c, d, e);aをb-c間から比を一定にしながらd-eの移動に変換
    //shininess(shine);輝きの度合
    //マウスの位置が0からwidthに変化するのを1から500の変化にさせる
    shininess(map(mouseX, 0, width, 1, 500));
    translate(width / 2, height / 2, 0);
    sphere(100);
}
