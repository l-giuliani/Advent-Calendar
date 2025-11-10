import QtQuick 2.15
import QtQuick.Shapes 1.10

Item {
    id: root
    property alias frontTexture: paperTexture.source
    //property alias calendarNumber: calendarNumber.text
    property int dayNumber
    signal opened(int dayNumber)
    Rectangle {
        id: envelopeBody
        anchors.fill: parent
        radius: 6
        color: "#f9f3e9"
        border.color: "#c0b8a8"
        z: 1

        Rectangle {
            anchors.fill: parent
            anchors.leftMargin: -3
            anchors.bottomMargin: -3
            x: 5; y: 5
            color: "#80000000"
            radius: parent.radius
            z: -1
            opacity: 0.5
        }
    }

    Timer {
        id: animationTimer
        property int dayNumber
        interval: 900
        repeat: false
        running: false
        onTriggered: {
            opened(dayNumber)
        }
    }

    function open() {
        const letter = letterContainer.getLetter(dayNumber-1)
        letter.open()
        animationTimer.dayNumber = dayNumber-1
        animationTimer.start()
    }

    states: [
        State {
            name: "open"
            PropertyChanges {target: flapRotation; angle: 0}
            PropertyChanges {target: letter; opacity: 1; y: (envelopeBody.y - envelopeBody.height * 0.3)}
            when: {
                return letterContainer.getLetter(dayNumber-1).isOpen
            }
        },
        State {
            name: "close"
            PropertyChanges {target: flapRotation; angle: -120}
            PropertyChanges {target: letter;opacity: 0;y: (envelopeBody.y + envelopeBody.height * 0.1)}
            when: {
                return (!letterContainer.getLetter(dayNumber-1).isOpen)
            }
        }
    ]

    MouseArea {
        anchors.fill: parent
        onClicked: {
            root.open()
        }
    }

    Shape {
        id: flap
        anchors.bottom: envelopeBody.top
        anchors.horizontalCenter: envelopeBody.horizontalCenter
        width: envelopeBody.width
        height: envelopeBody.height * 0.7
        z: 4

        ShapePath {
            strokeWidth: 1
            strokeColor: "#c0b8a8"
            fillGradient: LinearGradient {
                x1: 0; y1: 0
                x2: 0; y2: flap.height
                GradientStop { position: 0.0; color: "#fffaf3" }
                GradientStop { position: 1.0; color: "#f0e6d2" }
            }

            PathMove { x: 0; y: flap.height }
            PathLine { x: flap.width / 2; y: 0 }
            PathLine { x: flap.width; y: flap.height }
            //PathLine { x: 0; y: flap.height }
        }

        transform: Rotation {
            id: flapRotation
            origin.x: flap.width / 2
            origin.y: flap.height
            axis.x: 1
            axis.y: 0
            axis.z: 0
            angle:  -180   // -180 = chiusa, 0 = aperta

            Behavior on angle {
                NumberAnimation { duration: 800; easing.type: Easing.InOutQuad}
            }
        }


    }

    Rectangle {
       id: letter
       width: envelopeBody.width * 0.9
       height: envelopeBody.height * 0.9
       color: "white"
       radius: 3
       anchors.horizontalCenter: envelopeBody.horizontalCenter
       y: envelopeBody.y + envelopeBody.height * 0.1
       z: 5
       opacity: 0

       Text {
           text: "🎄 Buon Natale!"
           anchors.centerIn: parent
           font.pixelSize: 20
           color: "#333"
       }

       Behavior on y {
            PropertyAnimation { duration: 600; easing.type: Easing.InQuad }
       }
       Behavior on opacity {
            PropertyAnimation { duration: 600; easing.type: Easing.InQuad }
       }
   }

    Item {
        id: frontContainer
        anchors.fill: parent
        z: 6

        Image {
            id: paperTexture
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            height:  parent.height - parent.height * 0.25
            source: "qrc:/images/three.jpg"
            fillMode: Image.PreserveAspectCrop
        }

        Shape {
            id: front
            anchors.bottom: paperTexture.top
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top

            ShapePath {
                id: frontShape
                strokeWidth: 1
                strokeColor: "#c0b8a8"
                fillGradient: LinearGradient {
                    x1: 0; y1: 0
                    x2: 0; y2: flap.height
                    GradientStop { position: 0.0; color: "#fffaf3" }
                    GradientStop { position: 1.0; color: "#f0e6d2" }
                }
                //fillColor: "transparent"
                // strokeColor: "transparent"

                // PathMove { x: 0; y: 0 }
                // PathLine { x: front.width / 3; y: front.height / 3 }
                // PathLine { x: front.width * 2 / 3; y: front.height / 3 }
                // PathLine { x: front.width; y: 0 }
                // PathLine { x: front.width; y: front.height }
                // PathLine { x: 0; y: front.height }

                PathMove { x: 0; y: 0 }
                PathLine { x: front.width / 3; y: front.height }
                PathLine { x: front.width * 2 / 3; y: front.height }
                PathLine { x: front.width; y: 0 }
                PathLine { x: front.width; y: front.height }
                PathLine { x: 0; y: front.height }
                PathLine { x: 0; y: 0 }

                // PathMove { x: 0; y: 0 }
                // PathLine { x: front.width / 3; y: front.height / 3 }
                // PathLine { x: front.width * 2 / 3; y: front.height / 3 }
                // PathLine { x: front.width; y: 0 }
                // PathLine { x: front.width; y: front.height / 3 }
                // PathLine { x: 0; y: front.height / 3 }
                // PathLine { x: 0; y: 0 }

                // PathMove { x: 0; y: 0 }
                // PathLine { x: width; y: 0 }
                // PathLine { x: width; y: height }
                // PathLine { x: 0; y: height }
                // PathLine { x: 0; y: 0 }

                // PathMove { x: 0; y: height }
                // PathLine { x: 0; y: 0 }
                // PathLine { x: width / 3; y: height / 3 }
                // PathLine { x: width * 2 / 3; y: height / 3 }
                // PathLine { x: width; y: 0 }
                // PathLine { x: width; y: height }
                // PathLine { x: 0; y: height }
            }
        }

        Text {
            id: calendarNumber
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 3
            anchors.horizontalCenter: parent.horizontalCenter
            text: dayNumber
            font.pointSize: {
                if(parent.width > 100) {
                    return 28
                } else if(parent.width > 50){
                    return 15
                } else {
                    return 10
                }
            }
            font.bold: true
            color: "white" // Colore del testo
            style: Text.Outline
            styleColor: "black"
        }
    }

}
