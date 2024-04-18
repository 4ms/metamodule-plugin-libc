set(libstdcpp ${CMAKE_CURRENT_LIST_DIR}/libstdc++-v3/src)

set(LIBSTDCPP_C98_SOURCES
	${libstdcpp}/c++98/bitmap_allocator.cc
	${libstdcpp}/c++98/pool_allocator.cc
	${libstdcpp}/c++98/mt_allocator.cc
	${libstdcpp}/c++98/codecvt.cc
	${libstdcpp}/c++98/complex_io.cc
	${libstdcpp}/c++98/globals_io.cc
	${libstdcpp}/c++98/hash_tr1.cc
	${libstdcpp}/c++98/hashtable_tr1.cc
	${libstdcpp}/c++98/ios_failure.cc
	${libstdcpp}/c++98/ios_init.cc
	${libstdcpp}/c++98/ios_locale.cc
	${libstdcpp}/c++98/list.cc
	${libstdcpp}/c++98/list-aux.cc
	${libstdcpp}/c++98/list-aux-2.cc
	${libstdcpp}/c++98/list_associated.cc
	${libstdcpp}/c++98/list_associated-2.cc
	${libstdcpp}/c++98/locale.cc
	${libstdcpp}/c++98/locale_init.cc
	${libstdcpp}/c++98/locale_facets.cc
	${libstdcpp}/c++98/localename.cc
	${libstdcpp}/c++98/math_stubs_float.cc
	${libstdcpp}/c++98/math_stubs_long_double.cc
	${libstdcpp}/c++98/stdexcept.cc
	${libstdcpp}/c++98/strstream.cc
	${libstdcpp}/c++98/tree.cc
	${libstdcpp}/c++98/istream.cc
	${libstdcpp}/c++98/istream-string.cc
	${libstdcpp}/c++98/streambuf.cc
	${libstdcpp}/c++98/valarray.cc
)

set(LIBSTDCPP_C11_SOURCES
	${libstdcpp}/c++11/bitmap_allocator.cc
	${libstdcpp}/c++11/pool_allocator.cc
	${libstdcpp}/c++11/mt_allocator.cc
	${libstdcpp}/c++11/codecvt.cc
	${libstdcpp}/c++11/complex_io.cc
	${libstdcpp}/c++11/globals_io.cc
	${libstdcpp}/c++11/hash_tr1.cc
	${libstdcpp}/c++11/hashtable_tr1.cc
	${libstdcpp}/c++11/ios_failure.cc
	${libstdcpp}/c++11/ios_init.cc
	${libstdcpp}/c++11/ios_locale.cc
	${libstdcpp}/c++11/list.cc
	${libstdcpp}/c++11/list-aux.cc
	${libstdcpp}/c++11/list-aux-2.cc
	${libstdcpp}/c++11/list_associated.cc
	${libstdcpp}/c++11/list_associated-2.cc
	${libstdcpp}/c++11/locale.cc
	${libstdcpp}/c++11/locale_init.cc
	${libstdcpp}/c++11/locale_facets.cc
	${libstdcpp}/c++11/localename.cc
	${libstdcpp}/c++11/math_stubs_float.cc
	${libstdcpp}/c++11/math_stubs_long_double.cc
	${libstdcpp}/c++11/stdexcept.cc
	${libstdcpp}/c++11/strstream.cc
	${libstdcpp}/c++11/tree.cc
	${libstdcpp}/c++11/istream.cc
	${libstdcpp}/c++11/istream-string.cc
	${libstdcpp}/c++11/streambuf.cc
	${libstdcpp}/c++11/valarray.cc
)

set(LIBSTDCPP_C17_SOURCES
	${libstdcpp}/c++17/floating_from_chars.cc
	${libstdcpp}/c++17/floating_to_chars.cc
	# ${libstdcpp}/c++17/fs_dir.cc
	# ${libstdcpp}/c++17/fs_ops.cc
	# ${libstdcpp}/c++17/fs_path.cc
	${libstdcpp}/c++17/memory_resource.cc
	${libstdcpp}/c++17/ostream-inst.cc
	${libstdcpp}/c++17/string-inst.cc
)

set(LIBSTDCPP_C20_SOURCES
	${libstdcpp}/c++20/sstream-inst.cc
)

set(LIBSTDCPP_FILESYSTEM_SOURCES
	# ${libstdcpp}/filesystem/dir.cc
	# ${libstdcpp}/filesystem/ops.cc
	# ${libstdcpp}/filesystem/path.cc
)

set(LIBSTDCPP_SHARED_SOURCES
	${libstdcpp}/shared/hashtable-aux.cc
)

target_sources(metamodule-plugin-libc PRIVATE
    ${LIBCPP_C98_SOURCES}
    ${LIBCPP_C11_SOURCES}
    ${LIBCPP_C17_SOURCES}
    ${LIBCPP_C20_SOURCES}
    ${LIBSTDCPP_FILESYSTEM_SOURCES}
    ${LIBSTDCPP_SHARED_SOURCES}
)
