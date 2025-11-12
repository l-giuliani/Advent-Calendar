import QtQuick
import QtQuick.Controls

import "frontend/components"

Window {
    // width: 640
    // height: 480
    visible: true
    title: qsTr("Advent Calendar")
    //width: Screen.desktopAvailableWidth
    //height: Screen.desktopAvailableHeight
    visibility: Window.FullScreen

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

    Snow {
        anchors.fill: parent
    }

    Item {
        anchors.fill: parent
        Calendar {
            anchors.fill: parent
        }
    }

}
