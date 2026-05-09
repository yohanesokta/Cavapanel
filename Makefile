.PHONY: all build install-widget clean

all: build install-widget

build:
	mkdir -p org.octa.cavapanel/plugin/build
	cd org.octa.cavapanel/plugin/build && cmake .. && make
	mkdir -p ~/.local/share/qml/
	cp -r org.octa.cavapanel/plugin/build/org ~/.local/share/qml/
	@echo "Binary updated in org.kde.koctask/contents/bin/task"

install-widget:
	-kpackagetool6 -t Plasma/Applet --remove org.octa.cavapanel
	kpackagetool6 -t Plasma/Applet --install org.octa.cavapanel
	@echo "--- Verifikasi Instalasi ---"
	kpackagetool6 -t Plasma/Applet --list | grep koctask


clean:
	rm -rf org.octa.cavapanel/plugin/build
