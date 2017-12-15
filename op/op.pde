import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioPlayer jingle;
FFT fft;

float a = 0;
float f;
PImage k;
int Ni = 0;
float v = 0;

class Stars {
    float x, y, s;
    color w;
    Stars(float _x, float _y, float _s, color _w) {
        this.x = _x;
        this.y = _y;
        this.s = _s;
        this.w = _w;
    }
    void draw() {
        strokeWeight(0.1);
        stroke(0);
        fill(200 + 50 * sin(this.s));
        ellipse(this.x, this.y, 2, 2);
        fill(200 + 50 * sin(this.s));
        if (this.y >=275) {
            this.y = 0;
        }
    }

    void up(float _s) {
        this.s += _s;
    }
}
Stars[] m_array;
class Rain {
    float m, n, o;
    color q;
    Rain(float _m, float _n, float _o, color _q) {
        this.m = _m;
        this.n = _n;
        this.o = _o;
        this.q = _q;
    }
    void draw() {
        stroke(0, 0, 255);
        strokeWeight(3);
        line(this.m, this.n + 10, this.m, this.n);
        fill(this.q);
        if (this.n >= height && millis() <= 68750) {
            this.n = 0;
        }
    }

    void down(float _o) {
        this.n += _o;
    }
}
Rain[] k_array;

void setup() {
    fullScreen(P3D);
    k = loadImage("oi.PNG"); //основная картинка 
    m_array = new Stars[250];
    for (int j = 0; j < 250; j++) {
        m_array[j] = new Stars(random(width), random(310), 2.0, color(255)); //массив дождя 

    }
    k_array = new Rain[500];
    for (int i = 0; i < 500; i++) {
        k_array[i] = new Rain(random(width), random(height) + 9, 10.0, color(0, 0, 255)); //массив звезд 
    }
    minim = new Minim(this);
    jingle = minim.loadFile("09_animal_dzhaz_graffiti_v_zimnem_parke_myzuka.mp3", 1024);
    jingle.loop();


    fft = new FFT(jingle.bufferSize(), jingle.sampleRate());

}



void draw() {
    a = a + 0.0027;
    f = 160 * (cos(a));
    if (a > 1.57 && a <= 10) {
        f = 0;
    }
    background(f, 160 * (cos(a)), 160 * (cos(a)));
    image(k, 0, 0, width, height);
    Ni = Ni + 1;

    fft.forward(jingle.mix);

    if (millis() >= 115000) {
        for (int j = 0; j < 250; j++) {
            m_array[j].draw();
            m_array[j].up(random(0.2) + random(0.4));
        }
    }


    for (int i = 0; i < 500; i++) {
        k_array[i].draw();
        k_array[i].down(fft.getBand(i) * 200); //дождь 
        println(millis());
        println(Ni);

    }

    if ((millis() < 106000) && (millis() >= 71000)) {
        for (int l = 0; l < 1000; l++) {
            stroke(255, 255, 0);
            fill(255, 255, 0);
            ellipse(v - 50, 100, 100 + 0.1 * fft.getBand(l) , 100 + 0.1 * fft.getBand(l) ); //солнце 
            v = v + 0.005;
        }
    }
    if (millis() >= 131000) {
        exit();
    }
}