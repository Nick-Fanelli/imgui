cmake_minimum_required(VERSION 3.10)

project(ImGUI)

file(GLOB_RECURSE SRC_FILES
	# Standard ImGui Implememtation
	"imconfig.h"
	"imgui_demo.cpp"
	"imgui_draw.cpp"
	"imgui_internal.h"
	"imgui_tables.cpp"
	"imgui_widgets.cpp"
	"imgui.cpp"
	"imgui.h"
	"imstb_rectpack.h"
	"imstb_textedit.h"
	"imstb_truetype.h"

	# Specific Backends
	"backends/imgui_impl_opengl3.h"
	"backends/imgui_impl_opengl3.cpp"
	"backends/imgui_impl_glfw.h"
	"backends/imgui_impl_glfw.cpp"
)

add_library(ImGUI ${SRC_FILES} ${BACKENDS})

target_include_directories(ImGUI PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
target_include_directories(ImGUI PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/backends)