/*INVASTION Retro style space shooter game*/
import java.util.*; 

/*0: initial screen
 1: game screen
 2: game-over screen
 */

int gameScreen = 0; 
int initScreenTimer = 120;
int numEnemies = 10;

// Entity(tag, hasRender, hasInput, hasAI, hasShooter, hasHealth, hasPoints)
Entity player;
List<Entity> enemyList;
List<Entity> enemyBulletList;
List<Entity> playerBulletList;
BoxCollider collider; 

void setup() {
  size(500, 700);
  collider = new BoxCollider();
  player = new Entity(Tag.PLAYER, true, true, false, true, true, true);
  enemyBulletList = new ArrayList<Entity>();
  //playerBulletList = new ArrayList<Entity>();
  enemyList = new ArrayList<Entity>();
  for (int i = 0; i < numEnemies; i++){
    Entity enemy = new Entity(Tag.ENEMY, true, false, true, true, false, false); 
    enemyList.add(enemy);
  }
}

/******* GAME MANAGER ********/
void draw() {
  //display contents of the current screen
  if (gameScreen == 0) {
    initScreen();
  } else if (gameScreen == 1) {
    gameScreen();
  } else if (gameScreen == 2) {
    gameOverScreen();
  }
}

/******* SCREEN CONTENTS ********/
void initScreen() {
  background(0);
  textAlign(CENTER);
  text("welcome to\n\nFRACTURED SPACE\n\nSurvive the swarm\n\nMove: WASD", width/2, height/2);
  
  //after timer, switch to game
  if (initScreenTimer-- < 0){
    gameScreen = 1;
  }
}

void gameScreen() {

  //draw background
  color deepBlue = color(8, 0, 168);
  background(deepBlue);
  
  //update bullet lists
  playerBulletList = player.shooter.getMagazine();

  //update player/enemies and do collision check
  player.update();
  //check for collision against all enemey bullets
  
  for (int i = 0; i < enemyList.size(); i++){
       enemyList.get(i).update();
       //check for collision against all player bullets
       for (int j = 0; j < playerBulletList.size(); j++){
         if (collider.hasCollision(enemyList.get(i), playerBulletList.get(j))){
           System.out.println("ENEMY COLLIDED WITH PLAYER BULLET");
           playerBulletList.get(i).setRender(false);
           enemyList.get(i).kill();
           //give player points
           player.increasePoints(5);
         }
       }
  }
  
  //check if player dead, and move to Game over screen
  if (player.isDead()){
    gameScreen = 2; 
  }
}

void gameOverScreen() {
  background(0);
  textAlign(CENTER);
  text("GAME OVER", height/2, width/2); 
  //at the end, button to restart to gamescreen = 1
}

/* ------ EVENT LISTENERS ------ */

void keyPressed() {
  player.input.setMove(keyCode, true);
}

void keyReleased() {
  player.input.setMove(keyCode, false);
}
