Hero = {};

Hero.SPRITE_HEIGHT = 16;
Hero.SPRITE_WIDTH = 16;
Hero.xOrigine = Hero.SPRITE_WIDTH/2;
Hero.yOrigine = Hero.SPRITE_HEIGHT/2

Hero.x = Hero.xOrigine;
Hero.y = Hero.yOrigine;
Hero.vx = 100;
Hero.vy = 100;
Hero.SpriteSheet = {};
Hero.AnimationSprite = {}
Hero.Etat = "idle";


function Hero.Load()

  Hero.SpriteSheet = love.graphics.newImage("images/characters.png");

  local nbColonne = Hero.SpriteSheet:getWidth() / Hero.SPRITE_WIDTH;
  local nbLigne = Hero.SpriteSheet:getHeight() / Hero.SPRITE_HEIGHT;
  local id = 0;
  
  --On met en mémoire la position des différentes tiles.
  Hero.AnimationSprite[0] = nil;
  for l = 1, nbLigne do
    for c = 1, nbColonne do
      Hero.AnimationSprite[id] = love.graphics.newQuad((c-1)* Hero.SPRITE_WIDTH,
        (l-1)*Hero.SPRITE_HEIGHT,
        Hero.SPRITE_WIDTH,
        Hero.SPRITE_HEIGHT,
        Hero.SpriteSheet:getWidth(),
        Hero.SpriteSheet:getHeight()
        )
        id = id + 1;
    end
  end


end

function Hero.Update(ecranHeight,ecranWidth,dt)
  local oldX = Hero.x;
  local oldY = Hero.y
  
  if(love.keyboard.isDown("down") and Hero.y + Hero.yOrigine < ecranHeight) then
      Hero.y = Hero.y + Hero.vy * dt;
      if Hero.y > ecranHeight then
        Hero.y = oldY;
      end
  end
  if(love.keyboard.isDown("up") and Hero.y - Hero.yOrigine > 0) then
    Hero.y = Hero.y - Hero.vy * dt;
    if(Hero.y < 0) then
      Hero.y = oldY;
    end
  end
  if(love.keyboard.isDown("right") and Hero.x + Hero.xOrigine < ecranWidth) then
    Hero.x = Hero.x + Hero.vx * dt;
    if Hero.x > ecranWidth then
      Hero.x = oldX;
    end
  end
  if(love.keyboard.isDown("left") and Hero.x - Hero.xOrigine > 0) then
    Hero.x = Hero.x - Hero.vx * dt;
    if Hero.x < 0 then
      Hero.x = oldX;
    end
    
  end

end


function Hero.Draw()
  love.graphics.draw(Hero.SpriteSheet,Hero.AnimationSprite[0],Hero.x,Hero.y,0,2,2,Hero.SPRITE_WIDTH/2,Hero.SPRITE_HEIGHT/2);
  love.graphics.setColor(0,0,0);
  love.graphics.print("X : "..Hero.x,10,10);
  love.graphics.print("Y : "..Hero.y,30,30);
  love.graphics.setColor(255,255,255);
  
end

return Hero;
