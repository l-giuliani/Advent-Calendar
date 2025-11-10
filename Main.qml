import QtQuick
import QtQuick.Controls
import QtQuick.Particles

import "frontend/components"

Window {
    // width: 640
    // height: 480
    visible: true
    title: qsTr("Advent Calendar")
    width: Screen.desktopAvailableWidth
    height: Screen.desktopAvailableHeight
    //visibility: Window.FullScreen

    Image {
        anchors.fill: parent
        source: "qrc:/images/three_snow.jpg"
    }

    Item {
        anchors.top: parent.top
        anchors.left: parent.left
        width: 30
        height: 30
        z: 999
        MouseArea {
            anchors.fill: parent
            onClicked: {
                Qt.quit()}
        }
    }

    Item {
        anchors.fill: parent
        ParticleSystem {
            id: snowSystem
        }
        Emitter {
            id: snowEmitter
            system: snowSystem
            width: parent.width
            height: 1
            anchors.top: parent.top

            emitRate: 100
            lifeSpan: 15000
            lifeSpanVariation: 1000

            size: 8
            sizeVariation: 4
            velocity: PointDirection {
                y: 70
                yVariation: 20
                xVariation: 15
            }
        }

        // ImageParticle {
        //     id: snowParticle
        //     system: snowSystem // Collegamento al sistema
        //     source: "qrc:/images/snow.png" // Sostituisci con la tua immagine
        //     color: "white"
        //     alphaVariation: 0.5
        // }
        Component {
            id: roundParticleDelegate
            Rectangle {
                width: 5
                height: 5
                color: "white"
                radius: width / 2
            }
        }
        ItemParticle {
            id: snowParticle
            system: snowSystem
            delegate: roundParticleDelegate
        }
    }

    Item {
        anchors.fill: parent
        Calendar {
            anchors.fill: parent
        }
    }

}
