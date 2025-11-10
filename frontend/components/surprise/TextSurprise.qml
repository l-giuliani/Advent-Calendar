import QtQuick 2.15

Item {
    property alias text: txt.text
    Text {
        id: txt
        anchors.fill: parent
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 18
    }
}
