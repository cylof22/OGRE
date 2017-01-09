PROJECT(OggSoundManager)

CMAKE_MINIMUM_REQUIRED(VERSION 2.6)

INCLUDE (CheckIncludeFileCXX)

file(GLOB HEADER_FILES "${CMAKE_CURRENT_SOURCE_DIR}/include/*.h")
file(GLOB SOURCE_FILES "${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp")

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/include)
include_directories(${OGG_INCLUDE_DIR})
include_directories(${VORBIS_INCLUDE_DIR})
include_directories(${OPENAL_INCLUDE_DIR})
add_definitions(-D_USRDLL)

ogre_add_library(Plugin_OggSoundManager ${OGRE_LIB_TYPE} ${HEADER_FILES} ${SOURCE_FILES})
target_link_libraries(Plugin_OggSoundManager OgreMain ogg vorbis openal)

# Option.
SET(OGGSOUND_THREADED YES CACHE BOOL "Enable multi-threaded streamed sounds")
SET(USE_POCO YES CACHE BOOL "Use POCO Threads?")
if (NOT OGRE_STATIC)
  set_target_properties(Plugin_OggSoundManager PROPERTIES
    COMPILE_DEFINITIONS OGRE_OGGSOUNDPLUGIN_EXPORTS
  ) 
endif ()

ogre_config_framework(Plugin_OggSoundManager)

ogre_config_plugin(Plugin_OggSoundManager)
install(FILES ${HEADER_FILES} DESTINATION include/OGRE/Plugins/OggSoundManager)