local Game = {};
Game.Map = require("Map");
Game.Hero = require("hero");

function Game.Load()
  Map.Load();
  Hero.Load();
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  
end

function Game.Update(dt)
  Hero.Update(hauteur,largeur,dt);
end

function Game.Draw()
  Map.Draw();
  Hero.Draw();
end

function Game.keypressed(key)
  
  print(key)
  
end


return Game;
