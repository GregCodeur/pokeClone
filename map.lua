Map = {}

EnumTileType = require('enum');

Map.HEIGHT = 19;
Map.WIDTH = 32;
Map.TILE_WIDTH = 16;
Map.TILE_HEIGHT = 16;

Map.Grid = {};
Map.Grid = {
  {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
  {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
  {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
  {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
  {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
  {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
  {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
  {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
  {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
  {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
  {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
  {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
  {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
  {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
  {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
  {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
  {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
  {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
  {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1}
  }


Map.TileSheet = {};
Map.TileTextures = {};
Map.TileTypes = {};

function Map.Load()
  Map.TileSheet = love.graphics.newImage("images/tileSheet.png");
  
  local nbColonne = Map.TileSheet:getWidth() / Map.TILE_WIDTH;
  local nbLigne = Map.TileSheet:getHeight() / Map.TILE_HEIGHT;
  local id = 1;
  
  --On met en mémoire la position des différentes tiles.
  Map.TileTextures[0] = nil;
  for l = 1, nbLigne do
    for c = 1, nbColonne do
      Map.TileTextures[id] = love.graphics.newQuad((c-1)* Map.TILE_WIDTH,
        (l-1)*Map.TILE_HEIGHT,
        Map.TILE_WIDTH,
        Map.TILE_HEIGHT,
        Map.TileSheet:getWidth(),
        Map.TileSheet:getHeight()
        )
        id = id + 1;
    end
  end
  
  Map.TileTypes[0] = EnumTileType.SolNeutre;
  Map.TileTypes[1] = EnumTileType.SolHerbe;
  Map.TileTypes[2] = EnumTileType.HautesHerbe;
  
  
end

function Map.Draw()
  
  local c,l
  
  for l=1, Map.HEIGHT do
    for c=1, Map.WIDTH do
      local id  = Map.Grid[l][c];
      local texQuad = Map.TileTextures[id];
      if(texQuad ~= nil) then
        love.graphics.draw(Map.TileSheet,texQuad, (c-1)*Map.TILE_WIDTH*2, (l-1)*Map.TILE_HEIGHT*2,0,2,2);
      end
    end
  end
  
end


return Map;
