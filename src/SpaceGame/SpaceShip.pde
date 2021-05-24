class SpaceShip {
  //member varibals
    int r, health, x, y, speed, ammo, lives;
  boolean right;
  
  //constructor
  SpaceShip() {
    x = 0;
    y = 0;
    health = 100;
    lives = 3;
    ammo = 100;
    r= 25;
  }
  
  //display method
  void display(int x, int y) {
    this.x = x;
    this.y = y;
  rectMode(CENTER);
  fill(#F57811);
  stroke(88);
  triangle(x-20,y+25, x-10,y+10, x-20,y+15);
  triangle(x+20, y+25, x+10,y+10, x+20,y+15);
  fill(128);
  rect(x-15,y+10,8,8);
  rect(x+15,y+10,8,8);
  strokeWeight(5);
  line(x-45,y-20,x-5,y+5);
  line(x+50,y-20,x+20,y-1);
  strokeWeight(1);
  triangle(x,y-15,x+35,y+10,x-35,y+10);
  fill(#6870F0);
  ellipse(x,y,20,80);
}
boolean enemyLaserIntersect(EnemyLaser elaser) {
    // Calculate distance
    float distance = dist(x, y, elaser.x, elaser.y); 

    // Compare distance to sum of radii
    if (distance < r + elaser.r) { 
      return true;
    } else {
      return false;
    }
  }
  
  boolean rockIntersect(SpaceRocks rock) {
    // Calculate distance
    float distance = dist(x, y, rock.x, rock.y); 

    // Compare distance to sum of radii
    if (distance < r + rock.r) { 
      return true;
    } else {
      return false;
    }
  }
  

  
  boolean shipIntersect(EnemyShip enemy) {
    // Calculate distance
    float distance = dist(x, y, enemy.x, enemy.y); 

    // Compare distance to sum of radii
    if (distance < r + enemy.r) { 
      return true;
    } else {
      return false;
    }
  }
}
 
