vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Immortals-Robotics/Protos
    REF "v${VERSION}"
    SHA512 c23d23fd0a895b80b9f3b0342ce27db6cda56ff31c77cabad0c7ec15dc3328f4cc8dc7af6f00b2d9d9c6d25d02c89d374fcc49bc4f4acec7395ce2ac0ce07b2f
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
