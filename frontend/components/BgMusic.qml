import QtQuick 2.15
import QtMultimedia 6.5

Item {
    property alias timeToNext: changeBgTimer.interval

    function execute(value) {
        if(!value) {
            player.source = ""
        } else {
            if(player.source === "") {
                playlist.randomSelect()
            }
        }
    }

    MediaPlayer {
        id: player
        autoPlay: true
        source: playlist.current
        audioOutput: audioOutput
        onPlaybackStateChanged: {
            if (playbackState === MediaPlayer.EndOfMedia) {
                playlist.randomSelect()
            }
        }
    }

    AudioOutput {
        id: audioOutput
    }

    Timer {
        id: changeBgTimer
        property int dayNumber
        interval: 40000
        repeat: true
        running: true
        onTriggered: {
            fadeTimer.playerVol = audioOutput.volume
            changeBgTimer.stop()
            fadeTimer.start()
        }
    }

    Timer {
        id: fadeTimer
        repeat: true
        running: false
        property var playerVol
        onTriggered: {
            console.log(audioOutput.volume)
            if(audioOutput.volume >= 0.15) {
                audioOutput.volume = 0.1 + (audioOutput.volume - 0.1) * 0.5
            } else {
                fadeTimer.stop()
                audioOutput.volume = playerVol
                playlist.randomSelect()
                changeBgTimer.start()
            }
        }
    }

    Connections {
        target: playlist
        function onCurrentChanged () {
            player.source = playlist.current
            player.play()
        }
    }
}
