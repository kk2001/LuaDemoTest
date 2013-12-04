require "testscene"
--  debug trace 
function debug_track( msg )
	-- body

	print( "--------------------------------")
	print("Lua ERROR ".. tostring( msg ) .. "\n")
	print( debug.traceback())
	print( "--------------------------------")

end

local cclog = function( ... )
	-- body
	print( string.format( ...))
end
local winsize = CCDirector:sharedDirector():getWinSize() 

local function create_layer()

	cclog( winsize.width )
	cclog( winsize.height )

	local bglayer = CCLayer:create()
	local bg = CCSprite:create( "HelloWorld.png")
	bglayer:addChild( bg ,1)
	bg:setPosition( winsize.width / 2 , winsize.height / 2 )


	return bglayer;

end

local function menucallback()

	CCLuaLog( "clicked!!!")

	local scene = testscene_create()

	CCDirector:sharedDirector():replaceScene( CCTransitionFade:create( 0.5,scene) )


end

local function create_menu()

	local button = CCMenuItemImage:create( "CloseNormal.png", "CloseSelected.png")

	if button == nil then
		
		print ( "button is nil")
	end

	--button:setPosition( winsize.width / 2 , winsize.height / 2)
	button:registerScriptTapHandler( menucallback )
	local menu = CCMenu:createWithItem( button )
	--menu:setPosition( winsize.width / 2, winsize.height / 2 )

	return menu
end


local function main()

	collectgarbage("setpause", 100)
	collectgarbage("setstepmul", 5000)

	local bglayer = create_layer()
	local menu = create_menu()
	bglayer:addChild( menu , 9 )

	local gameScene = CCScene:create()
	gameScene:addChild( bglayer )

    CCDirector:sharedDirector():runWithScene( gameScene )

end


xpcall( main, debug_track )