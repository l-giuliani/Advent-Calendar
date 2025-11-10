import QtQuick 2.15
import QtMultimedia 6.5
import QtQuick.Controls 2.15
import adventCalendarEnums 1.0

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
                    MediaPlayer {
                        id: player
                        source: mediaUrl
                        autoPlay: true
                        loops: MediaPlayer.Infinite
                        videoOutput: videoOutput
                        audioOutput: audioOutput
                    }

                    VideoOutput {
                        id: videoOutput
                        anchors.fill: parent
                        anchors.margins: 10
                    }
                    AudioOutput {
                        id: audioOutput
                    }

                    Row {
                        Slider {
                            id: seekBar

                            // 1. Imposta il valore massimo della barra (durata totale del video in millisecondi)
                            from: 0
                            to: player.duration > 0 ? player.duration : 1

                            // 2. Aggiorna la posizione della barra durante la riproduzione
                            // Il binding della 'value' si aggiorna automaticamente con la posizione del player
                            value: player.position

                            // 3. Sposta il punto di riproduzione quando l'utente trascina la barra
                            // Questo gestisce il 'seeking'
                            onMoved: {
                                // Imposta la posizione del player al valore della slider
                                player.position = value
                            }
                        }
                    }

                    Row {
                            id: controls
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.bottom: parent.bottom
                            spacing: 10

                            Button {
                                text: "Play"
                                onClicked: player.play()
                                enabled: player.playbackState !== MediaPlayer.PlayingState
                            }

                            Button {
                                text: "Pausa"
                                onClicked: player.pause()
                                enabled: player.playbackState === MediaPlayer.PlayingState
                            }

                            Button {
                                text: "Stop"
                                onClicked: player.stop()
                                enabled: player.playbackState === MediaPlayer.PlayingState || player.playbackState === MediaPlayer.PausedState
                            }
                        }
                }
            }
        }
        Loader {
            active: (mediaType !== null) && (mediaType === SurpriseType.IMAGE)
            anchors.fill: parent
            sourceComponent: Component {
                Item {
                    Image {
                        id: media
                        anchors.fill: parent
                        source: mediaUrl
                        fillMode: Image.PreserveAspectFit
                    }
                    Rectangle {
                        width: media.paintedWidth
                        height: media.paintedHeight
                        anchors.centerIn: media
                        anchors.horizontalCenterOffset: -5   // sposta a sinistra
                        anchors.verticalCenterOffset: 5
                        color: "#80000000"
                        radius: 3
                        z: -1
                        opacity: 0.5
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
