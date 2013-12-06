
require "scripts/utils"
require "scripts/game"

local function onTouchBegan( x,y )
	-- body
	log( "touch began")


	return true	
end

local function onTouchMoved( x,y )

	log( "touch moved")
end

local function onTouchEnded( x,y )

	log( "touch ended")

end

local function onTouch( even_type , x, y )
	-- body
	if even_type == "began" then 

		return onTouchBegan( x, y)

	elseif even_type == "moved" then

		return onTouchMoved( x, y)
		
	else 

		return onTouchEnded( x , y)

	end

end

local function togamebutton()

	cclog( "to game button")

	local scene = create_game_scene();

	CCDirector:sharedDirector():replaceScene( CCTransitionFade:create(0.5, scene ))

	-- CCDirector:sharedDirector():purgeCachedData();


end

local function aboutbutton()
	cclog( "to about button")
end


local function create_title()

	local title = CCSprite:create( "res/logo.png")
	title:setPosition(wsize.width / 2, wsize.height * 0.8 ) 

	return title
end

local function create_menu()

	local menulayer =  CCLayer:create()

	CCTextureCache:sharedTextureCache():addImage("res/menu.png")

	local frame1 = CCSpriteFrame:create("res/menu.png", CCRectMake(  0,0 , 126 , 33 ))
	local frame2 = CCSpriteFrame:create("res/menu.png", CCRectMake(  0,33 , 126 , 33 ))

	local startNormal = CCSprite:createWithSpriteFrame( frame1 )
	local startSelected = CCSprite:createWithSpriteFrame( frame2 )


	local startgamelabel = CCMenuItemSprite:create( startNormal, startSelected ) 
	-- startgamelabel:setPosition( wsize.width / 2 ,wsize.height / 2 )
	startgamelabel:registerScriptTapHandler( togamebutton )

	local textlabel = CCMenuItemFont:create("ok")
	-- local menu = CCMenu:createWithItem( startgamelabel )
	local menuArray = CCArray:create()
	menuArray:addObject( startgamelabel )
	menuArray:addObject( textlabel )
	local menu = CCMenu:createWithArray( menuArray )
	menu:alignItemsVerticallyWithPadding( 10)
	-- menu:setPosition(0,0)

	menulayer:addChild( menu )


 return menulayer




end

local function createBgLayer()
	-- body
	local layer = CCLayer:create()
	local sp_sprite = CCSprite:create( "res/loading.png")
	layer:addChild( sp_sprite)
	sp_sprite:setPosition(wsize.width / 2 ,wsize.height / 2 )
	sp_sprite:setAnchorPoint( CCPointMake( 0.5,0.5))


	layer:addChild( create_title() , 1)
	
	layer:addChild( create_menu() , 2)

	layer:registerScriptTouchHandler( onTouch )

	layer:setTouchEnabled( true  )

	return layer
end


function creatcoverscene( )

	local sc = CCScene:create()

	sc:addChild(createBgLayer() )

	return sc
end