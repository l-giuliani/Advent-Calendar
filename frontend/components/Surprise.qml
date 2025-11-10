import QtQuick 2.15

import adventCalendarEnums 1.0
import "surprise"

Item {
    property var surprise: null

    function exit() {
        surprise = null
    }

    Image {
        anchors.fill: parent
        source: "qrc:/images/bg.jpg"
        fillMode: Image.PreserveAspectCrop
    }

    Item {
        width: parent.width * 0.90
        height: parent.height * 0.80
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        Loader {
            anchors.fill: parent
            active: (surprise!= null && (surprise.surpriseType === SurpriseType.TEXT))
            sourceComponent: Component{
                TextSurprise {
                    text: surprise.text
                }
            }
        }

        Loader {
            anchors.fill: parent
            active: (surprise!= null && (surprise.surpriseType !== SurpriseType.TEXT))
            sourceComponent: Component{
                MediaSurprise {
                    mediaType: surprise.surpriseType
                    mediaUrl: surprise.url
                    text: surprise.text
                }
            }
        }
    }
}
