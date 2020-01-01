public class Shape{
private int x;
private int y;
public int r;
public int g;
public int b;
public int xspeed;
public int yspeed;
public Shape(int xc, int yc){
  x=xc;
  y=yc;
  r= (int) random(0,255);
  g= (int) random(0,255);
  b= (int) random(0,255);
  xspeed= (int) random(-10,10);
  yspeed= (int) random(-10,10);
}
  public int getX(){
    return x;
  }
  public int getY(){
    return y;
  }
  public void display(){
    System.out.println("Can't display abstract shape.");
  }
  public void update(){
    x+=xspeed;
    y+=yspeed;
    if(x <0){
      xspeed=-xspeed;
    }
    if(x>800){
      
      xspeed=-xspeed;
    }
    if(y<0){
      
      yspeed=-yspeed;
    }
    if(y>800){
      
      yspeed=-yspeed;
    }
  }
}
