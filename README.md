# CavaPanel

CavaPanel is a Plasma 6 widget that provides an audio visualizer for the KDE Plasma desktop environment. It utilizes a C++ backend to interface with CAVA and a QML frontend for seamless integration into the Plasma Shell.

<img width="959" height="318" alt="image" src="https://github.com/user-attachments/assets/2a929e5a-6bcd-424d-84a7-de30e2ce342d" />


## Prerequisites

Before installation, ensure the following dependencies are installed on your system.

### Installation Commands by Distribution

Copy and paste the command for your distribution to install all necessary system, build, and runtime dependencies (including CAVA).

#### Fedora / Nobara
```bash
sudo dnf install cava cmake extra-cmake-modules gcc-c++ \
    qt6-qtbase-devel qt6-qtdeclarative-devel \
    kf6-kcoreaddons-devel kf6-kpackage-devel
```

#### Arch Linux
```bash
sudo pacman -S cava cmake extra-cmake-modules gcc \
    qt6-base qt6-declarative \
    kcoreaddons kpackage
```

#### Debian / Ubuntu (KDE Neon)
```bash
sudo apt install cava cmake extra-cmake-modules g++ \
    qt6-base-dev qt6-declarative-dev \
    libkf6coreaddons-dev libkf6package-dev
```

## Installation

The project includes a Makefile to automate the build and installation process.

### 1. Build the Plugin
Compile the C++ QML module:
```bash
make build
```

### 2. Install to System
Install the QML module to the system library and register the Plasmoid widget. This step requires administrative privileges:
```bash
sudo make install
```

## Manual Packaging (.plasmoid)

A `.plasmoid` file is a package format for Plasma widgets. For this project, the package contains the QML frontend.

1. Navigate to the widget directory:
   ```bash
   cd org.octa.cavapanel
   ```
2. Compress the contents (excluding the C++ source and build files):
   ```bash
   zip -r ../org.octa.cavapanel.plasmoid . -x "plugin/*" "plugin/build/*"
   ```

**Important**: Because this widget relies on a compiled C++ plugin (`org.octa.cava`), the `.plasmoid` file alone will not function unless the plugin has been separately compiled and installed to the system's QML path using the Makefile.

## Uninstallation

To remove the widget and the plugin from your system:
```bash
sudo make uninstall
```

## Technical Details

- **Namespace**: `org.octa.cava`
- **Widget ID**: `org.octa.cavapanel`
- **Minimum Plasma Version**: 6.0
- **QML Module Path**: `/usr/lib/qt6/qml/org/octa/cava/`

## License

This project is licensed under the terms specified in the repository.
