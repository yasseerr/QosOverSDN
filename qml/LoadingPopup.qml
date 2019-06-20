import QtQuick 2.12
import QtQuick.Controls 2.12


Popup{
    id : pingingPopup
    width: 200
    height: 200
    clip: true
    modal: true
    anchors.centerIn: parent
    Rectangle {
        id: ping_rectangle
        color: "#ffffff"
        anchors.fill: parent
        opacity: 0.8
    }

    Label {
        id: pinginglabel
        x: 302
        y: 65
        width: 115
        height: 24
        text: qsTr("Connecting to Host ...")
        font.pointSize: 7
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: busyIndicator.top
        anchors.bottomMargin: 5
    }

    BusyIndicator {
        id: busyIndicator
        width: 86
        height: 86
        anchors.verticalCenterOffset: 10
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
    }

}
