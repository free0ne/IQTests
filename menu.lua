
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

	local sceneGroup = self.view
	-- Code here runs when the scene is first created but has not yet appeared on screen
  display.setDefault( "background", 240/255, 240/255,245/255 )

--##################### upper tab goes here ####################

  settings = display.newImage( sceneGroup, "pics/settings.png", 40, 40)

  local coins = display.newImage( sceneGroup, "pics/school.png", 500, 40)
  local cross = display.newImage( sceneGroup, "pics/multiplyb.png", 445, 40)
  cross:scale(0.9,0.9)
  coinCount = 0
  local coinText = display.newText( sceneGroup, coinCount, 410, 40, native.systemFont, 46 )
  coinText:setFillColor( 0, 0, 0 )

--------------------- upper tab ------------------------
--#################### test buttons #####################
  local testGroup1 = display.newGroup()
  testGroup1.x = display.contentCenterX
  testGroup1.y = 200
  local testRect1 = display.newRect( testGroup1, 0, 0, 450, 120 )
  testRect1:setFillColor(66/255, 134/255, 244/255)
  local testLabel1 = display.newText( testGroup1, "Название 1", -130, -35, native.systemFont, 30 )
  testLabel1:setFillColor( 0, 0, 0 )

  local tasks1 = display.newImage( testGroup1, "pics/question.png", -190, 5)
  tasks1:scale(0.7,0.7)
  local testTaskCount1 = display.newText( testGroup1, ":20", -150, 5, native.systemFont, 30 )
  testTaskCount1:setFillColor( 0, 0, 0 )

  local time1 = display.newImage( testGroup1, "pics/time.png", -80, 5)
  time1:scale(0.7,0.7)
  local timeAmount1 = display.newText( testGroup1, ":20 мин", -10, 5, native.systemFont, 30 )
  timeAmount1:setFillColor( 0, 0, 0 )

  local help1 = display.newImage( testGroup1, "pics/help.png", 180, 0)
  time1:scale(0.7,0.7)

  local scores1 = display.newImage( testGroup1, "pics/star.png", -45, 40)
  scores1:scale(0.5,0.5)
  local scoresText1 = display.newText( testGroup1, "98", -5, 40, native.systemFont, 28 )
  scoresText1:setFillColor( 0, 0, 0 )


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
