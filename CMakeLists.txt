add_library(metamodule-plugin-libc STATIC)
add_library(metamodule::plugin-libc ALIAS metamodule-plugin-libc)

include(libm.cmake)
include(libc.cmake)
# include(libclib.cmake)
include(libgcc.cmake)
include(libstdcpp.cmake)


target_compile_options(metamodule-plugin-libc PRIVATE
	-fbuiltin
	-fno-math-errno

    # Do not export plugin-libc symbols (removes unused symbols and does not make GOT/PLT tables for them):
    -fvisibility=hidden 
)

