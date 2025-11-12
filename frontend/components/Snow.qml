import QtQuick 2.15
import QtQuick.Particles

Item {

    ParticleSystem {
        id: snowSystem
    }
    Emitter {
        id: snowEmitter
        system: snowSystem
        width: parent.width
        height: 1
        anchors.top: parent.top

        emitRate: 100
        lifeSpan: 15000
        lifeSpanVariation: 1000

        size: 8
        sizeVariation: 4
        velocity: PointDirection {
            y: 70
            yVariation: 20
            xVariation: 15
        }
    }

    // ImageParticle {
    //     id: snowParticle
    //     system: snowSystem // Collegamento al sistema
    //     source: "qrc:/images/snow.png" // Sostituisci con la tua immagine
    //     color: "white"
    //     alphaVariation: 0.5
    // }
    Component {
        id: roundParticleDelegate
        Rectangle {
            width: 5
            height: 5
            color: "white"
            radius: width / 2
        }
    }
    ItemParticle {
        id: snowParticle
        system: snowSystem
        delegate: roundParticleDelegate
    }
}
