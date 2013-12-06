
require( "scripts/cover")
function debug_trace( ... )

	print( "--------------------------------------------------------")

	print( string.format(...))

	print( debug.traceback())

	print( "--------------------------------------------------------")
end

-- log 
cclog = function( ... )

	print( string.format(...))
end

function main()

	collectgarbage("setpause", 100)
    collectgarbage("setstepmul", 5000)

	CCLuaLog( "Enter Controller")

	CCDirector:sharedDirector():runWithScene( creatcoverscene() )


end

xpcall( main , debug_trace )