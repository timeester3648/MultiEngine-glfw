include "../../premake/common_premake_defines.lua"

project "glfw"
	kind "StaticLib"
	language "C++"
	cppdialect "C++latest"
	cdialect "C17"
	targetname "%{prj.name}"
	inlining "Auto"

	files {
		"./include/**.h",
		"./src/**.c",
		"./src/**.m"
	}

	includedirs {
		"%{prj.name}/include",

		"%{IncludeDir.glfw}",
		"%{IncludeDir.spdlog}",
		"%{IncludeDir.vulkan_headers}",
		"%{IncludeDir.general_includes}"
	}

 	filter "system:windows"
		defines { "_GLFW_WIN32", "_CRT_SECURE_NO_WARNINGS" }
		excludes {
			"./src/wl_init.c",
			"./src/x11_init.c",
			"./src/wl_window.c",
			"./src/posix_poll.c",
			"./src/x11_window.c",
			"./src/wl_monitor.c",
			"./src/cocoa_time.c",
			"./src/posix_time.c",
			"./src/xkb_unicode.c",
			"./src/x11_monitor.c",
			"./src/glx_context.c",
			"./src/posix_module.c",
			"./src/posix_thread.c",
			"./src/linux_joystick.c",

			"./**.m"
		}

 	filter "configurations:Debug"
		defines { "MLE_DEBUG_BUILD", "DEBUG" }
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		defines { "MLE_RELEASE_BUILD", "NDEBUG" }
		flags { "LinkTimeOptimization" }
		runtime "Release"
		optimize "speed"
		intrinsics "on"

	filter "configurations:Distribution"
		defines {  "MLE_DISTRIBUTION_BUILD", "NDEBUG" }
		flags { "LinkTimeOptimization" }
		runtime "Release"
		optimize "speed"
		intrinsics "on"