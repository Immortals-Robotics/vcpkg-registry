vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Immortals-Robotics/Protos
    REF "v${VERSION}"
    SHA512 f56c74832e39f1ed4cf615cf50a74022688d3c3e3e7952d5c13af770e81ff5446d3f4de28eede4cb47adeb477f1a252be8c8fce10ff9462ed32042f8acbfefa4
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
