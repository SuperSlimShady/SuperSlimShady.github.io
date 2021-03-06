/**
  *Author: Landon Campos  
  *Version: 1 5/16/19
  */
PImage uwu; 
PImage ted2; 
PImage wall; 
PImage starting;
int gamestate = 1;
int score = 0;
int highScore = 0;
int x = 0, y , vy = 0;
int[] wx = new int[2];
int[] wy = new int[2];

void setup(){
size(750,1000);
//fullScreen();
uwu = loadImage("./uwu.png");
ted2 = loadImage("./ted2.png");
wall = loadImage("./wall.png");
starting = loadImage ("./starting.png");      
     
}
void draw() {
    
  if(gamestate == 0) {
      imageMode(CORNER);
      image(uwu, x, 0);
      image(uwu, x+uwu.width, 0);
      imageMode(CENTER);
     x -= 6;
     vy += 1;
     y += vy;  
     for(int i = 0  ; i < 2; i++) {
       //wy[i] = (int)random(25,height/200 + 150);
       image(wall, wx[i] , wy[i] - (wall.height/2+150));
      image(wall, wx[i] , wy[i] + (wall.height/2+150));
       if(wx[i]  < 0) {
         wy[i] = (int)random(200,height-200 );
         wx[i] = width;
        }
        if(wx[i] == width/2) {
          score++;
          highScore = max(score, highScore);  
      }
      if( y > height || y < 0 || (abs(width/2-wx[i])<25 && abs (y-wy[i])>100)) {    
     gamestate = 1;
   }
        wx[i] -= 6;
     }  
           image(ted2, width/2 , y);
     text(""+score, width/2-15, 700);   
    }
     if(x < -(uwu.width)){
       x = 0;
     }
    
     if(gamestate == 1) {
       imageMode(CENTER);
       image(starting, width/2,height/2);
       text("High Score: "+highScore, 50, width);
    }
   }



void mousePressed(){
 vy = -17;
  if(gamestate==1) {
    wx[0] = 600;
    wy[0] = height/2;
    wx[1] = 900;
    wy[1] = 600;
    x = 0;
    y = height / 2;
    gamestate = 0;
  


}
}





  
