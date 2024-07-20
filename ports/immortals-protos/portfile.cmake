vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Immortals-Robotics/Protos
    REF "v${VERSION}"
    SHA512 1a5cb815f458dee990adb6992bf57ff47819ac8abcf7850b473aedb1d74e624bc218c4e47d6916a6b44802aefc146da8a2536aa9689f2d795caa02b06777a2ce
    HEAD_REF robocup-2024
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
