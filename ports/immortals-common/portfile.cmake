vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Immortals-Robotics/Common
    REF "v${VERSION}"
    SHA512 00c7ea79891b33b7a9b3fefad592c69c63c13e4d14a7b047dfc5c184ecdee2a0a7683d318c27293832c5c98687ec041bc3409bbcf7ac37194e901b1502fff30d
    HEAD_REF main
)

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES 
    udp         FEATURE_UDP
    nng         FEATURE_NNG
    storage     FEATURE_STORAGE
    raylib      FEATURE_RAYLIB
    imgui       FEATURE_IMGUI
    logging     FEATURE_LOGGING
    config-file FEATURE_CONFIG_FILE
    debug       FEATURE_DEBUG)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        ${FEATURE_OPTIONS}
    OPTIONS_DEBUG
        -DENABLE_SANITIZERS=ON
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
