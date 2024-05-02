set(libstdcpp ${CMAKE_CURRENT_LIST_DIR}/libstdc++-v3/src)
set(libstdcpproot ${CMAKE_CURRENT_LIST_DIR}/libstdc++-v3)

set(common_opts 
    -fbuiltin 
    -fno-math-errno 
    -fvisibility=hidden
    # -fimplicit-templates
    # -no-incstd
)

#TODO: split this up into files for each c++ version:

##
## c++98
##

#used when ENABLE_DUAL_API
# except.. these are the same as the HOST_SOURCES?
# set(LIBSTDCPP_C98_COW_STRING_HOST_SOURCES
# 	${libstdcpp}/collate_members_cow.cc
# 	${libstdcpp}/messages_members_cow.cc
# 	${libstdcpp}/monetary_members_cow.cc
# 	${libstdcpp}/numeric_members_cow.cc
# )

set(LIBSTDCPP_C98_HOST_SOURCES
    # Using these does not compile because things like __POSITIVE_SIGN are not defined anywhere:
	# ${libstdcpp}/../config/locale/gnu/codecvt_members.cc
	# ${libstdcpp}/../config/locale/gnu/collate_members.cc
	# ${libstdcpp}/../config/locale/gnu/messages_members.cc
	# ${libstdcpp}/../config/locale/gnu/monetary_members.cc
	# ${libstdcpp}/../config/locale/gnu/numeric_members.cc
	# ${libstdcpp}/../config/locale/gnu/time_members.cc
	${libstdcpp}/../config/locale/generic/codecvt_members.cc
	${libstdcpp}/../config/locale/generic/collate_members.cc
	${libstdcpp}/../config/locale/generic/messages_members.cc
	${libstdcpp}/../config/locale/generic/monetary_members.cc
	${libstdcpp}/../config/locale/generic/numeric_members.cc
	${libstdcpp}/../config/locale/generic/time_members.cc
)

set(LIBSTDCPP_C98_HOST_SOURCES_EXTRA
	# ${libstdcpp}/../config/locale/generic/c_locale.cc
	${libstdcpp}/../config/locale/gnu/c_locale.cc
	${libstdcpp}/../config/io/basic_file_stdio.cc
	#inst_sources:
	${libstdcpp}/c++98/allocator-inst.cc
	${libstdcpp}/c++98/concept-inst.cc
	${libstdcpp}/c++98/ext-inst.cc
	${libstdcpp}/c++98/misc-inst.cc
	#parallel_sources:
	${libstdcpp}/c++98/parallel_settings.cc
)

set(LIBSTDCPP_C98_CXX11_ABI_SOURCES
	${libstdcpp}/c++98/cow-istream-string.cc
)

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

	${libstdcpp}/c++98/compatibility.cc

	${LIBSTDCPP_C98_CXX11_ABI_SOURCES}
	${LIBSTDCPP_C98_HOST_SOURCES}
	${LIBSTDCPP_C98_HOST_SOURCES_EXTRA}
)

add_library(libstdcpp98 STATIC ${LIBSTDCPP_C98_SOURCES})

target_include_directories(libstdcpp98 PRIVATE 
	${libstdcpproot}/config/locale/gnu
	# ${libstdcpproot}/include/c
	# ${libstdcpproot}/include/c_global
	# ${libstdcpproot}/include/c_std
	# ${libstdcpproot}/include/c_compatibility
	${CMAKE_CURRENT_LIST_DIR}/include
)
target_compile_options(libstdcpp98 PRIVATE -std=gnu++98)
target_compile_options(libstdcpp98 PRIVATE ${common_opts})

set_source_files_properties(
    ${libstdcpp}/c++98/locale_init.cc 
    ${libstdcpp}/c++98/localename.cc 
    PROPERTIES COMPILE_OPTIONS "-fchar8_t;-std=gnu++11"
)

set_source_files_properties(
    ${libstdcpp}/c++98/concept-inst.cc 
    PROPERTIES COMPILE_OPTIONS "-fimplicit-templates"
)

set_source_files_properties(
    ${libstdcpp}/c++98/strstream.cc 
    ${libstdcpp}/c++98/bitmap_allocator.cc 
	PROPERTIES COMPILE_OPTIONS "-Wno-deprecated;-I${libstdcpproot}/include/backward"
)

set_source_files_properties(
    ${libstdcpp}/c++98/parallel_settings.cc 
	PROPERTIES COMPILE_OPTIONS "-D_GLIBCXX_PARALLEL"
)

##
## c++11 
##

# See libstdc++v3/src/c++11/Makefile.am:

set(LIBSTDCPP_C11_HOST_SOURCES
	#newlib:
	${libstdcpp}/../config/os/newlib/ctype_configure_char.cc 
	${libstdcpp}/../config/locale/newlib/ctype_members.cc
	#generic
	# ${libstdcpproot}/config/os/generic/ctype_configure_char.cc 
	# ${libstdcpproot}/config/locale/generic/ctype_members.cc

)

#used when ENABLE_DUAL_API
set(LIBSTDCPP_C11_CXX11_ABI_SOURCES
	#cxx11_abi_sources:
	${libstdcpp}/c++11/cow-locale_init.cc
	${libstdcpp}/c++11/cow-shim_facets.cc
	${libstdcpp}/c++11/cxx11-hash_tr1.cc
	${libstdcpp}/c++11/cxx11-ios_failure.cc
	${libstdcpp}/c++11/cxx11-shim_facets.cc
	${libstdcpp}/c++11/cxx11-stdexcept.cc
)

#used when ENABLE_DUAL_API
set(LIBSTDCPP_C11_EXTRA_STRING_INST_SOURCES
	# extra_string_inst_sources:
	${libstdcpp}/c++11/cow-fstream-inst.cc
	${libstdcpp}/c++11/cow-sstream-inst.cc
	${libstdcpp}/c++11/cow-string-inst.cc
	${libstdcpp}/c++11/cow-string-io-inst.cc
	${libstdcpp}/c++11/cow-wstring-inst.cc
	${libstdcpp}/c++11/cow-wstring-io-inst.cc
	${libstdcpp}/c++11/cxx11-locale-inst.cc
	${libstdcpp}/c++11/cxx11-wlocale-inst.cc
	${libstdcpp}/c++11/sso_string.cc
)

set(LIBSTDCPP_C11_SOURCES
	# ${libstdcpp}/c++98/locale_init.cc 
	# ${libstdcpp}/c++98/localename.cc

	${libstdcpp}/c++11/chrono.cc
	${libstdcpp}/c++11/codecvt.cc
	${libstdcpp}/c++11/condition_variable.cc
	${libstdcpp}/c++11/cow-stdexcept.cc
	${libstdcpp}/c++11/ctype.cc
	${libstdcpp}/c++11/debug.cc
	${libstdcpp}/c++11/functexcept.cc
	${libstdcpp}/c++11/functional.cc
	${libstdcpp}/c++11/futex.cc
	${libstdcpp}/c++11/future.cc
	${libstdcpp}/c++11/hash_c++0x.cc
	${libstdcpp}/c++11/hashtable_c++0x.cc
	${libstdcpp}/c++11/ios.cc
	${libstdcpp}/c++11/limits.cc
	${libstdcpp}/c++11/mutex.cc
	${libstdcpp}/c++11/placeholders.cc
	${libstdcpp}/c++11/random.cc
	${libstdcpp}/c++11/regex.cc 
	${libstdcpp}/c++11/shared_ptr.cc
	${libstdcpp}/c++11/snprintf_lite.cc
	${libstdcpp}/c++11/system_error.cc
	# ${libstdcpp}/c++11/thread.cc

	${LIBSTDCPP_C11_CXX11_ABI_SOURCES}
	${LIBSTDCPP_C11_HOST_SOURCES}

	#these are enabled if ENABLE_EXTERN_TEMPLATE
	${LIBSTDCPP_C11_EXTRA_STRING_INST_SOURCES}
	${libstdcpp}/c++11/ext11-inst.cc
	${libstdcpp}/c++11/fstream-inst.cc
	${libstdcpp}/c++11/ios-inst.cc
	${libstdcpp}/c++11/iostream-inst.cc
	${libstdcpp}/c++11/istream-inst.cc
	# ${libstdcpp}/c++11/locale-inst.cc
	${libstdcpp}/c++11/ostream-inst.cc
	${libstdcpp}/c++11/sstream-inst.cc
	${libstdcpp}/c++11/streambuf-inst.cc
	${libstdcpp}/c++11/string-inst.cc
	${libstdcpp}/c++11/string-io-inst.cc
	${libstdcpp}/c++11/wlocale-inst.cc
	${libstdcpp}/c++11/wstring-inst.cc
	${libstdcpp}/c++11/wstring-io-inst.cc
)

add_library(libstdcpp11 STATIC ${LIBSTDCPP_C11_SOURCES})

target_include_directories(libstdcpp11 PRIVATE 
	${libstdcpproot}/config/locale/gnu
	${CMAKE_CURRENT_LIST_DIR}/include
	# ${libstdcpproot}/include/c
	# ${libstdcpproot}/include/c_global
	# ${libstdcpproot}/include/c_std
	# ${libstdcpproot}/include/c_compatibility
)

target_compile_options(libstdcpp11 PRIVATE -std=gnu++11)
target_compile_options(libstdcpp11 PRIVATE ${common_opts})

set_source_files_properties(
	${libstdcpp}/c++11/hashtable_c++0x.cc
    PROPERTIES COMPILE_OPTIONS "-fimplicit-templates"
)

set_source_files_properties(
	${libstdcpp}/c++11/codecvt.cc
	${libstdcpp}/c++11/limits.cc
    PROPERTIES COMPILE_OPTIONS "-fchar8_t"
)

# c++11/Makefile.in does some regex on the assembly of cxx11-ios_failure.cc :
#$(CXXCOMPILE) -gno-as-loc-support -S cxx11-ios_failure.cc -o tmp-$@
#sed -e '/^_*_ZTISt13__ios_failure:/,/_ZTVN10__cxxabiv120__si_class_type_infoE/s/_ZTVN10__cxxabiv120__si_class_type_infoE/_ZTVSt19__iosfail_type_info/' tmp-$@ > cxx11-ios_failure.s

#
# c++17
# 

set(LIBSTDCPP_C17_SOURCES
	${libstdcpp}/c++17/floating_from_chars.cc
	${libstdcpp}/c++17/floating_to_chars.cc
	# ${libstdcpp}/c++17/fs_dir.cc
	# ${libstdcpp}/c++17/fs_ops.cc
	# ${libstdcpp}/c++17/fs_path.cc
	${libstdcpp}/c++17/memory_resource.cc
	${libstdcpp}/c++17/ostream-inst.cc
	${libstdcpp}/c++17/string-inst.cc
	${libstdcpp}/c++17/cow-string-inst.cc

	# ${libstdcpp}/c++17/cow-fs_dir.cc
	# ${libstdcpp}/c++17/cow-fs_ops.cc
	# ${libstdcpp}/c++17/cow-fs_path.cc
)

add_library(libstdcpp17 STATIC ${LIBSTDCPP_C17_SOURCES})

target_compile_options(libstdcpp17 PRIVATE 
	-std=gnu++17 
	# -nostdinc++ 
	-fimplicit-templates
)
target_compile_options(libstdcpp17 PRIVATE ${common_opts})

target_include_directories(libstdcpp17 PRIVATE
	# ${libstdcpproot}/include/c
	# ${libstdcpproot}/include/c_global
	# ${libstdcpproot}/include/c_std
	# ${libstdcpproot}/include/c_compatibility
)

#
# c++20
#

set(LIBSTDCPP_C20_SOURCES
	${libstdcpp}/c++20/sstream-inst.cc
)

set(LIBSTDCPP_FILESYSTEM_SOURCES
	${libstdcpp}/filesystem/dir.cc
	${libstdcpp}/filesystem/ops.cc
	${libstdcpp}/filesystem/path.cc
)

set(LIBSTDCPP_SHARED_SOURCES
	${libstdcpp}/shared/hashtable-aux.cc
)


add_library(libstdcpp20 STATIC 
	${LIBSTDCPP_C20_SOURCES}
	# ${LIBSTDCPP_FILESYSTEM_SOURCES} # filesystem not used in MetaModule
)

target_include_directories(libstdcpp20 PRIVATE
	# ${libstdcpproot}/include/c_global
	# ${libstdcpproot}/include/c_std
	# ${libstdcpproot}/include/c
	# ${libstdcpproot}/include/c_compatibility
)

target_compile_options(libstdcpp20 PRIVATE -std=gnu++20)
target_compile_options(libstdcpp20 PRIVATE ${common_opts})

#
#
#

target_sources(metamodule-plugin-libc PRIVATE
    ${LIBSTDCPP_SHARED_SOURCES}
)

# target_link_libraries(metamodule-plugin-libc PUBLIC 
# 	libstdcpp20
# 	libstdcpp17 
# 	libstdcpp11 
# 	libstdcpp98 
# )

# Export include dirs so we can override system headers we want 
# to disable (like iostreams)
target_include_directories(metamodule-plugin-libc PUBLIC
	${CMAKE_CURRENT_LIST_DIR}/include
)

target_compile_definitions(metamodule-plugin-libc PRIVATE 
	# __HAVE_LOCALE_INFO__
	# __HAVE_LOCALE_INFO_EXTENDED__
)

