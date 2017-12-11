float a = 0;
PImage k, stoc;

class Klaud {
    float x, y, v;
    PImage k;
    Klaud(float _x, float _y, float _v, PImage _k) {
        this.x = _x;
        this.y = _y;
        this.v = _v;
        this.k = _k;
    }
    void draw() {
        image(k, this.x, this.y + 20, 270, 200);
    }
    void mow(float _v) {
        if (millis() >= 5000) {
            _v = random(3);
        }
        this.x = this.x + _v;
    }
}
class Rain {
    float m,n,o;
    color q;
    Rain(float _m, float _n, float _o, color _q) {
        this.m = _m;
        this.n = _n;
        this.o = _o;
        this.q = _q;
    }
    void draw() {
        stroke(0, 0, 255);
        line(this.m, this.n + 10, this.m, this.n);
        fill(this.q);
        if (this.n >= height) {
            this.n = 0;
        }
    }

    void down(float _o) {
        this.n += _o;
    }
}
Rain[] k_arra;

void setup() {
    size(700, 500);
    k = loadImage("IMG_3940.png");
    stoc = loadImage("IMG_38.PNG");
    k_arra = new Rain[500];
    for (int i = 0; i < 500; i++) {
        k_arra[i] = new Rain(random(width), random(height), 10.0, color(0, 0, 255));

    }
    k_array = new Klaud[50];
    for (int j = 0; j < 50; j++) {
        k_array[j] = new Klaud(random(width) - 200, -55, 0.0, k);
    }

}

Klaud[] k_array;


void draw() {
    a = a + 0.04;
    background(0, 128 * sin(a / 6), 255 * sin(a / 6));
    image(stoc, 0, 0, 700, 500);

    for (int i = 0; i < 500; i++) {
        k_arra[i].draw();
        k_arra[i].down(random(7));
    }

    for (int j = 0; j < 50; j++) {
        k_array[j].draw();
        k_array[j].mow(0);
        println(millis());
    }
}