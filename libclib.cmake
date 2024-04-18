find_library(LIBCLIB "pluginc" PATHS ${CMAKE_CURRENT_LIST_DIR}/lib/)
find_library(LIBGLIB "g" PATHS ${CMAKE_CURRENT_LIST_DIR}/lib/)
find_library(LIBMLIB "m" PATHS ${CMAKE_CURRENT_LIST_DIR}/lib/)
message("Looking for libc: ${LIBCLIB}")
message("Looking for libg: ${LIBGLIB}")
message("Looking for libm: ${LIBMLIB}")

target_link_libraries(metamodule-plugin-libc PUBLIC
   ${LIBCLIB}
   ${LIBGLIB}
   ${LIBMLIB}
)

target_sources(metamodule-plugin-libc PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/dso_handle.c
)

