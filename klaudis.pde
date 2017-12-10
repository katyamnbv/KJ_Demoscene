 PImage k;
 void setup() {
 size(1080,680);
 k = loadImage("IMG_3940.PNG");
    k_array = new Klaud[10];
    for (int i = 0; i < 10; i++) {
        k_array[i] = new Klaud(random(width), random(height), 1.0,k);

    }
 }
 class Klaud {
 float x,y,v;
 PImage k;
 Klaud(float _x, float _y, float _v,PImage _k) {
 this.x=_x;
  this.y = _y;
  this.v = _v;
  this.k=_k;
 }
 void draw() {
 image(this.k,this.x,this.y,270,200);
 }
  void mow(float _v) {
      if(millis()>=5000) {_v=3;}
        this.x = this.x + _v;
    }
}
Klaud[] k_array;


void draw() {
  
    background(0,255,255);
    for (int i = 0; i < 10; i++) {
     
        k_array[i].draw();
        k_array[i].mow(0);
        println(millis());

    }}