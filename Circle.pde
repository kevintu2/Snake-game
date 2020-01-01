public class Circle extends Shape{
  private int radius;
public Circle(int x, int y, int r){
super(x,y);
r=radius;
}
public int getRadius(){
  return radius;
}
public void display(){
  ellipse(getX(),getY(),r,r);
  fill(r,g,b);
}
}
