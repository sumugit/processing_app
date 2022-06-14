int textHeight = 30, n = 0;

void setup(){
    size(400, 40);
    textFont(createFont("Temple Sans ITC", 24));
    fill(0);
}

long factorial(int n) {
    if(0 == n) return 1; //再帰の終了
    else return n*factorial(n-1);
}

void mousePressed() {
    if((mouseButton == LEFT) && (n < 15)) n++;
    else if((mouseButton == RIGHT) && (n > 0)) n--;
}

void draw() {
    background(255);
    text("factorial(" + n + ") = " + factorial(n), 10, textHeight);
}