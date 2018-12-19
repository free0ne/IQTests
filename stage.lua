
local composer = require( "composer" )
local sqlite3 = require( "sqlite3" )

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

  testName = "ayzenka_1"
  level = 1
  primaryColor = {0/255, 96/255, 100/255}

	local sceneGroup = self.view
	-- Code here runs when the scene is first created but has not yet appeared on screen
  display.setDefault( "background", 155/255, 155/255, 155/255 )



  ---------\\\\\\\\\\\\\\     SQL    \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    local path = system.pathForFile( "iqtests", system.DocumentsDirectory )
    local db = sqlite3.open( path )

    -- Handle the "applicationExit" event to close the database
    local function onSystemEvent( event )
        if ( event.type == "applicationExit" ) then
            db:close()
        end
    end


    --local sql = "SELECT * FROM category"..testName.." WHERE id = "..level
    local sql = "SELECT * FROM "..testName
    myTestArray = {}
    local taskNummer = 0
     local taskType = 0 --1:все картинки
     local answerCount = 0
    for row in db:nrows(sql) do
      taskNummer = taskNummer+1
      myTestArray[taskNummer] = {}
      myTestArray[taskNummer]["type"] = row.type
      myTestArray[taskNummer]["task"] = row.task
      myTestArray[taskNummer]["answerCount"] = row.answerCount
      if myTestArray[taskNummer]["answerCount"] >= 4 then
        myTestArray[taskNummer]["answer1"] = row.answer1
        myTestArray[taskNummer]["answer2"] = row.answer2
        myTestArray[taskNummer]["answer3"] = row.answer3
        myTestArray[taskNummer]["answer4"] = row.answer4
      end
      myTestArray[taskNummer]["correct"] = row.correct
      print(myTestArray[taskNummer]["task"])

    end

    -- Setup the event listener to catch "applicationExit"
    Runtime:addEventListener( "system", onSystemEvent )
  ------\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

  local theTask = display.newImage( sceneGroup, "pics/tests/"..testName.."/1/"..myTestArray[taskNummer]["task"]..".png", display.contentCenterX, 400)
  --local theTask = display.newImage( sceneGroup, "pics/"..testName.."/1/"..myTestArray[taskNummer]["task"]..".png", 400, 400)
  theTask:scale(0.5, 0.5)
  theTask:setFillColor( unpack(primaryColor) )


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
