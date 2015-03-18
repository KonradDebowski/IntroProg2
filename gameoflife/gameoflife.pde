int dim = 20;
boolean [][] cells = new boolean [dim][dim];


void setup ()
{
  size(400,400);
  frameRate(10);
  LosujKomorki();
  noStroke();
}
void draw ()
{
  background(0);
    for (int row = 0; row < dim;row++) {
      for (int col = 0; col < dim;col++) {
        if(cells [col][row]) fill(0); else fill (0,225,0); 
        rect(col*width/dim,row*height/dim,width/dim,height/dim);
      }
    }
}  
void LosujKomorki() {  
  for (int row = 0; row < dim;row++) {
    for (int col = 0; col < dim;col++) {
      cells [col][row]= losuj(); 
      
    }
  }  
}
boolean losuj () {
float r = random(1000); 
if(r>500) return true; return false;}
void keyPressed(){ if (key=='r') LosujKomorki();}

