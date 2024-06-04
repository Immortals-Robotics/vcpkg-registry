vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Immortals-Robotics/Common
    REF "v${VERSION}"
    SHA512 caab7991536599d1f5edaaa7dcd3828b1c0baa28069831575a0f5e3fde7d6ac4c66a88fc2d5bb66384a64f7940e35654de78f380c7824f6672990031d271b69d
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
