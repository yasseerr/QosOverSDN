import QtQuick 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Styles 1.4
import "./"
//TODO : create combo box for ios types
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
    opacity: 1
    clip: true
    Rectangle {
        id: rootContent
        color: "#ee1c1a1a"
        opacity: 1
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
        TextInput {
            id: usernameInput
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


        Text {
            id: passwordlabel
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


        TextInput {
            id: passwordInput
            width: 200
            height: 34
            color: "#f5f3f3"
            echoMode: TextInput.Password
            anchors.top: usernameInput.bottom
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
            id: secretlabel
            x: 0
            y: 0
            color: "#ffffff"
            text: qsTr("Secret  :")
            anchors.left: parent.left
            horizontalAlignment: Text.AlignHCenter
            anchors.leftMargin: 30
            font.pixelSize: 16
            anchors.top: passwordlabel.bottom
            font.family: "Courier"
            anchors.topMargin: 50
        }

        TextInput {
            id: secretInput
            x: 0
            y: 0
            width: 200
            height: 34
            color: "#f5f3f3"
            anchors.top: passwordInput.bottom
            echoMode: TextInput.Password
            font.bold: true
            anchors.leftMargin: 20
            font.underline: false
            anchors.left: passwordlabel.right
            font.pixelSize: 17
            horizontalAlignment: Text.AlignLeft
            selectionColor: "#00801c"
            anchors.topMargin: 30
            Rectangle {
                id: rectangle4
                width: 165
                height: 2
                color: "#ffffff"
                anchors.left: parent.left
                anchors.leftMargin: 0
                anchors.top: parent.top
                anchors.topMargin: 30
            }
        }


        Text {
            id: ipaddresslabel
            x: 26
            color: "#ffffff"
            text: qsTr("IpAddress Manager :")
            anchors.topMargin: 50
            anchors.left: parent.left
            font.pixelSize: 16
            horizontalAlignment: Text.AlignHCenter
            anchors.top: secretlabel.bottom
            anchors.leftMargin: 30
            font.family: "Courier"
        }

        TextInput {
            id: adressInput
            width: 200
            height: 36
            color: "#f5f3f3"
            anchors.top: secretInput.bottom
            anchors.topMargin: 30
            anchors.left: ipaddresslabel.right
            font.pixelSize: 17
            horizontalAlignment: Text.AlignLeft
            selectionColor: "#00801c"
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
                color: nextButton.hovered?Qt.lighter("#1a1818"):"#1a1818"
            }
            onClicked : {
                pingingPopup.open()
                dialogRef.onAddRouterClicked(adressInput.text,usernameInput.text,passwordInput.text,
                                             secretInput.text,osComboBox.currentText)
            }
        }

        ComboBox {
            id: osComboBox
            x: 70
            width: 207
            height: 42
            displayText: "OS : "+currentText
            model: ["ios","iosxr","junos","eos","nxos"]
            anchors.top: adressInput.bottom
            anchors.topMargin: 20

        }



    }
    LoadingPopup{
        id:pingingPopup
    }
}


























/*##^## Designer {
    D{i:16;anchors_y:310}
}
 ##^##*/
