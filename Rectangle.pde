public class  Rectangle extends Shape{
  private int w, h;
  public Rectangle(int x, int y, int wi, int he){
    super(x,y);
    w=wi;
    h=he;
  }
  public int getWidth(){
    return w;
  }
  public int getHeight(){
    return h;
  }
  public void display(){
    rectMode(CENTER);
    rect(getX(),getY(),w,h);
    fill(r,g,b);
  }
}
