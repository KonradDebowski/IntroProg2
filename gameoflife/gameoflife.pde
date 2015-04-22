int dim = 500;
boolean [][] cells = new boolean [dim][dim];
boolean [][] temp = new boolean [dim][dim];

void setup ()
{
  size(1000,1000);
  frameRate(5);
  LosujKomorki();
  noStroke();
}
void draw ()
{
  background(0);
  update ();
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

int LiczbaSasiadow (int col, int row) 
{
int n = 0; //licznik sasiadow
if (SprawdzSasiada (col-1,row-1)) n=n+1;
if (SprawdzSasiada (col,row-1)) n=n+1;
if (SprawdzSasiada (col+1,row-1)) n=n+1;
if (SprawdzSasiada (col-1,row)) n=n+1;
if (SprawdzSasiada (col+1,row)) n=n+1;
if (SprawdzSasiada (col-1,row+1)) n=n+1;
if (SprawdzSasiada (col,row+1)) n=n+1;
if (SprawdzSasiada (col+1,row+1)) n=n+1;

return n;
}

boolean SprawdzSasiada(int col, int row){
  if (col<0||row<0||col>=dim||row>=dim) return false;
return cells [row][col];
}

void update () {
  int sasiedzi = 0;
  for (int row = 0; row < dim;row++) {
    for (int col = 0; col < dim;col++) {
       sasiedzi = LiczbaSasiadow (col, row);
       if (sasiedzi>2 && sasiedzi<7) temp[col][row]=true; else temp[col][row]=false; 
  }
    }
    arrayCopy(temp,cells);
    
}
