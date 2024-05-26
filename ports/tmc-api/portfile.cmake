vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Immortals-Robotics/TMC-API
    REF "v${VERSION}"
    SHA512 a94710fffceff33bbfa61c5b3302651f09d0182b270831b0d65f21cac578ae6276a92f723ba934dd287534db972724f760437e57360127407715a4fc25d12f4c
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
