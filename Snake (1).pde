Particle[] snakeBody;
int timer;
int level=1;
double speed=5;
boolean dead;
Apple apple;
boolean restart,pause,resume;
color headColor = color(255);
color backgroundColor = color(0);
boolean newApple = true;
void setup(){
  size(900,700);
  surface.setResizable(true); 
  snakeBody = new Particle[1];
  snakeBody[0] = new Particle(width/2,height/2);
  snakeBody[0].direction="RIGHT";
  snakeBody[0].partColor=headColor;
} 

void draw(){
  if(pause==true){
    speed=0;
    textSize(22);
    fill(0,255,0);
    text("PAUSED", width/2,height/2);
  }
  else if(!dead){
    speed=5;
    timer++;
    //Time to add other snake particle
    if(timer%100==0){
      //increaseSize();
    }
      
    //Increase level
    if(timer%500 == 0){
      level++;
      backgroundColor = color((int) (Math.random()*156)+100,(int) (Math.random()*156)+100,(int) (Math.random()*156)+100);
    }
    background(backgroundColor);
    
    //Draw Score
    textSize(16);
    fill(255);
    text("Level: " + level, width-80, 40);
    text("Score: " + snakeBody.length, width-80, 60);
    //Draw Snake
    for(int i=0; i<snakeBody.length; i++){
       fill(snakeBody[i].partColor);
       rect(snakeBody[i].x,snakeBody[i].y,snakeBody[i].size,snakeBody[i].size);
       snakeBody[i].checkDirection(snakeBody[i].direction);
    }
    
    for(int i=1; i<snakeBody.length; i++){
       snakeBody[i].checkGuider();
    }
       
    
       
    //Check if dead
    die();
    
    //Apples
    if (newApple) {
      apple = new Apple((int) (Math.random()*width),(int) (Math.random()*height));
      newApple = false;
    }
    fill(255,0,0);
    ellipse(apple.x,apple.y,12,12);
    if (Math.abs(snakeBody[0].x-apple.x) <= 15 && Math.abs(snakeBody[0].y-apple.y) <= 15){
      increaseSize();
      newApple = true;
    }
  }
  else{
    textSize(22);
    fill(0,255,0);
    text("YOU DIED", width/2,height/2);
    if(restart){
      dead=false;
      restart=false;
      snakeBody = new Particle[1];
      snakeBody[0] = new Particle(width/2,height/2);
      snakeBody[0].direction="RIGHT";
      snakeBody[0].partColor=headColor;
      timer=0;
      backgroundColor = 0;
      speed=5;
      level=1;
    }
  }
}

void keyPressed(){
  if(keyCode == UP)
   if(snakeBody[0].direction!="DOWN")
      snakeBody[0].direction="UP";
  if(keyCode == DOWN)
    if(snakeBody[0].direction!="UP")
      snakeBody[0].direction="DOWN";
  if(keyCode == LEFT)
    if(snakeBody[0].direction!="RIGHT")
      snakeBody[0].direction="LEFT";
  if(keyCode == RIGHT)
    if(snakeBody[0].direction!="LEFT")
      snakeBody[0].direction="RIGHT";
  if(key == ' ')
    if(dead)
      restart=true;
    else
        pause=!pause;
    
  //Direction changes for snake body
  if(keyCode==RIGHT||keyCode==LEFT||keyCode==DOWN||keyCode==UP)
    for(int i=1; i<snakeBody.length; i++)
      snakeBody[i].addDirectionChange(snakeBody[0].x,snakeBody[0].y,snakeBody[0].direction);
}

public void increaseSize(){
  Particle[] temp = new Particle[snakeBody.length + 1];
  for(int i=0; i<snakeBody.length; i++)
    temp[i] = snakeBody[i];
  snakeBody = temp;
  snakeBody[snakeBody.length-1] = new Particle(0,0);
  if(snakeBody[snakeBody.length-2].direction.equals("RIGHT"))
    snakeBody[snakeBody.length-1] = new Particle(snakeBody[snakeBody.length-2].x-20,snakeBody[snakeBody.length-2].y);
  if(snakeBody[snakeBody.length-2].direction.equals("LEFT"))
    snakeBody[snakeBody.length-1] = new Particle(snakeBody[snakeBody.length-2].x+20,snakeBody[snakeBody.length-2].y);
  if(snakeBody[snakeBody.length-2].direction.equals("UP"))
    snakeBody[snakeBody.length-1] = new Particle(snakeBody[snakeBody.length-2].x,snakeBody[snakeBody.length-2].y+20);
  if(snakeBody[snakeBody.length-2].direction.equals("DOWN"))
    snakeBody[snakeBody.length-1] = new Particle(snakeBody[snakeBody.length-2].x,snakeBody[snakeBody.length-2].y-20);
  snakeBody[snakeBody.length-1].direction = snakeBody[snakeBody.length-2].direction;
  snakeBody[snakeBody.length-1].guider= snakeBody[snakeBody.length-2].guider;  
}

public void die(){
  if(snakeBody[0].x+snakeBody[0].size>width||snakeBody[0].x<0||snakeBody[0].y+snakeBody[0].size>height||snakeBody[0].y<=0)
    dead=true;
  for(int i=1;i<snakeBody.length;i++)
    if(Math.abs(snakeBody[0].x-snakeBody[i].x)< 10 && Math.abs(snakeBody[0].y-snakeBody[i].y)< 10)
      dead=true;
}