set(libgcc ${CMAKE_CURRENT_LIST_DIR}/libgcc)

set(LIBGCC_CONFIG_ARM_SOURCES
    #t-arm:
    ${libgcc}/config/arm/lib1funcs.S
    #t-bpabi:
    ${libgcc}/config/arm/bpabi.c  
    #defines: _aeabi_lcmp _aeabi_ulcmp _aeabi_ldivmod _aeabi_uldivmod
    ${libgcc}/config/arm/unaligned-funcs.c

    ${libgcc}/libgcc2.c
)

set(LIBGCC_CONFIG_ARM_EH_SOURCES
    ${libgcc}/config/arm/unwind-arm.c
    ${libgcc}/config/arm/libunwind.S 
    ${libgcc}/config/arm/pr-support.c 
    ${libgcc}/unwind-c.c
)

target_compile_definitions(metamodule-plugin-libc PRIVATE
    L_aeabi_lcmp
    L_aeabi_ulcmp
    L_aeabi_ldivmod
    L_aeabi_uldivmod
)

target_sources(metamodule-plugin-libc PRIVATE
	${LIBGCC_CONFIG_ARM_SOURCES}
)

if(PLUGIN_ENABLE_EXCEPTIONS)
    target_sources(metamodule-plugin-libc PRIVATE
        ${LIBGCC_CONFIG_ARM_EH_SOURCES}
    )
endif()
