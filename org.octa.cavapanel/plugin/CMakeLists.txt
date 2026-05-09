cmake_minimum_required(VERSION 3.16)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
project(orgoctacava)

find_package(Qt6 REQUIRED COMPONENTS Core Qml)
find_package(ECM REQUIRED NO_MODULE)
set(CMAKE_MODULE_PATH ${ECM_MODULE_PATH})
include(KDEInstallDirs)

# Debug: check the resolved QML directory
message(STATUS "KDE_INSTALL_QMLDIR: ${KDE_INSTALL_QMLDIR}")

# Fallback if empty
if(NOT KDE_INSTALL_QMLDIR)
    set(KDE_INSTALL_QMLDIR "lib/qt6/qml")
    message(STATUS "KDE_INSTALL_QMLDIR was empty, using fallback: ${KDE_INSTALL_QMLDIR}")
endif()

qt_add_qml_module(orgoctacava
    URI org.octa.cava
    VERSION 1.0

    OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/org/octa/cava

    PLUGIN_TARGET orgoctacava
    SOURCES
        backend.cpp
        backend.h
)

# Install rules - We MUST install from the OUTPUT_DIRECTORY to get the generated qmldir
install(DIRECTORY ${CMAKE_BINARY_DIR}/org/octa/cava/ 
        DESTINATION ${KDE_INSTALL_QMLDIR}/org/octa/cava
        FILES_MATCHING 
            PATTERN "*.qmltypes" 
            PATTERN "qmldir" 
            PATTERN "*.so"
)
