
local composer = require( "composer" )
local widget = require( "widget" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------




-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

	local font = "amsterdam.otf"

	primaryColor = {0/255, 96/255, 100/255}
	secondaryColor = {0/255, 53/255, 57/255}
	fillColor = {1, 1, 1}

	local sceneGroup = self.view
	-- Code here runs when the scene is first created but has not yet appeared on screen
  display.setDefault( "background", 255/255, 255/255, 255/255 )

--##################### upper tab goes here ####################

  settings = display.newImage( sceneGroup, "pics/settings_whote.png", 40, 40)
  settings:setFillColor( unpack(secondaryColor) )
  local coins = display.newImage( sceneGroup, "pics/school_white.png", 500, 40)
	coins:setFillColor( unpack(secondaryColor) )
  local cross = display.newImage( sceneGroup, "pics/multiply_white.png", 445, 40)
  cross:scale(0.6,0.6)
	cross:setFillColor( unpack(secondaryColor) )
  coinCount = 0
  local coinText = display.newText( sceneGroup, coinCount, 410, 40, font, 46 )
  coinText:setFillColor( unpack(secondaryColor) )

--------------------- upper tab ------------------------
--#################### test buttons #####################
  local testGroup1 = display.newGroup()
  testGroup1.x = display.contentCenterX
  testGroup1.y = 200
  local testRect1 = display.newRect( testGroup1, 0, 0, 450, 120 )
  testRect1:setFillColor(unpack(primaryColor))
  local testLabel1 = display.newText( testGroup1, "Тест Айзенка", -115, -35, font, 30 )
  testLabel1:setFillColor( unpack(fillColor) )

  local tasks1 = display.newImage( testGroup1, "pics/question_white.png", -190, 5)
  tasks1:scale(0.7,0.7)
  local testTaskCount1 = display.newText( testGroup1, ":20", -150, 5, font, 30 )
  testTaskCount1:setFillColor( unpack(fillColor) )

  local time1 = display.newImage( testGroup1, "pics/time_white.png", -80, 5)
  time1:scale(0.7,0.7)
  local timeAmount1 = display.newText( testGroup1, ":20 мин", -10, 5, font, 30 )
  timeAmount1:setFillColor( unpack(fillColor) )

  local help1 = display.newImage( testGroup1, "pics/help_white.png", 180, 0)
  time1:scale(0.7,0.7)

  local scores1 = display.newImage( testGroup1, "pics/star_white.png", -45, 40)
  scores1:scale(0.5,0.5)
  local scoresText1 = display.newText( testGroup1, "98", -5, 40, font, 28 )
  scoresText1:setFillColor( unpack(fillColor) )


--------------------- test buttons ------------------------


end


-- show()
function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is still off screen (but is about to come on screen)

	elseif ( phase == "did" ) then
		-- Code here runs when the scene is entirely on screen

	end
end


-- hide()
function scene:hide( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is on screen (but is about to go off screen)

	elseif ( phase == "did" ) then
		-- Code here runs immediately after the scene goes entirely off screen

	end
end


-- destroy()
function scene:destroy( event )

	local sceneGroup = self.view
	-- Code here runs prior to the removal of scene's view

end


-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene
