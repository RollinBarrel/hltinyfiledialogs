cmake_minimum_required(VERSION 3.10)

project(tinyfiledialogs)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_library(tinyfiledialogs.hdll SHARED filedialog.cpp libs/tinyfiledialogs/tinyfiledialogs.c)
target_include_directories(tinyfiledialogs.hdll PUBLIC libs/tinyfiledialogs)
set_target_properties(tinyfiledialogs.hdll PROPERTIES PREFIX "" OUTPUT_NAME tinyfiledialogs SUFFIX .hdll)

IF(WIN32)
target_include_directories(tinyfiledialogs.hdll PUBLIC $ENV{HASHLINKPATH}/include)
target_link_libraries(tinyfiledialogs.hdll $ENV{HASHLINKPATH}/libhl.lib)
ELSEIF(APPLE)
find_library(APPLICATION_SERVICES_FRAMEWORK ApplicationServices REQUIRED)
target_include_directories(tinyfiledialogs.hdll PUBLIC $ENV{HASHLINKPATH}/src)
target_link_libraries(tinyfiledialogs.hdll $ENV{HASHLINKPATH}/libhl.dylib ${APPLICATION_SERVICES_FRAMEWORK})
ELSEIF()
target_include_directories(tinyfiledialogs.hdll PUBLIC $ENV{HASHLINKPATH}/src)
target_link_libraries(tinyfiledialogs.hdll $ENV{HASHLINKPATH}/libhl.so)
ENDIF()

install(TARGETS tinyfiledialogs.hdll DESTINATION lib)