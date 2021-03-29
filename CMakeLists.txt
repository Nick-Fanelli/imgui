cmake_minimum_required(VERSION 3.10)

project(ImGUI)

set(GCC_COVERAGE_COMPILE_FLAGS "-std=c++17 -Wall -I/usr/local/include -I/opt/X11/include -I/opt/X11/lib -I${CMAKE_CURRENT_SOURCE_DIR}/include")
set(GCC_COVERAGE_LINK_FLAGS    "-lglfw -lGLEW -framework Cocoa -framework OpenGL -framework IOKit -framework CoreVideo -L/usr/local/lib")

set(CMAKE_CXX_FLAGS  "${CMAKE_CXX_FLAGS} ${GCC_COVERAGE_COMPILE_FLAGS}")
set(CMAKE_EXE_LINKER_FLAGS  "${CMAKE_EXE_LINKER_FLAGS} ${GCC_COVERAGE_LINK_FLAGS}")

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
)

file(GLOB_RECURSE BACKENDS
	# Specific Backends
	"backends/imgui_impl_opengl3.h"
	"backends/imgui_impl_opengl3.cpp"
	"backends/imgui_impl_glfw.h"
	"backends/imgui_impl_glfw.cpp"
)

add_library(ImGUI ${SRC_FILES} ${BACKENDS})

target_include_directories(ImGUI PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
target_include_directories(ImGUI PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/backends)