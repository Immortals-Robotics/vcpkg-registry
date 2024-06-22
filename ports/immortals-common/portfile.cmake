vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Immortals-Robotics/Common
    REF "v${VERSION}"
    SHA512 ce6860693cc11857093fecac3a7a25bfa126aaeba34b51e1064f3ca441093fc937df8bbee675051e1e50c4fb4a54a9f457738395a1bc287023771151e3f89038
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
