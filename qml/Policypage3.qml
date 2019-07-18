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

        Item {
            id: element
            width: 600
            height: 262
            anchors.horizontalCenterOffset: 0
            anchors.verticalCenterOffset: -100
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter

            Text {
                id: passwordlabel
                color: "#ffffff"
                text: qsTr(" Set Precedence :")
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                horizontalAlignment: Text.AlignHCenter
                anchors.top: matchProtocol.bottom
                font.pixelSize: 16
                anchors.topMargin: 50
                anchors.leftMargin: 20
                font.family: "Courier"
            }

            ComboBox {
                id: precedenceComboBox
                x: 167
                y: 88
                width: 188
                height: 30
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenterOffset: 2
                model: ["IP Precedence",
                    "critical        Match packets with critical precedence (5",
                    "routine         Match packets with routine precedence (0)",
                    "network         Match packets with network control precedence (7)",
                    "priority        Match packets with priority precedence (1)",
                    "internet        Match packets with internetwork control precedence (6)",
                    "immediate       Match packets with immediate precedence (2)",
                    "flash-override  Match packets with flash override precedence (4)",
                    "flash           Match packets with flash precedence (3)",
                ]
                anchors.verticalCenter: passwordlabel.verticalCenter
                displayText: currentText
            }

            Text {
                id: classmap
                y: 43
                width: 128
                height: 21
                color: "#ffffff"
                text: qsTr("Set dhcp  :")
                anchors.left: parent.left
                anchors.leftMargin: 20
                anchors.verticalCenterOffset: 81
                anchors.verticalCenter: parent.verticalCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 16
                font.family: "Courier"
            }

            ComboBox {
                id: osComboBoxIPDscp
                x: 206
                width: 188
                height: 30
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenterOffset: 0
                anchors.verticalCenter: classmap.verticalCenter
                model: [
                        "IPDSCP",
                       "af11     Match packets with AF11 dscp (001010)",
                      "af12     Match packets with AF12 dscp (001100)",
                      "af13     Match packets with AF13 dscp (001110)",,
                      "af21     Match packets with AF21 dscp (010010)",
                      "af22     Match packets with AF22 dscp (010100)",
                      "af23     Match packets with AF23 dscp (010110)",
                      "af31     Match packets with AF31 dscp (011010)",
                      "af32     Match packets with AF32 dscp (011100)",
                      "af33     Match packets with AF33 dscp (011110)",
                      "af41     Match packets with AF41 dscp (100010)",
                      "af42     Match packets with AF42 dscp (100100)",
                      "af43     Match packets with AF43 dscp (100110)",
                      "cs1      Match packets with CS1(precedence 1) dscp (001000)",
                      "cs2      Match packets with CS2(precedence 2) dscp (010000)",
                      "cs3      Match packets with CS3(precedence 3) dscp (011000)",
                      "cs4      Match packets with CS4(precedence 4) dscp (100000)",
                      "cs5      Match packets with CS5(precedence 5) dscp (101000)",
                      "cs6      Match packets with CS6(precedence 6) dscp (110000)",
                            "cs7      Match packets with CS7(precedence 7) dscp (111000)",
                            "default  Match packets with default dscp (000000)",
                            "ef       Match packets with EF dscp (101110)"]
                displayText: currentText
            }
        }
    }
}






















/*##^## Designer {
    D{i:8;anchors_height:42;anchors_x:200;anchors_y:156}D{i:9;anchors_height:127;anchors_width:60;anchors_x:430;anchors_y:43}
D{i:10;anchors_x:206}
}
 ##^##*/
