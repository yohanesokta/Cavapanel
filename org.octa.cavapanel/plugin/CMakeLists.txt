cmake_minimum_required(VERSION 3.16)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
project(orgoctacava)

find_package(Qt6 REQUIRED COMPONENTS Core Qml)

qt_add_qml_module(orgoctacava
    URI org.octa.cava
    VERSION 1.0

    OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/org/octa/cava

    PLUGIN_TARGET orgoctacava
    SOURCES
        backend.cpp
        backend.h
)
