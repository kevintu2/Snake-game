public class Particle{
  int x,y;
  int size=15;
  String direction;
  directionChanges[] guider;
  color partColor = color(0, (int) (Math.random()*156)+100, 0);
  
  public Particle(int ix, int iy){
   x=ix;
   y=iy;
   guider = new directionChanges[0];
  }
  
  public void setPos(int ix, int iy){
   x=ix;
   y=iy;
  }
  
  
  public void checkDirection(String str){
    if(str.equals("UP"))
      y-=speed;
    if(str.equals("DOWN"))
      y+=speed;
    if(str.equals("LEFT"))
      x-=speed;
    if(str.equals("RIGHT"))
      x+=speed;
  }
  
  public void checkGuider(){
    if(guider.length>=1)
      if(x==guider[0].x&&y==guider[0].y){
        direction=guider[0].directionChange;
        chopGuider();
      }
  }
  
  public void addDirectionChange(int x, int y, String str){
    directionChanges[] temp = new directionChanges[guider.length + 1];
    for(int i=0; i<guider.length; i++)
      temp[i] = guider[i];
    guider = temp;
    guider[guider.length-1] = new directionChanges(x,y,str);
  }
  
  public void chopGuider(){
    directionChanges[] temp = new directionChanges[guider.length - 1];
    for(int i=1; i<guider.length; i++)
      temp[i-1] = guider[i];
    guider = temp;
  }

}