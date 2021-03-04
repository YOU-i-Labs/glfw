# Find Vulkan
#
# VULKAN_INCLUDE_DIR
# VULKAN_LIBRARY
# VULKAN_FOUND

# You.i note:
# GLFW has its own copy of the Vulkan headers, so to get consistent builds
# we disabling find'ing the 'real' vulkan SDK. Otherwise, GLFW would
# build differently depending on whether the vulkan SDK is installed on
# the machine or not. In You.i's use case, the Vulkan SDK is
# 'prebuilt' and doesn't get installed on the build machine
# (see https://github.com/YOU-i-Labs/vulkan-prebuilt)

# if (WIN32)
#     find_path(VULKAN_INCLUDE_DIR NAMES vulkan/vulkan.h HINTS
#         "$ENV{VULKAN_SDK}/Include"
#         "$ENV{VK_SDK_PATH}/Include")
#     if (CMAKE_SIZEOF_VOID_P EQUAL 8)
#         find_library(VULKAN_LIBRARY NAMES vulkan-1 HINTS
#             "$ENV{VULKAN_SDK}/Lib"
#             "$ENV{VULKAN_SDK}/Bin"
#             "$ENV{VK_SDK_PATH}/Bin")
#         find_library(VULKAN_STATIC_LIBRARY NAMES vkstatic.1 HINTS
#             "$ENV{VULKAN_SDK}/Lib"
#             "$ENV{VULKAN_SDK}/Bin"
#             "$ENV{VK_SDK_PATH}/Bin")
#     else()
#         find_library(VULKAN_LIBRARY NAMES vulkan-1 HINTS
#             "$ENV{VULKAN_SDK}/Lib32"
#             "$ENV{VULKAN_SDK}/Bin32"
#             "$ENV{VK_SDK_PATH}/Bin32")
#         find_library(VULKAN_STATIC_LIBRARY NAMES vkstatic.1 HINTS
#             "$ENV{VULKAN_SDK}/Lib32"
#             "$ENV{VULKAN_SDK}/Bin32"
#             "$ENV{VK_SDK_PATH}/Bin32")
#     endif()
# elseif (APPLE)
#     find_library(VULKAN_LIBRARY MoltenVK)
#     if (VULKAN_LIBRARY)
#         set(VULKAN_STATIC_LIBRARY ${VULKAN_LIBRARY})
#         find_path(VULKAN_INCLUDE_DIR NAMES vulkan/vulkan.h HINTS
#             "${VULKAN_LIBRARY}/Headers")
#     endif()
# else()
#     find_path(VULKAN_INCLUDE_DIR NAMES vulkan/vulkan.h HINTS
#         "$ENV{VULKAN_SDK}/include")
#     find_library(VULKAN_LIBRARY NAMES vulkan HINTS
#         "$ENV{VULKAN_SDK}/lib")
# endif()

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(Vulkan DEFAULT_MSG VULKAN_LIBRARY VULKAN_INCLUDE_DIR)

mark_as_advanced(VULKAN_INCLUDE_DIR VULKAN_LIBRARY VULKAN_STATIC_LIBRARY)

