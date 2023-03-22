project "ImGui"
	kind "StaticLib"
	language "C++"
    staticruntime "off"
	cppdialect "C++17"

	targetdir ( "%{wks.location}/build/" .. outputdir .. "/%{prj.name}")
    objdir ( "%{wks.location}/build-int/" .. outputdir .. "/%{prj.name}")

	includedirs {
        ".",
        "../glfw/include",
        "../glad"
    }

	files
	{
		"*.h",
        "*.cpp",
		"backends/imgui_impl_glfw.h",
		"backends/imgui_impl_glfw.cpp",
		"backends/imgui_impl_opengl3.h",
		"backends/imgui_impl_opengl3.cpp",
        "misc/cpp/imgui_stdlib.h",
        "misc/cpp/imgui_stdlib.cpp"
	}

	filter "system:windows"
		systemversion "latest"

	filter "system:linux"
		pic "On"
		systemversion "latest"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"

    filter "configurations:Dist"
		runtime "Release"
		optimize "on"
        symbols "off"