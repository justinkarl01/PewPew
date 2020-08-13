/*
 @Class: mainScetch.pde
 @Made by justin karl salimbagat
 @Faceboo_Profile: https://free.facebook.com/leah.berenio
 @Date: 08-12-2020
 */
 
Ship ship;
 
ArrayList<Bullet> bullets;
float time;
 
ArrayList<Enemy> enemies;
float eTime;
 
int score = 1;
int gameState;
 
void setup() {
  size(width, height);
 
  ship = new Ship(width/2, height-143-65);
  bullets = new ArrayList<Bullet>();
  time = millis();
  enemies = new ArrayList<Enemy>();
  eTime = millis();
 
  gameState = 1;
}
 
void draw() {
  background(0);
  stroke(255);
 
  if (gameState == 0) {
    startGame();
  } else if (gameState == 1) {
    mainMenu();
  } else {
    gameOver();
  }
}
 
void startGame() {
  updateShip();
  updateEnemy();
}
 
void mainMenu() {
  textSize(25);
  text("Press anywhere to start", width/5, height/2);
  if (mousePressed) {
    gameState = 0;
  }
}
 
void gameOver() {
  textSize(25);
  text("GameOver: Press anywhere to start", width/7, height/2);
  if (mousePressed) {
    gameState = 0;
  }
}
 
void updateShip() {
  ship.ifEdge();
  ship.draw();
  if (mousePressed) {
    if (mouseX < width/2) {
      ship.move(0);
    } else {
      ship.move(1);
    }
  }
 
  if (millis() - time > 250) {
    bullets.add(new Bullet(ship.x+ship.w/2-5, ship.y+3));
    time = millis();
  }
 
  for (int i = bullets.size()-1; i >= 0; i--) {
    Bullet bullet = (Bullet) bullets.get(i);
    bullet.fire();
    bullet.draw();
 
    if (bullet.y > height) {
      bullets.remove(i);
    }
  }
}
 
void updateEnemy() {
  fill(255);
  if (millis() - eTime > 2500) {
    int randLoc = (int) random(0+30, width-30);
    enemies.add(new Enemy(randLoc, -60));
    eTime = millis();
  }
 
  for (int i = enemies.size()-1; i >= 0; i--) {
    Enemy enemy = (Enemy) enemies.get(i);
    enemy.draw();
    enemy.moveDown();
 
    if (enemy.y > height+60) {
      enemies.remove(i);
      score--;
    }
 
    if (score <= 0) {
      ship.x = width/2;
      enemies.clear();
      score = 1;
      gameState = 2;
    }
 
    for (int j = bullets.size()-1; j >= 0; j--) {
      Bullet bullet = (Bullet) bullets.get(j);
      if (bullet.x > enemy.x && bullet.x < enemy.x+enemy.w && bullet.y > enemy.y && bullet.y < enemy.y+enemy.h) {
        bullets.remove(j);
        enemies.remove(i);
        score++;
      }
    }
  }
 
  textSize(25);
  text("Score: " + score, width/2, height/2);
}
