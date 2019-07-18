import QtQuick 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Styles 1.4
import "./"

Rectangle {
    id: rootRectangle
    color: "#f5f5f5"

    border.color: "#95989a"







    Item {
        id: autoQos
        height: 200
        anchors.left: parent.left
        anchors.leftMargin: 0

        Button {
            id: activeAutoQosButton
            width: 153
            height: 34
            display: AbstractButton.TextBesideIcon
            hoverEnabled: true

            icon.name :"AddClassIcon"
            icon.source: "../assets/Yes.png"
            icon.color :"transparent"
            text: "Activer AutoQos"
            anchors.left: parent.left
            anchors.leftMargin: 21
            anchors.top: interfaces.bottom
            anchors.topMargin: 30
            font.pointSize: 8
            background: Rectangle {
                anchors.fill: parent
                color:activeAutoQosButton.hovered?"#ddd":"#fff"
            }
            onClicked: addClassPupup.open()
        }

        Item {
            id: interfaces
            height: 30
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.right: parent.right
            anchors.rightMargin: 340
            anchors.verticalCenterOffset: -50
            anchors.verticalCenter: parent.verticalCenter

            ComboBox {
                id: osComboBoxInterface
                y: 88
                width: 248
                height: 42
                anchors.verticalCenter: parent.verticalCenter
                model: ["FastEthernet","GigaEthernet"]
                anchors.leftMargin: 32
                anchors.topMargin: -30
                displayText: currentText
                anchors.top: matchInpytInterface.bottom
                anchors.left: matchInpytInterface.right
            }

            Rectangle {
                id: rectangle3
                width: 1
                height: 18
                color: "#000000"
                anchors.left: tumbler1.right
                anchors.leftMargin: 0
                anchors.verticalCenter: parent.verticalCenter
            }
        }

        Button {
            id: desectiveAutoQosButton
            width: 145
            height: 34
            text: "DésActiver AutoQos"
            anchors.top: activeAutoQosButton.bottom
            anchors.topMargin: 30
            anchors.left: parent.left
            anchors.leftMargin: 20
            background: Rectangle {
                color: desectiveAutoQosButton.hovered?"#ddd":"#fff"
                anchors.fill: parent
            }
            hoverEnabled: true
            icon.color: "#00000000"
            icon.source: "../assets/No.png"
            icon.name: "AddClassIcon"
            font.pointSize: 8
            display: AbstractButton.TextBesideIcon
        }

        SpinBox {
            id: spin1
            x: 270
            width: 115
            height: 40
            anchors.top: parent.top
            anchors.topMargin: 30
        }

        SpinBox {
            id: spin2
            width: 115
            height: 40
            anchors.left: spin1.right
            anchors.leftMargin: 2
            anchors.top: parent.top
            anchors.topMargin: 29
        }
    }




}



































































/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:2;anchors_x:21;anchors_y:72}D{i:7;anchors_y:33}
D{i:9;anchors_x:270;anchors_y:30}D{i:10;anchors_x:386;anchors_y:30}
}
 ##^##*/
