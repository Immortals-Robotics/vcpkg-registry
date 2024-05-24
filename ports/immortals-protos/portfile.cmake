vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO Immortals-Robotics/Protos
        REF "v${VERSION}"
        SHA512 4bfa506f7eb7ac32c850542d6c9e44720034e740d1e06305506a9f049a757751186bc54490572f44c2af9dcba09a9560e142f37be228cf4c6c7c60636c133230
        HEAD_REF robocup-2024
)

vcpkg_cmake_configure(
        SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
