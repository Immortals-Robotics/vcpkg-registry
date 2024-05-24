vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Immortals-Robotics/Common
    REF "v${VERSION}"
    SHA512 f46a29184653e9b4d67a1b0fe2a231cce2aec53ea1d01ac79706a4d8b937a363b884cc24351be0952903cbf2ea0ac983edb2b01dd0c8dac700e26dc016b9ef10
    HEAD_REF main
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS_DEBUG
        -DENABLE_SANITIZERS=ON
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
