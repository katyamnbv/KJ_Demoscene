float a=0;
class Kvadrat { 
float x, y, s; 
color w; 
Kvadrat(float _x, float _y, float _s, color _w){ 
this.x = _x; 
this.y = _y; 
this.s = _s; 
this.w = _w; 
} 
void draw() { 
ellipse(this.x,this.y,this.s,this.s); 
fill(this.w); 
if (this.y >=height) {this.y=0;}
} 

void down(float _s) { 
this.y+=_s; 
} 
} 

Kvadrat[] k_array; 

void setup() 
{ 
size(600,600); 
k_array = new Kvadrat[500]; 
for(int i=0; i<500; i++){ 
k_array[i] = new Kvadrat(random(width), random(2*height)-height, 3.0, color(255)); 

} 
} 

void draw() 
{ 
a=a+0.04;
background(0,128*sin(a/6),255*sin(a/6));
println(millis());

for(int i=0; i<500; i++){ 
k_array[i].draw(); 
k_array[i].down(random(1)); 

} 
}