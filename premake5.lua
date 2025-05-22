include "../../Premake/common.lua"

project "bimg"
	location "."
	kind "StaticLib"
	language "C++"
	cppdialect "C++20"
	exceptionhandling "Off"
	rtti "Off"

	targetdir (dirs.build .. outputdir .. "/%{prj.name}")
    objdir (dirs.bin .. outputdir .. "/%{prj.name}")

	conformancemode "Yes"

	files {
		"include/bimg/*.h",
		"src/image.cpp",
		"src/image_gnf.cpp",
		"src/*.h",
		"3rdparty/astc-encoder/include/**.h",
		"3rdparty/astc-encoder/source/**.h",
		"3rdparty/astc-encoder/source/**.cpp",
	}

	includedirs {
		"include",
		"3rdparty/astc-encoder",
		"3rdparty/astc-encoder/include",
        dirs.external .. "bx/include",
	}

	filter "configurations:Debug"
		defines "BX_CONFIG_DEBUG=1"

	filter "configurations:Release"
		defines "BX_CONFIG_DEBUG=0"

    filter "configurations:Retail"
		defines "BX_CONFIG_DEBUG=0"

    filter "action:vs*"
		buildoptions {
			"/Zc:__cplusplus",
			"/Zc:preprocessor"
		}
        includedirs { dirs.external .. "bx/include/compat/msvc" }
