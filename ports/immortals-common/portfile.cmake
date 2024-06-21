vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Immortals-Robotics/Common
    REF "v${VERSION}"
    SHA512 29d0f7ec5768d8d7e0e1564a03e22e060e62e8e2150d7202b262be694d2a4cff1497c4f6dc60ec4357c56c54f9d6b8ab2234be2911f86f1f55ea89b114f6c774
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
