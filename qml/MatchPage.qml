import QtQuick 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Styles 1.4

Item {

    property alias protocoles : addedListView.model
    property var onNextClicked: function(){}

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
            text: qsTr("Precedence :")
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
            height: 30
            anchors.verticalCenter: matchProtocol.verticalCenter
            displayText:currentText
            anchors.left: matchProtocol.right
            anchors.leftMargin: 6
            model: ["arp     IP ARP",
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
            id: precedenceComboBox
            x: 167
            y: 88
            width: 188
            height: 30
            anchors.verticalCenter: passwordlabel.verticalCenter
            anchors.leftMargin: 0
            displayText:currentText
            model: ["critical        Match packets with critical precedence (5",
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
            anchors.leftMargin: 62
            anchors.top: parent.top
            anchors.topMargin: 54
            anchors.bottom: nextButton.top
            anchors.bottomMargin: 50
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

        RoundButton {
            id: roundButton
            x: 151
            width: 70
            height: 70
            text: "Add"
            anchors.top: precedenceComboBox.bottom
            anchors.topMargin: 42
            anchors.right: precedenceComboBox.left
            anchors.rightMargin: -25
            onClicked: {
                var addedMatch = {
                     "protocole" :protocoleComboBox.currentText.split(" ")[0],
                     "precedence" :precedenceComboBox.currentText.split(" ")[0]
                }
                addedListView.model.append(addedMatch)
                addedListView.model.sync()

            }
        }



    }

}
















































/*##^## Designer {
    D{i:7;anchors_height:42}D{i:8;anchors_height:227;anchors_width:182;anchors_x:440;anchors_y:87}
D{i:15;anchors_y:224}
}
 ##^##*/
