vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Immortals-Robotics/Common
    REF "v${VERSION}"
    SHA512 54702512bb0d6c182708d3e3d892f4f555eebf823635955f80e6582a8e6b513672f5e78301e715a4ee3e4d83c6c56f25651d646f249dcb9765a1f956a782ab46
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
