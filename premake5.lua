-- Accidental Noise Library
-- premake4.lua

local usethread=true 

solution "ANL"
	configurations {"Debug", "Release", "ReleaseWithSymbols"}
	platforms {"Native", "x32", "x64", "Universal"}
	location "build"
	
	if usethread then defines { "USETHREAD" } end
	
	configuration "Debug"
		defines { "DEBUG" }
		flags { "Symbols" }

	configuration "Release"
		defines { "NDEBUG" }
		flags { "Optimize" }
		
  configuration "Release"
		defines { "NDEBUG" }
		flags { "Optimize", "Symbols" }
		
	configuration {}
	
	project "ANLLib"
		kind "StaticLib"
		location "build/ANL"
		targetdir "build/ANL"
		language "C++"
		if _ACTION=="gmake" then
			buildoptions "-std=c++11"
		end
		
		files {"VM/*.h", "VM/*.cpp", "Imaging/*.h", "Imaging/*.cpp", "Imaging/*.c", "Expression/*.h", "Expression/*.cpp", "templates/*.h", "vectortypes.h"}