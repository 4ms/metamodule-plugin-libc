set(libc ${CMAKE_CURRENT_LIST_DIR}/newlib/libc)

set(LIBC_ERRNO_SOURCES
	${libc}/errno/errno.c
    ${CMAKE_CURRENT_LIST_DIR}/dso_handle.c
)

target_sources(metamodule-plugin-libc PRIVATE
	${LIBC_ERRNO_SOURCES}
)
