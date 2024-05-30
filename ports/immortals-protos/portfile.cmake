vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Immortals-Robotics/Protos
    REF "v${VERSION}"
    SHA512 3f4063a678c4fbfefe9a6f8566a1d522424ae0be0b498bcde5e764b8bc41d1ba5c484a11d34b2c9ca1bfcdce614138d0dd2352c4fdaa51bc4b096b23d3006220
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
