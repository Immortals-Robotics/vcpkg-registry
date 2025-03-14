vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO mherb/kalman
    REF 9f40c2f7bedb08e964297a00a2b9360036590896
    SHA512 73dfb13bc99669589d77e865bb7018fba7dc1a581ca3984badc082e952e33c18ec3b042d4299cc912cabefde3f844819b63c945d79c7ac39f80370e66569f4dd
    HEAD_REF master
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    OPTIONS
        -DKALMAN_BUILD_EXAMPLES=OFF
        -DBUILD_TESTING=OFF
)

vcpkg_install_cmake()
vcpkg_cmake_config_fixup(PACKAGE_NAME "kalman" CONFIG_PATH lib/)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
file(INSTALL ${SOURCE_PATH}/LICENSE.txt DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)
