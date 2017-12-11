float a = 0;
class Rain {
    float x, y, s;
    color w;
    Rain(float _x, float _y, float _s, color _w) {
        this.x = _x;
        this.y = _y;
        this.s = _s;
        this.w = _w;
    }
    void draw() {
        line(this.x, this.y+10, this.x, this.y);
        fill(this.w);
        if (this.y >= height) {
            this.y = 0;
        }
    }

    void down(float _s) {
        this.y += _s;
    }
}

Rain[] k_array;

void setup() {
    size(600, 600);
    k_array = new Rain[500];
    for (int i = 0; i < 500; i++) {
        k_array[i] = new Rain(random(width), random(height), 10.0, color(255));

    }
}

void draw() {
    a = a + 0.04;
    background(0, 128 * sin(a / 6), 255 * sin(a / 6));
    println(millis());

    for (int i = 0; i < 500; i++) {
        k_array[i].draw();
        k_array[i].down(random(5));

    }
}