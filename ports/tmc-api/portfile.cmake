vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Immortals-Robotics/TMC-API
    REF "v${VERSION}"
    SHA512 ee50857c96e353da2fe66e1e84b92e384e2fb39c54550e0c2626c95822fedc68c2ebf4691662255a1e9e4dad37801df81eac228866a850b77c1690e9cd9597db
    HEAD_REF master
)

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES
    spi-array-transfer FEATURE_SPI_ARRAY_TRANSFER
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
