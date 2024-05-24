vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO lordhippo/vartypes
    REF a55280872b4b39269acbd4c3faa6160e64f576d5
    SHA512 03696c06aff60020aa2b868b6b60c98dfc43347578194e914be1954907bd63615d1e259ffaad148f47204aa953762821d85231c37edc51f97fd48a753e8de905
    HEAD_REF master
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}
    OPTIONS
        -DBUILD_EXAMPLE=OFF)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(PACKAGE_NAME "vartypes")

file(INSTALL "${SOURCE_PATH}/COPYING" DESTINATION "${CURRENT_PACKAGES_DIR}/share/vartypes" RENAME copyright)
