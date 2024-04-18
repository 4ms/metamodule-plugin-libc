add_library(metamodule-plugin-libc STATIC)
add_library(metamodule::plugin-libc ALIAS metamodule-plugin-libc)

target_sources(metamodule-plugin-libc PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/dso_handle.c
)

target_compile_options(metamodule-plugin-libc PRIVATE
	-fbuiltin
	-fno-math-errno

    # Do not export plugin-libc symbols (removes unused symbols and does not make GOT/PLT tables for them):
    -fvisibility=hidden 
)

