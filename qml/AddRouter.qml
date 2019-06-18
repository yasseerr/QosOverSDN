import QtQuick 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Styles 1.4

Item {
    id: root
    width: 640
    height: 480
    /*
    padding: 0
    rightPadding: 0
    leftPadding: 0
    bottomPadding: 0
    topPadding: 0
    modal: true*/
    opacity: 0.9
    clip: true
    Rectangle {
        id: rootContent
        color: "#1c1a1a"
        opacity: 0.9
        anchors.fill: parent

        Text {
            id: namelabel
            x: 30
            y: 150
            color: "#ffffff"
            text: qsTr("UserName :")
            anchors.left: parent.left
            anchors.leftMargin: 30
            anchors.top: parent.top
            anchors.topMargin: 100
            font.family: "Courier"
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 16
        }
        TextEdit {
            id: nameTextEdit
            x: 190
            y: 168
            width: 200
            height: 35
            color: "#f5f3f3"
            anchors.verticalCenterOffset: 0
            font.bold: true
            anchors.verticalCenter: namelabel.verticalCenter
            anchors.left: namelabel.right
            anchors.leftMargin: 20
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

            icon.name: "backgroungimage"
            icon.source: "../assets/Forward arrow.png"
            icon.color: "transparent"

            text: "<font color='#ffffff'>Add</font>"
            hoverEnabled: true
            display: AbstractButton.TextUnderIcon
            anchors.right: parent.right
            anchors.rightMargin: 100
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 100
            background: Rectangle {
                anchors.fill: parent
                //                color: nextButton.hovered?Qt.lighter("#1a1818"):"#1a1818"
            }
        }

        Text {
            id: passwordlabel
            x: 32
            y: 156
            color: "#ffffff"
            text: qsTr("Password :")
            anchors.topMargin: 50
            anchors.left: parent.left
            font.pixelSize: 16
            horizontalAlignment: Text.AlignHCenter
            anchors.top: namelabel.bottom
            anchors.leftMargin: 30
            font.family: "Courier"
        }

        TextEdit {
            id: classNameTextEdit1
            width: 200
            height: 35
            color: "#f5f3f3"
            anchors.top: passwordTextEdit.bottom
            anchors.topMargin: 30
            anchors.verticalCenter: namelabel.verticalCenter
            anchors.left: ipaddresslabel.right
            font.pixelSize: 17
            horizontalAlignment: Text.AlignLeft
            selectionColor: "#00801c"
            anchors.verticalCenterOffset: 149
            anchors.leftMargin: 20
            font.bold: true
            Rectangle {
                id: rectangle2
                width: 165
                height: 2
                color: "#ffffff"
                anchors.topMargin: 30
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 0
            }
            font.underline: false
        }

        TextEdit {
            id: passwordTextEdit
            width: 200
            height: 34
            color: "#f5f3f3"
            anchors.top: nameTextEdit.bottom
            anchors.topMargin: 30
            anchors.verticalCenter: namelabel.verticalCenter
            anchors.left: passwordlabel.right
            font.pixelSize: 17
            horizontalAlignment: Text.AlignLeft
            selectionColor: "#00801c"
            anchors.verticalCenterOffset: 68
            anchors.leftMargin: 20
            font.bold: true
            Rectangle {
                id: rectangle3
                width: 165
                height: 2
                color: "#ffffff"
                anchors.topMargin: 30
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 0
            }
            font.underline: false
        }

        Text {
            id: ipaddresslabel
            x: 26
            color: "#ffffff"
            text: qsTr("IpAddress :")
            anchors.topMargin: 50
            anchors.left: parent.left
            font.pixelSize: 16
            horizontalAlignment: Text.AlignHCenter
            anchors.top: passwordlabel.bottom
            anchors.leftMargin: 30
            font.family: "Courier"
        }
    }
}





