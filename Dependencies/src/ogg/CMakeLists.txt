project(ogg)

set(ogg_SOURCES
    include/ogg/ogg.h
    include/ogg/os_types.h
    src/bitwise.c
    src/framing.c
  )

include_directories(include)
add_library(ogg STATIC ${ogg_SOURCES})
install_dep(ogg include)
if (OGREDEPS_INSTALL_DEV)
  install(DIRECTORY include/ DESTINATION include)
endif ()

if (APPLE)
 set_target_properties(ogg PROPERTIES XCODE_ATTRIBUTE_ONLY_ACTIVE_ARCH "NO")

 if(OGRE_BUILD_PLATFORM_APPLE_IOS)
  add_definitions(-DHAVE_QUICKDRAW_CARBON=0 -DHAVE_QUICKDRAW_TOOLBOX=0 -DHAVE_ATS=0 -DHAVE_FSREF=0 -DHAVE_FSSPEC=0 -DDARWIN_NO_CARBON=1 -DFT_CONFIG_OPTION_NO_ASSEMBLER=1)

  set_target_properties(ogg PROPERTIES XCODE_ATTRIBUTE_GCC_THUMB_SUPPORT "NO")
 endif()
endif()

set(OGG_INCLUDE_DIR "${ogg_SOURCE_DIR}/include" CACHE PATH "" FORCE)
set(OGG_LIBRARY_DBG "ogg" CACHE STRING "" FORCE)
set(OGG_LIBRARY_REL "ogg" CACHE STRING "" FORCE)
mark_as_advanced(OGG_INCLUDE_DIR OGG_LIBRARY_DBG OGG_LIBRARY_REL)
