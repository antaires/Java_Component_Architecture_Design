STAG Report

CONCEPT
I used this exercise as an opportunity to gain experience refactoring a project from using inheritance to component architecture. I chose to use Processing for graphics.

In the game, the player controls a ship using the WASD keys, while it fires automatically. The ship always faces forward. Enemies are randomly spawned from the top, left or right of the screen and move erratically across and down, firing as they go. The game continues until the player's health is zero. The player gains points by killing enemies. 

EXTENSIONS / POINTS OF INTEREST
To begin, I built a position vector class, and basic game engine physics. At first I designed this game using an OOP style using inheritance with (GameObject -> Mover -> Player/Enemy/Bullet, Shooter, Vector classes). I worked on a basic game manager that can switch between different screens.

After getting basic functionality, I refactored everything to try the component method. I decided to have one entity class for everything (Player, Enemy, Bullet, Rock). The components attached to entity are Renderer, Shooter, Health, Position, AI, Input, Points, Health. I used tags to distinguish different entities with an enum class. I also created a collision detection system, that is called from within the main game loop. When a bullet hits an enemy, they are killed and the renderer and shooter associated with them are turned off. If the player is hit by an enemy bullet, the player looses health. 

After trying both methods, I can really appreciate the advantages offered by the component  system, and want to work with this design pattern more going forward. 

THINGS TO IMPROVE
There are a lot of things to work on going forward, for example I would like to build a UI_Entity that holds boxes, panels, buttons, text etc and use this to display the player's score and health, among other things. 

I want to add in more complex AI behaviour, and have waves of enemies that descend on the player in an infinite way.

I also want to improve the visual look of the game and bring in sprites, static images and special effects like particles and explosions.

