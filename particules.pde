import java.util.*;

List<Cercle> cercles = new ArrayList<Cercle>();
int w,h;
int particlesLength;

void setup(){
fullScreen();
particlesLength = floor(width/10);
w = width;
h = height;



for(int i = 0; i <particlesLength; i++)
{
  cercles.add(new Cercle());
}

}

void draw(){
 background(55, 100, 144);
for(int i = 0; i < particlesLength; i++){
      Cercle cercle = cercles.get(i);
      cercle.move();
      cercle.disp();
      cercle.connect();
      }

}




class Cercle
{
  PVector pos;
  PVector dir;
  
  Cercle()
  {
  pos = new PVector(random(w),random(h));
  dir = new PVector(random(-5,5),random(-5,5));
  }
  
  void move()
  {
    pos.x += dir.x;
    pos.y += dir.y;
    bord();
  }
  
  void disp()
  {
  noStroke();
  fill(255, 255, 255);
  circle(pos.x,pos.y,10);
  }
  
  void bord()
  {
  if(pos.x > w || pos.x <0)
  {
  dir.x = -dir.x;
  }
  if(pos.y > h || pos.y <0)
  {
  dir.y = -dir.y;
  }   
    
  }
  
  void connect()
  {
      for(int i = 0; i < particlesLength; i++){
      Cercle cercle = cercles.get(i);
      float d = dist(pos.x,pos.y,cercle.pos.x,cercle.pos.y);
      if(d <100){
        stroke(255, 255, 255);
        line(pos.x,pos.y,cercle.pos.x,cercle.pos.y);
        }
       }
  }
}
