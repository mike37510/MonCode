-------------------------------------------------------------------------------------------------------------------

function love.load()
    
    -- taille de mon ecran
      love.window.setMode( 900, 600 )
  
    -- timer
      ms = 0
      s = 0
      m = 0
      x = 0
    
    -- chargement des sprites repos
      monpersorepos1 = love.graphics.newImage("/monperso/idle/framer-1.png")
      monpersorepos2 = love.graphics.newImage("/monperso/idle/framer-2.png")
      monpersorepos3 = love.graphics.newImage("/monperso/idle/framel-1.png")
      monpersorepos4 = love.graphics.newImage("/monperso/idle/framel-2.png")
  
    -- chargement des sprites gauche
      monpersorleft1 = love.graphics.newImage("/monperso/run/framel-1.png")
      monpersorleft2 = love.graphics.newImage("/monperso/run/framel-2.png")
      monpersorleft3 = love.graphics.newImage("/monperso/run/framel-3.png")
      monpersorleft4 = love.graphics.newImage("/monperso/run/framel-4.png")
  
    -- chargement des sprites droite
      monpersoright1 = love.graphics.newImage("/monperso/run/framer-1.png")
      monpersoright2 = love.graphics.newImage("/monperso/run/framer-2.png")
      monpersoright3 = love.graphics.newImage("/monperso/run/framer-3.png")
      monpersoright4 = love.graphics.newImage("/monperso/run/framer-4.png")
  
    -- chargement des sprites saut
      monpersohaut = love.graphics.newImage("/monperso/jumpup/frame.png")
  
    -- chargement des sprites bas
      monpersobasl = love.graphics.newImage("/monperso/sliding/framel.png")
      monpersobasr = love.graphics.newImage("/monperso/sliding/framer.png")
  
    -- init de mon perso
      monpersox, monpersoy, monpersovitesse, monpersovitesserepos = 200, 200, 3 , 2
      monpersoaction = monpersorepos1
      monpersoscalex = 0.5
      monpersoscaley = 0.5
      monpersorientation = 0
      monpersotimer = 0
      monpersodirection = left
  
  end
  
  -------------------------------------------------------------------------------------------------------------------
  
  function timer()
  
    ms = ms + 1
  
    if ms == 60 then
        s = s + 1
        ms = 0
    end
  
    if s == 60 then
        m = m + 1
        s = 0
    end
  
  end
  
  -------------------------------------------------------------------------------------------------------------------
  
  function down()
  
    if monpersodirection == left then
      monpersoaction = monpersobasl
    end
    
    if monpersodirection == right then
      monpersoaction = monpersobasr
    end
  
  end
  
  -------------------------------------------------------------------------------------------------------------------
  
  function up()
    
      monpersoaction = monpersohaut
      monpersoy = monpersoy - monpersovitesse
  
    end
  
  -------------------------------------------------------------------------------------------------------------------
  
  function left()
  
    x=ms
    
    if x <= 15 then
      monpersoaction = monpersorleft1
    end
  
    if x > 15 and x <= 30 then
      monpersoaction = monpersorleft2
    end
  
    if x > 30 and x <= 45 then
      monpersoaction = monpersorleft3
    end
  
    if x > 45 and x <= 60 then
      monpersoaction = monpersorleft4
    end
  
    monpersox = monpersox - monpersovitesse
    monpersodirection = left
  
  end
  
  -------------------------------------------------------------------------------------------------------------------
  
  function right()
    
    x=ms
    
    if x <= 15 then
   
      monpersoaction = monpersoright1
    end
  
    if x > 15 and x <= 30 then
      monpersoaction = monpersoright2
    end
  
    if x > 30 and x <= 45 then
      monpersoaction = monpersoright3
    end
  
    if x > 45 and x <= 60 then
      monpersoaction = monpersoright4
    end
  
    monpersox = monpersox + monpersovitesse
    monpersodirection = right
  
  end
  
  -------------------------------------------------------------------------------------------------------------------
  
  function repos()
    
  x=ms
  
  if monpersodirection == right then
  
    if x < 30 then
      monpersoaction = monpersorepos1
    else
      monpersoaction = monpersorepos2
    end
  
  end
  
  if monpersodirection == left then
  
    if x < 30 then
      monpersoaction = monpersorepos3
    else
      monpersoaction = monpersorepos4
    end
  
  end
  
  end
  
  -------------------------------------------------------------------------------------------------------------------
  
  function love.update(dt)
     
    timer()
    repos()
  
    -- Control
    if love.keyboard.isDown( "down" ) then
      down()
    end
  
    if love.keyboard.isDown( "space" ) then
      up()
    end
  
    if love.keyboard.isDown( "left" ) then
      left()
    end
  
    if love.keyboard.isDown( "right" ) then
      right()
    end
  
  end
   
  -------------------------------------------------------------------------------------------------------------------
  
  function love.draw()
     
    -- Affiche mon perso
    love.graphics.draw(monpersoaction, monpersox, monpersoy, monpersorientation, monpersoscalex, monpersoscaley)
  
    -- Affiche mon timer
    love.graphics.print(m.." : ", 0, 0)
    love.graphics.print(s.." : ", 20, 0)
    love.graphics.print(ms, 40, 0)
  
  end
  
  -------------------------------------------------------------------------------------------------------------------