public class Snake implements Getters {
  private int x;
  private int y;
  private int speed;
  String direction;
Direction [] head;
  public Snake(int xc, int yc){
   x=xc;
   y=yc;
   head=new Direction[0];
   speed=2;
   direction="R";
  }
    public int getX(){
    return x;
  }
  public int getY(){
    return y;
  }
   public void update(String str){
    if(str.equals("U"))
      y-=speed;
    if(str.equals("D"))
      y+=speed;
    if(str.equals("L"))
      x-=speed;
    if(str.equals("R"))
      x+=speed;
  }


  
    public void change(int x, int y, String str){
Direction[] temp = new Direction[head.length + 1];
    for(int i=0; i<head.length; i++)
      temp[i] = head[i];
    head = temp;
    head[head.length-1] = new Direction(x,y,str);
  }
    public void follow(){
    if(head.length>=1)
      if(x==head[0].x&&y==head[0].y){
        direction=head[0].Dchange;
     Direction[] temp = new Direction[head.length - 1];
    for(int i=1; i<head.length; i++)
      temp[i-1] = head[i];
    head = temp;
      }
  }

}
