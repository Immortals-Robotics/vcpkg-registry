vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO analogdevicesinc/TMC-API
    REF e77feedec84f78ccdcce5dd9963f65d37968decb
    SHA512 50bc66f4da5cc30d4f7459a8bf739a9fab2d062462336c1cf2d8161073e0cea107146458f64ad27a3f9d41568211246df6423eb2a33382f5c2d6c1a8d2a72484
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
