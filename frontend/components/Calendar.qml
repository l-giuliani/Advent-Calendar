import QtQuick 2.15
import QtQuick.Layouts

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
                onOpened: function(dayNumber) {
                    surprisePanel.surprise = letterContainer.getLetter(dayNumber).surprise
                    exitArea.enabled = true
                    surprisePanel.visible = true
                    surprisePanel.opacity = 1
                }
            }
        }
    }

    MouseArea {
        id: exitArea
        anchors.fill: parent
        enabled: false
        onClicked: {
            exitArea.enabled = false
            surprisePanel.exit()
            surprisePanel.opacity = 0
            surprisePanel.visible = false
        }
    }

    Surprise {
        id: surprisePanel
        anchors.fill: parent
        anchors.margins: 15
        visible: false
        opacity: 0
        Behavior on opacity {
            PropertyAnimation { duration: 500; easing.type: Easing.InQuad }
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
            }
        }
    }

}
