vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Immortals-Robotics/Protos
    REF "v${VERSION}"
    SHA512 c4b79d5bc76269e83ce05d4a78690cbae4fa640d62899ff0ee158b1bd7f233d7496fd2d32d4c43d386bff7b8b004144c72c92bd0e68c73c120b55ccfe93172c8
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
