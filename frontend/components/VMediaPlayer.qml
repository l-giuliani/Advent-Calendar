import QtQuick 2.15
import QtMultimedia 6.5
import QtQuick.Controls 2.15

Item {
    property alias url: player.source

    Rectangle {
        anchors.fill: parent
        color: "black"
    }

    MediaPlayer {
        id: player
        autoPlay: false
        loops: MediaPlayer.Infinite
        videoOutput: videoOutput
        audioOutput: audioOutput
    }

    VideoOutput {
        id: videoOutput
        anchors.fill: parent
    }
    AudioOutput {
        id: audioOutput
    }

    Item {
        id: controlsBar
        anchors.top: videoOutput.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width
        height: controlsBar.buttonsDim + 5
        property int buttonsDim: 40

        Rectangle {
            color: "black"
            anchors.fill: parent
        }

        Row {
            //anchors.fill: parent
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 5
            Slider {
                id: seekBar
                width: {
                    if(parent.width > 450) {
                        controlsBar.width * 0.7
                    } else {
                        controlsBar.width * 0.5
                    }
                }
                anchors.verticalCenter: parent.verticalCenter
                from: 0
                to: player.duration > 0 ? player.duration : 1
                value: player.position
                onMoved: {
                    player.position = value
                }
            }
            Rectangle {
                height: controlsBar.buttonsDim
                width: controlsBar.buttonsDim
                radius: 50
                anchors.verticalCenter: parent.verticalCenter
                gradient: Gradient {
                    //orientation: Gradient.Diagonal
                    GradientStop {
                        position: 0.0
                        color: "#8B0000"
                    }
                    GradientStop {
                        position: 0.5
                        color: "#FF4500"
                    }
                    GradientStop {
                        position: 1.0
                        color: "#CD5C5C"
                    }
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: player.stop()
                    enabled: player.playbackState === MediaPlayer.PlayingState || player.playbackState === MediaPlayer.PausedState
                }
                Text {
                    anchors.centerIn: parent
                    text: "Stop"
                    font.pointSize: 10
                }
            }
            Rectangle {
                height: controlsBar.buttonsDim
                width: controlsBar.buttonsDim
                radius: 50
                anchors.verticalCenter: parent.verticalCenter
                gradient: Gradient {
                        //orientation: Gradient.Diagonal
                        GradientStop {
                            position: 0.0
                            color: "#B8860B"
                        }
                        GradientStop {
                            position: 0.5
                            color: "#FFD700"
                        }
                        GradientStop {
                            position: 1.0
                            color: "#DAA520"
                        }
                    }
                MouseArea {
                    anchors.fill: parent
                    onClicked: player.pause()
                    enabled: player.playbackState === MediaPlayer.PlayingState
                }
                Text {
                    anchors.centerIn: parent
                    text: "Pause"
                    font.pointSize: 10
                }
            }
            Rectangle {
                height: controlsBar.buttonsDim
                width: controlsBar.buttonsDim
                radius: 50
                anchors.verticalCenter: parent.verticalCenter
                gradient: Gradient {
                        //orientation: Gradient.Diagonal
                        GradientStop {
                            position: 0.0
                            color: "#006400"
                        }
                        GradientStop {
                            position: 0.5
                            color: "#32CD32"
                        }
                        GradientStop {
                            position: 1.0
                            color: "#008000"
                        }
                    }
                MouseArea {
                    anchors.fill: parent
                    onClicked: player.play()
                    enabled: player.playbackState !== MediaPlayer.PlayingState
                }
                Text {
                    anchors.centerIn: parent
                    text: "Play"
                    font.pointSize: 10
                }
            }
        }
    }
}
