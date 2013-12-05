require("scripts/utils")


local bg01;
local bg02

function create_bg_layer()

	local bglayer = CCLayer:create();

	local bgsprite = CCSprite:create( "res/bg01.jpg" )

	bgsprite:setPosition(wsize.width / 2,wsize.height / 2 )
	bgsprite:setAnchorPoint( CCPointMake(0,0))

	bglayer:addChild( bgsprite )


	return bglayer;

end


function create_game_scene()

	SimpleAudioEngine:sharedEngine():playBackgroundMusic("background.mp3", true  )

	local scene = CCScene:create();
	scene:addChild( create_bg_layer() )

	return scene 
end