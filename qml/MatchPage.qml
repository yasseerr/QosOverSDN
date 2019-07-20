import QtQuick 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Styles 1.4

Item {

    property alias protocoles : addedListView.model
    property alias precedence : precedenceComboBox.selectedPrecedence
    property alias dscp : comboBoxIPDscp.selectedDscp
    property var onNextClicked: function(){}
    property var onReturnClicked: function(){}

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
            text: qsTr("Match-Protocol : ")
            anchors.left: parent.left
            anchors.leftMargin: 30
            anchors.top: parent.top
            anchors.topMargin: 90
            font.family: "Courier"
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 16
        }


        Text {
            id: passwordlabel
            color: "#ffffff"
            text: qsTr(" IP Precedence :")
            anchors.topMargin: 50
            anchors.left: parent.left
            font.pixelSize: 16
            horizontalAlignment: Text.AlignHCenter
            anchors.top: matchProtocol.bottom
            anchors.leftMargin: 18
            font.family: "Courier"
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

            text: "<font color='#fff'>Next</font>"
            hoverEnabled: true
            display: AbstractButton.TextUnderIcon
            anchors.right: parent.right
            anchors.rightMargin: 50
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 50
            background: Rectangle {
                anchors.fill: parent
                color: nextButton.hovered?Qt.lighter("#1a1818"):"#1a1818"
            }
            onClicked : {
                onNextClicked()
                //pingingPopup.open()
                //dialogRef.onAddRouterClicked(adressInput.text,usernameInput.text,passwordInput.text,
                //                             secretInput.text,osComboBox.currentText)
            }
        }

        ComboBox {
            id: protocoleComboBox
            y: 88
            width: 182
            height: 32
            anchors.verticalCenter: matchProtocol.verticalCenter
            displayText:currentText
            anchors.left: matchProtocol.right
            anchors.leftMargin: 6
            model: [
                "arp     IP ARP",
                "bgp     Border Gateway Protocol",
                "cdp     Cisco Discovery Protocol",
                "dhcp    Dynamic Host Configuration",
                "dns     Domain Name Server lookup",
                "eigrp   Enhanced Interior Gateway Routing Protocol",
                "ftp     File Transfer Protocol",
                "gre     Generic Routing Encapsulation",
                "h323    H323 Protocol",
                "http    World Wide Web traffic",
                "icmp    ICMP",
                "ip      IP",
                "ipsec   IP Security Protocol (ESP/AH)",
                "ipv6    IPV6",
                "ntp     Network Time Protocol",
                "ospf    Open Shortest Path First",
                "pop3    Post Office Protocol",
                "rip     Routing Information Protocol",
                "rtp     Real Time Protocol",
                "skinny  Skinny Call Control Protocol",
                "smtp    Simple Mail Transfer Protocol",
                "snmp    Simple Network Management Protocol"]
        }

        ComboBox {
            property string selectedPrecedence: currentText.split(" ")[0]
            id: precedenceComboBox
            x: 167
            y: 88
            width: 188
            height: 32
            anchors.verticalCenter: passwordlabel.verticalCenter
            anchors.leftMargin: 0
            displayText:currentText
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
            anchors.left: matchProtocol.right
        }

        ListView {
            id: addedListView
            spacing: 0
            anchors.left: protocoleComboBox.right
            anchors.leftMargin: 86
            anchors.top: parent.top
            anchors.topMargin: 54
            anchors.bottom: nextButton.top
            anchors.bottomMargin: 71
            anchors.right: parent.right
            anchors.rightMargin: 8
            header: Text {
                id: headerText
                text: qsTr("Added Protocoles : ")
                font.bold: true
                padding: 5
                color: "#ffffff"
            }
            delegate: Item {
                x: 5
                width: 80
                height: 40
                Row {
                    id: row1
                    spacing: 10
                    Rectangle {
                        width: 5
                        height: 20
                        color: "#ffffff"
                    }

                    Text {
                        text: protocole
                        font.bold: true
                        color: "#ffffff"
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
            }
            model: ListModel{

            }
        }

        Button {
            id: roundButtonAdd
            x: 391
            width: 30
            height: 30
            text: "+"
            anchors.left: protocoleComboBox.right
            anchors.leftMargin: 5
            clip: false
            scale: 1
            rotation: 0
            anchors.top: parent.top
            anchors.topMargin: 85
            onClicked: {
                var addedMatch = {
                    "protocole" :protocoleComboBox.currentText.split(" ")[0]
                }
                addedListView.model.append(addedMatch)
            }
        }

        Button {
            id: rButton
            x: 88
            y: 382
            width: 100
            height: 50
            text: "<font color='#fff'>Return</font>"
            icon.color: "#00000000"
            icon.source: "../assets/returnButton.png"
            anchors.bottomMargin: 48
            focusPolicy: Qt.WheelFocus
            anchors.rightMargin: 452
            anchors.bottom: parent.bottom
            display: AbstractButton.TextUnderIcon
            opacity: 1
            background: Rectangle {
                color: rButton.hovered?Qt.lighter("#1a1818"):"#1a1818"
                anchors.fill: parent
            }
            anchors.right: parent.right
            hoverEnabled: true
            spacing: 3
            icon.name: "backgroungimage"

            onClicked : {
                onReturnClicked()
                //pingingPopup.open()
                //dialogRef.onAddRouterClicked(adressInput.text,usernameInput.text,passwordInput.text,
                //                             secretInput.text,osComboBox.currentText)
            }
        }

        Text {
            id: classmap
            x: -9
            color: "#ffffff"
            text: qsTr("Match IP dscp  :")
            anchors.left: parent.left
            font.pixelSize: 16
            anchors.top: passwordlabel.bottom
            anchors.topMargin: 90
            horizontalAlignment: Text.AlignHCenter
            font.family: "Courier"
            anchors.leftMargin: 35
        }

        ComboBox {
            property string selectedDscp: currentText.split(" ")[0]
            id: comboBoxIPDscp
            x: 206
            width: 207
            height: 36
            model: [
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
            anchors.left: classmap.right
            anchors.top: precedenceComboBox.bottom
            anchors.topMargin: 78
            displayText: currentText
            anchors.leftMargin: 25
        }

        Button {
            id: roundButtonSub
            x: 427
            y: 4
            width: 30
            height: 30
            text: "-"
            rotation: 0
            anchors.leftMargin: 5
            anchors.topMargin: 85
            anchors.top: parent.top
            anchors.left: roundButtonAdd.right
            scale: 1
            clip: false
        }



    }

}






























































/*##^## Designer {
    D{i:7;anchors_height:42}D{i:8;anchors_height:227;anchors_width:182;anchors_x:440;anchors_y:87}
D{i:15;anchors_y:224}D{i:20;anchors_y:224}
}
 ##^##*/
