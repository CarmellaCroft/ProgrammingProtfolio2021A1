//SpaceGame
// by Carmella Croft Dec, 2020

SpaceShip cpc5;
ArrayList<Laser> lasers ;
ArrayList<SpaceRocks> rocks ;
ArrayList<StarFeild> stars ;
ArrayList<EnemyShip> enemies;
ArrayList<EnemyLaser> elasers;
Timer rockTimer, enemyTimer, ticTimer;
SpaceShip ship;
int pass, rockRate, level, laserCount, score, weaponCount, enemyHealth, superWeapon;
boolean play;
String ticText;
boolean ticker;

void setup() {
  size(800, 800);
  cpc5 = new SpaceShip();
  rocks = new ArrayList();
  stars = new ArrayList();
  enemies = new ArrayList();
  lasers = new ArrayList();
  elasers = new ArrayList();
  ship = new SpaceShip();
  rockRate = 1000;
  rockTimer = new Timer(rockRate);
  enemyTimer = new Timer(5000);
  pass = 0;
  level = 1;
  laserCount = 0;
  score = 0;
  weaponCount = 1;
  enemyHealth = 100;
  play = false;
  ticText = "";
  ticTimer = new Timer(2000);
  ticker = false;
  rockTimer.start();
}

void draw() {
  background(0);
  if (!play) {
    startScreen();
  } else {
    background(11);
    // Level Handling 
    if (frameCount % 1000 == 10) {
      level++;
      if (superWeapon > 0) {
        ticText = "Level: " + level + " And Super Weapon is ready!";
      } else {
        ticText = "Level: " + level;
      }

      ticker();
      rockRate-=90;
      enemyHealth+=100;
      rockTimer.totalTime = rockRate;
    }
    stars.add(new StarFeild (int(random(width)), int(random(height))));
    for (int i = 0; i < stars.size(); i++) {
      StarFeild star = stars.get(i);
      star.display();
      star.move();
      if (star.reachedBottom() ) {
        stars.remove(star);
      }
    }
    if (enemyTimer.isFinished()) {
      enemies.add(new EnemyShip(0, 80, int(random(500, 1500)), enemyHealth));
      enemyTimer.start();
    }

    // enemy ship render
    for (int i = 0; i<enemies.size(); i++) {
      EnemyShip enemy = enemies.get(i);
      enemy.move();
      enemy.display();
      // enemy and ship intersection
      if (ship.shipIntersect(enemy)) {
        ship.health-=10;
        score+=enemy.healthStart;
        enemies.remove(enemy);
      }
      if (enemy.isFinished()) {
        elasers.add(new EnemyLaser(enemy.x, enemy.y));
        enemy.start();
      }
    }

    for (int i = elasers.size()-1; i>=0; i--) {
      EnemyLaser elaser = (EnemyLaser) elasers.get(i);
      elaser.fire();
      elaser.display();
      // Enemy Laser vs. Ship
      if (ship.enemyLaserIntersect(elaser)) {
        ship.health-=elaser.power;
        elasers.remove(elaser);
      }
      if (elaser.reachedBottom()) {
        elasers.remove(elaser);
      }
    }
    if (rockTimer.isFinished()) {
      // distribute a rock
      rockTimer.start();
    }

    for (int i = 0; i < rocks.size(); i++) {
      SpaceRocks rock = rocks.get(i);
      rock.display();
      rock.move();
      // detect ship collision
        cpc5.health-=20;  
        if (rock.health<1) {
          score+=rock.healthStart;
          rocks.remove(rock);
        }
      }
      if (rock.reachedBottom() ) {
        pass++;
        rocks.remove(rock);
      }
    }
      for (int i = 0; i < lasers.size(); i++) {
        Laser laser = (Laser) lasers.get(i);
        laser.display();
        laser.fire();
        // laser vs rock collision
        for (int j = 0; j < rocks.size(); j++) {
          SpaceRocks rock = rocks.get(j);
          if (rock.laserIntersect(laser)) {
            lasers.remove(laser);
            rock.health-=10;
            if (rock.health<1) {
              score+=rock.healthStart;
              rocks.remove(rock);
            }
          }
        }
      }
    for (int k = 0; k<enemies.size(); k++) {
        EnemyShip enemy = enemies.get(k);
        if (enemy.laserIntersect(laser)) {
          lasers.remove(laser);
          enemy.health-=20;
          if (enemy.health<1) {
            score+=enemy.healthStart;
            enemies.remove(enemy);
          }
        }
      }
      // dispose of lasers at top
      if (laser.reachedTop()) {
        lasers.remove(laser);
      }
    

    
    // Display Ship
    ship.display(mouseX, mouseY);


    // Display Tic Text
    if (ticker) {
      if (!ticTimer.isFinished()) {
        fill(255, 127);
        textSize(44);
        textAlign(CENTER);
        text(ticText, width/2, height/2);
      } else if (!ticTimer.isFinished() && ship.health < 30) {
        fill(255, 127);
        textSize(44);
        textAlign(CENTER);
        text(ticText, width/2, height/2);
      }
    }

  
    infoPanel();
    cpc5.display(mouseX, mouseY);
    
    // GameOver Logic
    if (ship.health<1 || pass>100) {
      play = false;
      gameOver();
    }
  }
  
  void mousePressed() {
      if (mouseButton == RIGHT && superWeapon > 0) {  //super weapon
    superWeapon--;
    pass = 0;
    weaponCount = 1;
    enemyHealth = 100;
    rockRate = 1000;
    rockTimer.totalTime = rockRate;
    for (int i = 0; i<rocks.size(); i++) {
      SpaceRocks rock = rocks.get(i);
      score+=rock.healthStart;
      rocks.remove(rock);
      rockCount++;
    }
    rocks.removeAll(rocks);
    rockTimer.start();
    for (int i = 0; i<enemies.size(); i++) {
      EnemyShip enemy = enemies.get(i);
      score+=enemy.healthStart;
      enemies.remove(enemy);
      enemy.start();
    }
    enemies.removeAll(enemies);
  }
  if (ship.ammo>0) {
    if (weaponCount == 1) {
      lasers.add(new Laser(ship.x, ship.y));
      laserCount++;
      ship.ammo--;
    } else if (weaponCount == 2) {
      lasers.add(new Laser(ship.x-20, ship.y));
      lasers.add(new Laser(ship.x+20, ship.y));
      laserCount++;
      ship.ammo-=2;
    } else if (weaponCount == 3) {
      lasers.add(new Laser(ship.x, ship.y));
      lasers.add(new Laser(ship.x-20, ship.y));
      lasers.add(new Laser(ship.x+20, ship.y));
      laserCount++;
      ship.ammo-=3;
    } else if (weaponCount == 4) {
      lasers.add(new Laser(ship.x-20, ship.y));
      lasers.add(new Laser(ship.x+20, ship.y));
      lasers.add(new Laser(ship.x-40, ship.y));
      lasers.add(new Laser(ship.x+40, ship.y));
      laserCount++;
      ship.ammo-=4;
    } else if (weaponCount == 5) {
      lasers.add(new Laser(ship.x, ship.y));
      lasers.add(new Laser(ship.x-20, ship.y));
      lasers.add(new Laser(ship.x+20, ship.y));
      lasers.add(new Laser(ship.x-40, ship.y));
      lasers.add(new Laser(ship.x+40, ship.y));
      laserCount++;
      ship.ammo-=5;
    } else if (weaponCount == 6) {
      lasers.add(new Laser(ship.x-20, ship.y));
      lasers.add(new Laser(ship.x+20, ship.y));
      lasers.add(new Laser(ship.x-40, ship.y));
      lasers.add(new Laser(ship.x+40, ship.y));
      lasers.add(new Laser(ship.x-60, ship.y));
      lasers.add(new Laser(ship.x+60, ship.y));
      laserCount++;
      ship.ammo-=6;
    } else if (weaponCount >= 7) {
      lasers.add(new Laser(ship.x, ship.y));
      lasers.add(new Laser(ship.x-20, ship.y));
      lasers.add(new Laser(ship.x+20, ship.y));
      lasers.add(new Laser(ship.x-40, ship.y));
      lasers.add(new Laser(ship.x+40, ship.y));
      lasers.add(new Laser(ship.x-60, ship.y));
      lasers.add(new Laser(ship.x+60, ship.y));
      laserCount++;
      ship.ammo-=7;
    }
  }
}
  
  void ticker() {
  ticTimer.start();
  ticker = true;
  if (ticTimer.isFinished()) {
    ticker = false;
  }
  // Show Level Up

  // Show Low Health Warning

  // Show Rock Pass Warning
}

void startScreen() {
  background(0);
  textAlign(CENTER);
  text("HELLO", width/2, height/2);
  text("Click to Start", width/2, height/2+20);

  if (mousePressed) {
    play = true;
  }
}

  void infoPanel() {
    fill(128, 128);
    rectMode(CORNER);
    rect(0, height-100, width, 100);
    fill(255, 128);
    textSize(20);
    text("health:" + cpc5.health, 60, height-50);
    text("Ammo:" + cpc5.ammo, 220, height-50);
    text("Lives:" + cpc5.lives, 380, height-50);
    text("Score:", 530, height-50);
    text("Level: " + level, 680, height-50);
  }

void gameOver() {
  background(0);
  textAlign(CENTER);
  fill(222);
  text("Game Over!", width/2, height/2);
  text("Final Score:" + score, width/2, height/2+20);
  text("You made it to level " + level, width/2, height/2+40);
  noLoop();
}
