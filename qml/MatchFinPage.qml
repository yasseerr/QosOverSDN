import QtQuick 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Styles 1.4

Item {
    property var interfaces: []
    property var destinationsMAC: []
    property var onReturnClicked: function(){}


    id: root
    width: 640
    height: 480
    opacity: 1
    clip: true
    Rectangle {
        id: rootContent
        color: "#ee1c1a1a"
        anchors.rightMargin: 1
        anchors.bottomMargin: 0
        anchors.leftMargin: -1
        anchors.topMargin: 0
        opacity: 1
        anchors.fill: parent

        Text {
            id: matchInpytInterface
            x: 30
            y: 150
            color: "#ffffff"
            text: qsTr("Match input-interface  : ")
            anchors.left: parent.left
            anchors.leftMargin: 30
            anchors.top: parent.top
            anchors.topMargin: 100
            font.family: "Courier"
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 16
        }

        Text {
            id: destationAddress
            color: "#ffffff"
            text: qsTr("Match destination-address:")
            anchors.topMargin: 50
            anchors.left: parent.left
            font.pixelSize: 16
            horizontalAlignment: Text.AlignHCenter
            anchors.top: matchInpytInterface.bottom
            anchors.leftMargin: 30
            font.family: "Courier"
        }

        Button {
            id: nextButton
            x: 440
            y: 370
            width: 100
            height: 50
            opacity: 1
            spacing: 3

            focusPolicy: Qt.WheelFocus

            icon.name: "backgroungimage"
            icon.source: "../assets/Forward arrow.png"
            icon.color: "transparent"

            text: "<font color='#fff'>Finsh</font>"
            hoverEnabled: true
            display: AbstractButton.TextUnderIcon
            anchors.right: parent.right
            anchors.rightMargin: 100
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 60
            background: Rectangle {
                anchors.fill: parent
                color: nextButton.hovered ? Qt.lighter("#1a1818") : "#1a1818"
            }
            onClicked: {

                //pingingPopup.open()
                //dialogRef.onAddRouterClicked(adressInput.text,usernameInput.text,passwordInput.text,
                //                             secretInput.text,osComboBox.currentText)
            }
        }

        Button {
            id: rButton
            x: 90
            y: 330
            width: 100
            height: 50
            opacity: 1
            spacing: 3

            focusPolicy: Qt.WheelFocus

            icon.name: "backgroungimage"
            icon.source: "../assets/returnButton.png"
            icon.color: "transparent"

            text: "<font color='#fff'>Return</font>"
            hoverEnabled: true
            display: AbstractButton.TextUnderIcon
            anchors.right: parent.right
            anchors.rightMargin: 450
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 60
            background: Rectangle {
                anchors.fill: parent
                color: rButton.hovered ? Qt.lighter("#1a1818") : "#1a1818"
            }
            onClicked: {
                onReturnClicked()
                //pingingPopup.open()
                //dialogRef.onAddRouterClicked(adressInput.text,usernameInput.text,passwordInput.text,
                //                             secretInput.text,osComboBox.currentText)
            }
        }

        ComboBox {
            id: osComboBoxInterface
            y: 88
            width: 207
            height: 42
            displayText: currentText
            anchors.left: matchInpytInterface.right
            anchors.leftMargin: 32
            anchors.topMargin: -30
            model: ["your Interface","FastEthernet","GigaEthernet"]
            anchors.top: matchInpytInterface.bottom
        }

        Tumbler {
            id: tumbler1
            anchors.right: parent.right
            anchors.rightMargin: 191
            anchors.left: parent.left
            anchors.leftMargin: 388
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 310
            anchors.top: parent.top
            anchors.topMargin: 50
            model: 10
        }

        TextInput {
            id: textInputAddMac
            width: 221
            height: 36
            color: "#ffffff"
            text: qsTr("|")
            font.family: "Times New Roman"
            anchors.left: parent.left
            anchors.leftMargin: 305
            anchors.top: osComboBoxInterface.bottom
            anchors.topMargin: 30
            font.pixelSize: 12
        }

        Rectangle {
            id: rectangle2
            x: -9
            y: -3
            width: 200
            height: 2
            color: "#ffffff"
            anchors.leftMargin: 305
            anchors.topMargin: 195
            anchors.top: parent.top
            anchors.left: parent.left
        }

        Rectangle {
            id: rectangle3
            x: -2
            width: 1
            height: 18
            color: "#000000"
            anchors.top: parent.top
            anchors.topMargin: 100
            anchors.leftMargin: 0
            anchors.left: tumbler1.right
        }

        Tumbler {
            id: tumbler2
            width: 60
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 310
            anchors.top: parent.top
            anchors.topMargin: 50
            anchors.left: tumbler1.right
            anchors.leftMargin: -5
            model: 10
        }
    }
}




















/*##^## Designer {
    D{i:8;anchors_x:200;anchors_y:156}D{i:9;anchors_height:127;anchors_width:60;anchors_x:430;anchors_y:43}
D{i:10;anchors_x:305;anchors_y:159}D{i:12;anchors_y:"-3"}D{i:13;anchors_height:127;anchors_width:60;anchors_x:430;anchors_y:43}
}
 ##^##*/
