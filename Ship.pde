/*
  @Class: Ship.pde
  @Made by justin karl salimbagat
  @Faceboo_Profile: https://free.facebook.com/leah.berenio
  @Date: 08-12-2020
*/
 
class Ship {
  int x, y;
  int w, h;
  float movementSpeed;
  
  Ship(int sX, int sY) {
    x = sX;
    y = sY;
    w = 25;
    h = 60;
    
    movementSpeed = 7;
  }
  
  void draw() {
    rect(x, y, w, h);
  }
  
  void move(int where) {
    if (where == 0) {
      x -= movementSpeed;
    } else {
      x += movementSpeed;
    }
  }
  
  void ifEdge() {
    if (x < 0) {
      x = 0;
    } else if (x > width-w) {
      x = width-w;
    }
  }
}
