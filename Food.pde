public class Food implements Getters{
private int x;
private int y;
public int r;
public int g;
public int b;
  public Food(int xc, int yc){
  x=xc;
  y=yc;
  r=25;
  g=25;
  b=25;
  }
    public int getX(){
    return x;
  }
  public int getY(){
    return y;
  }
    public void display(){
     ellipse(x,y,r,r);
  fill(r,g,b);
  }
}
