vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Immortals-Robotics/Common
    REF "v${VERSION}"
    SHA512 ace2b500383578eba160d9808d7b0cd37c08c189b3af6dde268c62314bb2bdccca918ee00f663c066b397d19985f5a5e277c9a8ef1aa4b8be3881c43b36b67ad
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
