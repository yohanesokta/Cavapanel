import QtQuick
import org.kde.plasma.plasmoid
import org.octa.cava 1.0

PlasmoidItem {
    id: root

    property int barWidth: 8
    property int barSpacing: 4
    property int maxBar: Math.floor(width / (barWidth + barSpacing))

    width: 600
    height: 200

    Backend {
        id: backend

        Component.onCompleted: start()
    }

    Row {
        anchors.fill: parent
        anchors.margins: 10
        spacing: root.barSpacing

        Repeater {
            model: root.maxBar

            delegate: Item {
                width: root.barWidth
                height: parent.height
                property int value: index < backend.bars.length ? backend.bars[index] : 0
                Rectangle {
                    width: parent.width
                    height: value
                    radius: 2
                    color: "white"

                    anchors.bottom: parent.bottom
                    Behavior on height {
                        NumberAnimation {
                            duration: 60
                        }
                    }
                }
            }
        }
    }
}
