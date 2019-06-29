import QtQuick 2.4
import QtQuick.Controls.Material 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Styles 1.4

Popup{
    id : root
    width: 640
    height: 480
    padding: 0
    rightPadding: 0
    leftPadding: 0
    bottomPadding: 0
    topPadding: 0
    modal: true
    opacity: 0.9
    clip: true
    Rectangle {
        id: rootContent
        color: "#1c1a1a"
        opacity: 0.9
        anchors.fill: parent

        Text {
            id: policyNamelabel
            x: 30
            y: 150
            color: "#ffffff"
            text: qsTr("Policy Name :")
            anchors.left: parent.left
            anchors.leftMargin: 30
            anchors.top: parent.top
            anchors.topMargin: 150
            font.family: "Courier"
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 16
        }
        TextEdit {
            id: policyNameTextEdit
            x: 190
            y: 168
            width: 200
            height: 35
            color: "#f5f3f3"
            anchors.verticalCenterOffset: 10
            font.bold: true
            anchors.verticalCenter: policyNamelabel.verticalCenter
            anchors.left: policyNamelabel.right
            anchors.leftMargin: 10
            horizontalAlignment: Text.AlignLeft
            font.underline: false
            selectionColor: "#00801c"
            font.pixelSize: 17

            Rectangle {
                id: rectangle1
                width: 165
                height: 2
                color: "#ffffff"
                anchors.top: parent.top
                anchors.topMargin: 30
                anchors.left: parent.left
                anchors.leftMargin: 0
            }
        }

        Button {
            id: nextButton
            x: 440
            y: 330
            width: 100
            height: 50
            opacity: 1
            spacing: 3

            focusPolicy: Qt.WheelFocus

            icon.name : "backgroungimage"
            icon.source: "../assets/Forward arrow.png"
            icon.color: "transparent"

            text: "<font color='#ffffff'>Next</font>"
            hoverEnabled: true
            display: AbstractButton.TextUnderIcon
            anchors.right: parent.right
            anchors.rightMargin: 100
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 100
            background: Rectangle{
                anchors.fill: parent
                color: nextButton.hovered?Qt.lighter("#1a1818"):"#1a1818"
            }

        }
    }
}





































