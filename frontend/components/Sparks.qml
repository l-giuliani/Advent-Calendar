import QtQuick 2.15
import QtQuick.Particles

Item {

    function start() {
        sparksEmitter.enabled = true
        execTimer.start()
    }

    ParticleSystem {
        id: sparksSystem
    }

    Emitter {
        id: sparksEmitter
        system: sparksSystem
        anchors.centerIn: parent
        emitRate: 150
        lifeSpan: 2000
        size: 3
        sizeVariation: 2
        velocity: AngleDirection {
            angle: -90
            angleVariation: 30
            magnitude: 150
            magnitudeVariation: 40
        }
        acceleration: PointDirection { y: 170 }
        enabled: false
    }

    Component {
        id: sparkParticleDelegate
        Rectangle {
            width: 3
            height: 4
            color: (Math.random() < 0.5 ? "yellow" : "red")
            radius: width / 2
        }
    }

    ItemParticle {
        id: sparkParticle
        system: sparksSystem
        delegate: sparkParticleDelegate
    }

    Timer {
        id: execTimer
        interval: 1500
        running: false
        repeat: false
        onTriggered: {
            sparksEmitter.enabled = false
        }
    }
}
