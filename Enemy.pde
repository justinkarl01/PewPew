/*
  @Class: Enemy.pde
  @Made by justin karl salimbagat
  @Faceboo_Profile: https://free.facebook.com/leah.berenio
  @Date: 08-12-2020
*/
 
class Enemy {
  int x, y;
  int w, h;
  int speed;
  
  Enemy(int eX, int eY) {
    x = eX;
    y = eY;
    w = 25;
    h = 60;
    speed = 2;
  }
  
  void moveDown() {
    y += speed;
  }
  
  void draw() {
    rect(x, y, w, h);
  }
  
  void goUp() {
    y = -60;
  }
}
