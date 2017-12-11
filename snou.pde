class Lajn { 
float x, y, s; 
color w; 
Lajn(float x, float y, float s, color w){ 
this.x = x; 
this.y = y; 
this.s = s; 
this.w = w; 
} 
void draw() { 
line(this.x,this.y+10,this.x,this.y); 
fill(this.w); 
if (this.y >=height) {this.y=0;}
} 

void down(float s) { 
this.y+=s; 
} 
} 

Lajn[] k_array; 

void setup() 
{ 
size(600,600); 
k_array = new Lajn[100]; 
for(int i=0; i<100; i++){ 
k_array[i] = new Lajn(random(width), random(height), 10.0, color(0)); 

} 
} 

void draw() 
{ 
background(255); 
for(int i=0; i<100; i++){ 
k_array[i].draw(); 
k_array[i].down(5); 

} 
}