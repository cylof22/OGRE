#-------------------------------------------------------------------
# This file is part of the CMake build system for OGRE
#     (Object-oriented Graphics Rendering Engine)
# For the latest info, see http://www.ogre3d.org/
#
# The contents of this file are placed in the public domain. Feel
# free to make use of it in any way you like.
#-------------------------------------------------------------------

# Configure VolumeTerrain demo build

set (HEADER_FILES
	include/VolumeTerrain.h
)
set (SOURCE_FILES
	src/VolumeTerrain.cpp
)

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/include)
ogre_add_component_include_dir(Volume)

add_library(Sample_VolumeTerrain ${OGRE_LIB_TYPE} ${SOURCE_FILES} ${HEADER_FILES})

target_link_libraries(Sample_VolumeTerrain ${OGRE_LIBRARIES} ${OIS_LIBRARIES} ${OGRE_Volume_LIBRARIES})
ogre_config_sample_lib(Sample_VolumeTerrain)

if (APPLE AND NOT OGRE_BUILD_PLATFORM_APPLE_IOS)
    # Set the INSTALL_PATH so that Samples can be installed in the application package
    set_target_properties(Sample_VolumeTerrain
       PROPERTIES BUILD_WITH_INSTALL_RPATH 1
       INSTALL_NAME_DIR "@executable_path/../Plugins"
    )
endif()

