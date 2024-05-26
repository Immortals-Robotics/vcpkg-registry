vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Immortals-Robotics/TMC-API
    REF "v${VERSION}"
    SHA512 c9338781946be3942805897ca4529f1380da558dbfcebb24629210aa4b78f53b6458806f7556bc71d2fea3cdccc8f30f55f97c89b47a1af9c097443050ebd5df
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
