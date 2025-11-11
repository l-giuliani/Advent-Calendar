import QtQuick 2.15
import QtMultimedia 6.5
import QtQuick.Controls 2.15
import adventCalendarEnums 1.0

import "../"

Item {
    property string mediaUrl: ""
    property var mediaType
    property alias text: txt.text

    Item {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: txt.top
        anchors.top: parent.top
        Loader {
            active: (mediaType !== null) && (mediaType === SurpriseType.VIDEO)
            anchors.fill: parent
            sourceComponent: Component {
                Item {
                    VMediaPlayer {
                        anchors.fill: parent
                        anchors.margins: 10
                        url: mediaUrl
                    }
                }
            }
        }
    }
    Text {
        id: txt
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        height: Math.max(parent.height * 0.15, 50)
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 18
        text: "Media"
    }
}
