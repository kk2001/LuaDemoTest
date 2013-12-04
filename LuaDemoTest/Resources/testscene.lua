
local function debug_trace( ... )

	print( "----------------------")

	print( string.format(...))

	print( debug.traceback())

	print( "----------------------")
end

local  time = 1

local function tick( )
	-- body
	print( "time is " .. time )
	time = time + 1 

end

--[[
		1. 触摸事件 第一步  编写三个函数  onTouchBegan( x ,y  )  onTouchMoved( x,y ) onTouchEnded( x , y)
		2. 编写onTouch函数  onTouch( eventtype , x , y )
			根据eventtype的字符串名字 然后 返回函数就可以了
		3.注册事件 registerScriptTouchHanlder( onTouch )
		4.layer:setTouchEnable( true )
]]


local function onTouchBegan( x ,y )

	CCLuaLog( "onTouchBegan")
	CCLuaLog( "x : is " .. x .."  y : is " .. y )

	return true
end


local function onTouchMoved( x, y )

	CCLuaLog( "Moved ====> x : is " .. x .."  y : is " .. y )



end

local function onTouchEnded(x,y)
	CCLuaLog( "Ended")

	CCLuaLog( "x : is " .. x .."  y : is " .. y )
	
end

local function onTouch( event_type, x, y )

	if event_type == "began"  then  

		return onTouchBegan( x, y  )

	elseif  event_type == "moved" then  

		return onTouchMoved( x, y  )

	else 

		return onTouchEnded( x, y  )
	end

end

local function createlayer()

	CCLuaLog( "创建testscene的背景layer")
	local layer = CCLayer:create()

	local bgsprite = CCSprite:create( "crop.png")
	bgsprite:setPosition( 100,200)
	layer:addChild( bgsprite, 1 )
	layer:registerScriptTouchHandler( onTouch  )
	layer:setTouchEnabled( true  )

	CCDirector:sharedDirector():getScheduler():scheduleScriptFunc( tick , 1, false )

	return layer

end



 function testscene_create()

 	local  scene = CCScene:create()

 	scene:addChild( createlayer() )

 	return scene

end