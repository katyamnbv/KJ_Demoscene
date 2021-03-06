import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioPlayer jingle;
FFT fft;

float a = 0;
float f;
PImage k, stoc;


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
    size(700, 500,P3D);
    k = loadImage("IMG_3940.png");
    stoc = loadImage("IMG_38.PNG");
   
    k_arra = new Rain[500];
    for (int i = 0; i < 500; i++) {
    k_arra[i] = new Rain(random(width), random(height)+9, 10.0, color(0, 0, 255));
    }
     minim = new Minim(this);
    jingle = minim.loadFile("09_animal_dzhaz_graffiti_v_zimnem_parke_myzuka.mp3", 1024);
    jingle.loop();


    fft = new FFT(jingle.bufferSize(), jingle.sampleRate());

}



void draw() {
    a = a + 0.005;
    f=160-160*(sin(a/2));
    if (a>3.14){f=0;}
    background(f,160-160*(sin(a/2)),160-160*(sin(a/2)));
    image(stoc, 0, 0, 700, 500);

fft.forward(jingle.mix);

  
    
    for (int i = 0; i < 500; i++) {
        k_arra[i].draw();
        k_arra[i].down(fft.getBand(i)*10 );
        println(millis());
    }

    
}