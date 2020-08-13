/*
  @Class: Bullet.pde
  @Made by justin karl salimbagat
  @Faceboo_Profile: https://free.facebook.com/leah.berenio
  @Date: 08-12-2020
*/
 
class Bullet {
  int x, y;
  int w, h;
  int speed;
  
  Bullet(int bX, int bY) {
    x = bX;
    y = bY;
    w = 8;
    h = 13;
    speed = 15;
  }
  
  void fire() {
    y -= speed;
  }
  
  void draw() {
    rect(x, y, w, h);
  }
}
