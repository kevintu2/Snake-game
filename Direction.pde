public class Direction implements Getters{
  private int x;
  private int y;
  public String Dchange;
  public Direction(int c, int v, String str){
    x=c;
    y=v;
    Dchange=str;
  }
  public int getX(){
    return x;
  }
  public int getY(){
    return y;
  }
}
