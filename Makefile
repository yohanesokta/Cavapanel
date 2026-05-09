PREFIX ?= /usr
PLUGIN_BUILD_DIR = org.octa.cavapanel/plugin/build
WIDGET_ID = org.octa.cavapanel

.PHONY: all build install install-plugin install-widget uninstall clean

all: build

build:
	mkdir -p $(PLUGIN_BUILD_DIR)
	cd $(PLUGIN_BUILD_DIR) && cmake -DCMAKE_INSTALL_PREFIX=$(PREFIX) .. && make

install:
	@echo "Pastikan anda menjalankan dengan 'sudo make install' untuk instalasi sistem"
	$(MAKE) install-plugin
	$(MAKE) install-widget

install-plugin:
	@echo "Installing C++ Plugin to $(PREFIX)..."
	cd $(PLUGIN_BUILD_DIR) && cmake --install .

install-widget:
	@echo "Installing Plasmoid Widget..."
	-kpackagetool6 --global -t Plasma/Applet --remove $(WIDGET_ID)
	kpackagetool6 --global -t Plasma/Applet --install org.octa.cavapanel
	@echo "--- Verifikasi Instalasi ---"
	kpackagetool6 --global -t Plasma/Applet --list | grep $(WIDGET_ID)

uninstall:
	@echo "Uninstalling Widget..."
	-kpackagetool6 --global -t Plasma/Applet --remove $(WIDGET_ID)
	@echo "Uninstalling Plugin..."
	@echo "Hapus manual folder plugin di lib system jika ingin bersih total,"
	@echo "atau gunakan manifest: xargs rm < $(PLUGIN_BUILD_DIR)/install_manifest.txt"

clean:
	rm -rf $(PLUGIN_BUILD_DIR)
