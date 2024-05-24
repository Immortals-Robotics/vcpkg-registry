vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO Immortals-Robotics/Protos
        REF a3bd29da9de61aeb71d2106319e4b200605dca84
        SHA512 f46d4dbe1a043360119e31403d32bd453e2265bfd75066e75e311c73ce9df86f7b7274689fd4a65a3afcd3a672d630988ce65b6e369b2a519abd8384be89d261
        HEAD_REF robocup-2024
)

vcpkg_cmake_configure(
        SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(PACKAGE_NAME "immortals-protos")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
