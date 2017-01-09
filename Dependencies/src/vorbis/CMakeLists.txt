project(vorbis)

set(vorbis_SOURCES
        include/vorbis/codec.h
 	include/vorbis/vorbisenc.h
	include/vorbis/vorbisfile.h
	src/analysis.c
        src/backends.h
        src/barkmel.c
	src/bitrate.c
	src/bitrate.h
	src/block.c
	src/codebook.c
	src/codebook.h
	src/codec_internal.h
	src/envelope.c
	src/envelope.h
	src/floor0.c
	src/floor1.c
	src/highlevel.h
	src/info.c
	src/lookup_data.h
	src/lookup.c
	src/lookup.h
	src/lpc.c
	src/lpc.h
	src/lsp.c
	src/lsp.h
	src/mapping0.c
	src/masking.h
	src/mdct.c
	src/mdct.h
        src/misc.h
	src/misc.c
	src/os.h
	src/psy.c
	src/psy.h
	src/registry.c
	src/registry.h
	src/res0.c
	src/scales.h
	src/sharedbook.c
	src/smallft.c
	src/smallft.h
	src/synthesis.c
	src/tone.c
	src/vorbisenc.c
	src/vorbisfile.c
	src/window.c
	src/window.h
	src/modes/floor_all.h
	src/modes/psych_8.h
	src/modes/psych_11.h
	src/modes/psych_16.h
	src/modes/psych_44.h
	src/modes/residue_8.h
	src/modes/residue_16.h
	src/modes/residue_44.h
	src/modes/residue_44p51.h
	src/modes/residue_44u.h
	src/modes/setup_8.h
	src/modes/setup_11.h
	src/modes/setup_16.h
	src/modes/setup_22.h
	src/modes/setup_32.h
	src/modes/setup_44.h
	src/modes/setup_44p51.h
	src/modes/setup_44u.h
	src/modes/setup_X.h
	src/books/coupled/res_books_stereo.h
	src/books/floor/floor_books.h
	src/books/uncoupled/res_books_uncoupled.h
 )

include_directories(include)
include_directories(src)
add_library(vorbis STATIC ${vorbis_SOURCES})
include_directories(${OGG_INCLUDE_DIR})
target_link_libraries(vorbis ogg)

install_dep(vorbis include)

if (OGREDEPS_INSTALL_DEV)
  install(DIRECTORY include/ DESTINATION include)
endif ()

if (APPLE)
 set_target_properties(vorbis PROPERTIES XCODE_ATTRIBUTE_ONLY_ACTIVE_ARCH "NO")

 if(OGRE_BUILD_PLATFORM_APPLE_IOS)
  add_definitions(-DHAVE_QUICKDRAW_CARBON=0 -DHAVE_QUICKDRAW_TOOLBOX=0 -DHAVE_ATS=0 -DHAVE_FSREF=0 -DHAVE_FSSPEC=0 -DDARWIN_NO_CARBON=1 -DFT_CONFIG_OPTION_NO_ASSEMBLER=1)

  set_target_properties(vorbis PROPERTIES XCODE_ATTRIBUTE_GCC_THUMB_SUPPORT "NO")
 endif()
endif()

set(VORBIS_INCLUDE_DIR "${vorbis_SOURCE_DIR}/include" CACHE PATH "" FORCE)
set(VORBIS_LIBRARY_DBG "vorbis" CACHE STRING "" FORCE)
set(VORBIS_LIBRARY_REL "vorbis" CACHE STRING "" FORCE)
mark_as_advanced(VORBIS_INCLUDE_DIR VORBIS_LIBRARY_DBG VORBIS_LIBRARY_REL)
