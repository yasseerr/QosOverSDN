import QtQuick 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Styles 1.4

Item {
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
            anchors.topMargin: 100
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
            anchors.rightMargin: 100
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 100
            background: Rectangle {
                anchors.fill: parent
                color: nextButton.hovered?Qt.lighter("#1a1818"):"#1a1818"
            }
            onClicked : {
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
            displayText:currentText
            anchors.left: matchProtocol.right
            anchors.leftMargin: 0
            anchors.topMargin: 90
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
            anchors.top: parent.top
        }

        ComboBox {
            id: osComboBoxPrecedence
            x: 167
            y: 88
            width: 207
            height: 42
            anchors.leftMargin: 0
            displayText:currentText
            anchors.topMargin: 25
            model: ["critical        Match packets with critical precedence (5",
                "routine         Match packets with routine precedence (0)",
                        "network         Match packets with network control precedence (7)",
                        " priority        Match packets with priority precedence (1)",
                        "internet        Match packets with internetwork control precedence (6)",
                        "immediate       Match packets with immediate precedence (2)",
                        "flash-override  Match packets with flash override precedence (4)",
                        "flash           Match packets with flash precedence (3)",
                        ]
            anchors.left: matchProtocol.right
            anchors.top: osComboBoxProtocol.bottom
        }



    }

}


































/*##^## Designer {
    D{i:7;anchors_height:42}
}
 ##^##*/
