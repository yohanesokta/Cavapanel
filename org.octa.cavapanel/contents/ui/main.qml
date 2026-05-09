import QtQuick
import org.kde.plasma.plasmoid
import org.octa.cava 1.0

PlasmoidItem {
    id: root

    width: 600
    height: 200

    Backend {
        id: backend

        Component.onCompleted: start()
    }

    Row {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 4

        Repeater {
            model: backend.bars

            delegate: Item {
                width: 12
                height: parent.height

                Rectangle {
                    width: parent.width
                    height: modelData
                    radius: 2
                    color: "white"

                    anchors.bottom: parent.bottom
                    Behavior on height {
                        NumberAnimation {
                            duration: 80
                        }
                    }
                }
            }
        }
    }
}
