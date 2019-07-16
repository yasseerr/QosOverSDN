import QtQuick 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Styles 1.4

Item {
    property var interfaces: []
    property var destinationsMAC: []

    id: root
    width: 640
    height: 480
    opacity: 1
    clip: true
    Rectangle {
        id: rootContent
        color: "#ee1c1a1a"
        opacity: 1
        anchors.fill: parent

        Text {
            id: matchProtocol
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
            id: precedence
            color: "#ffffff"
            text: qsTr("Match destination-address:")
            anchors.topMargin: 50
            anchors.left: parent.left
            font.pixelSize: 16
            horizontalAlignment: Text.AlignHCenter
            anchors.top: matchProtocol.bottom
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

                //pingingPopup.open()
                //dialogRef.onAddRouterClicked(adressInput.text,usernameInput.text,passwordInput.text,
                //                             secretInput.text,osComboBox.currentText)
            }
        }

        ComboBox {
            id: osComboBoxProtocol
            y: 88
            width: 207
            height: 42
            displayText: currentText
            anchors.left: matchProtocol.right
            anchors.leftMargin: 32
            anchors.topMargin: 90
            model: ["Les Interfaces"]
            anchors.top: parent.top
        }

        ComboBox {
            id: osComboBoxdestinationaddress
            width: 207
            height: 42
            anchors.leftMargin: 21
            displayText: currentText
            anchors.topMargin: 25
            model: ["Mac Address"]
            anchors.left: precedence.right
            anchors.top: osComboBoxProtocol.bottom
        }

        Tumbler {
            id: tumbler
            x: 550
            y: 59
            width: 60
            height: 127
            model: 10
        }
    }
}






/*##^## Designer {
    D{i:8;anchors_x:200;anchors_y:156}
}
 ##^##*/
