vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Immortals-Robotics/ICM42688
    REF "v${VERSION}"
    SHA512 f6007a9418ff374ca5fc7f7716d666f175aea7a3a032f4cc0e1f2f41519e652545bd0d86dbe55e8402a340237f34cb3994e3b7c18030f5dad1465a0e9392c399
    HEAD_REF master
)

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES
    spi FEATURE_SPI
    i2c FEATURE_I2C
    fifo FEATURE_FIFO)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        ${FEATURE_OPTIONS}
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
