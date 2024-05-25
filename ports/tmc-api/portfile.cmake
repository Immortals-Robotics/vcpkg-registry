vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO analogdevicesinc/TMC-API
    REF aeec3a7af654a34ccdc260f02254f7f500d4ff5a
    SHA512 6f11d1d5c74783811e1f5be40e8604bcea00ef7f593df745a6dffea0d4e9aa3bbc241d8e0aa03bce83c6c36ddf1fe376942a7e3392bd1d8d493abaa017cbb183
    HEAD_REF master
)

file(COPY "${CMAKE_CURRENT_LIST_DIR}/tmc-api-config.cmake.in" DESTINATION "${SOURCE_PATH}")
file(COPY "${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt" DESTINATION "${SOURCE_PATH}")

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES 
    tmc-4671 FEATURE_TMC4671
    tmc-6200 FEATURE_TMC6200)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        ${FEATURE_OPTIONS}
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
