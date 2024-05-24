vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO Immortals-Robotics/Protos
        REF "v${VERSION}"
        SHA512 6afdcb8f22d00eaf34ae28ece741ff99d7f5b3656104ca9eea42476eac1eaa1003f5042ebcc5575c43b54cc646519364c4f467d9d890216aa90fc17f037bfc9d
        HEAD_REF robocup-2024
)

vcpkg_cmake_configure(
        SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(PACKAGE_NAME "protos")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
