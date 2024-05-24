vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO Immortals-Robotics/Protos
        REF "v${VERSION}"
        SHA512 82c73e2d6e9d042778c3ea3f061d9831fd7bab739c52acaa27decf4621b18699b691812cd8223d02620a66e3210e66db5d0c30049dc6255697bb0f7d75069fbb
        HEAD_REF robocup-2024
)

vcpkg_cmake_configure(
        SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(PACKAGE_NAME "protos")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
