import QtQuick 2.15
import QtQuick.Layouts
import QtQuick.Controls 2.15

Item {

    QtObject {
        id: local
        function randomNumber(min, max) {
            return  Math.floor(Math.random() * (max - min + 1)) + min;
        }
        function mapNumbers(index) {
            var numberMap = [19, 7, 13, 1, 22, 11, 2, 17, 9, 20, 4, 15, 6, 24, 18, 12, 5, 10, 23, 14, 8, 3, 21, 16]
            return numberMap[index]
        }
    }

    GridView {
        id: grid
        anchors.fill: parent

        cellWidth: parent.width / 6
        cellHeight: parent.height / 4

        model: 24
        delegate: Item {
            width: grid.cellWidth
            height: grid.cellHeight

            Letter {
                width: {
                    if(grid.width > 1000) {
                        return parent.width * 0.50
                    } else {
                        return parent.width * 0.60
                    }
                }
                height: {
                    if(grid.width > 1000) {
                        return parent.width * 0.40
                    } else {
                        return parent.width * 0.45
                    }
                }
                property var mapNum: local.mapNumbers(index)
                anchors.horizontalCenter: parent.horizontalCenter
                y: (index%2==0)?(parent.height * 0.20):(parent.height * 0.30)
                frontTexture: "file:///" + letterContainer.getLetter(mapNum-1).imageSource
                dayNumber: mapNum
                letterComponent: letterContainer.getLetter(mapNum-1)
                onOpened: function(dayNumber) {
                    surpriseItem.surprise = letterContainer.getLetter(dayNumber).surprise
                    //exitArea.enabled = true
                    // surprisePanel.visible = true
                    // surprisePanel.opacity = 1
                    surprisePanel.open()
                }
            }
        }
    }

    // MouseArea {
    //     id: exitArea
    //     anchors.fill: parent
    //     enabled: false
    //     onClicked: {
    //         exitArea.enabled = false
    //         surprisePanel.exit()
    //         surprisePanel.opacity = 0
    //         surprisePanel.visible = false
    //     }
    // }

    Dialog {
        id: surprisePanel
        modal: true
        width: parent.width - 40
        height: parent.height - 40
        anchors.centerIn: parent
        closePolicy: Popup.CloseOnPressOutside | Popup.CloseOnEscape
        onClosed: {
            surpriseItem.exit()
        }
        Surprise {
            id: surpriseItem
            anchors.fill: parent
            anchors.margins: - 10
            visible: true
            // opacity: 0
            // Behavior on opacity {
            //     PropertyAnimation { duration: 500; easing.type: Easing.InQuad }
            // }
        }
        enter: Transition {
            NumberAnimation { property: "opacity"; duration: 450; from: 0; to: 1 }
        }
        exit: Transition {
            NumberAnimation { property: "opacity"; duration: 450; from: 1; to: 0 }
        }
    }


}
