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
        id: menuItem
        height: 38
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.top: parent.top

        Rectangle {
            id: menuItemBG
            color: "#ffffff"
            anchors.fill: parent
        }
    }

    Item {
        id: contentItem
        anchors.top: menuItem.bottom
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.topMargin: 0

        Rectangle {
            id: contentBG
            color: "#eeeeee"
            anchors.fill: parent
        }


        GridView {
            id: gridView
            clip: true
            anchors.fill: parent
            anchors.margins: 10
            model : classesModel
            delegate: Item {
                id: element
                x: 5
                height: 170
                width: 170
                Component.onCompleted : console.log(classColor)
                Rectangle {
                    id : backgroundRect
                    anchors.fill: parent
                    color: classColor
                    border.width: 1
                    opacity: 0.8
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Text {
                    text: name
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.bold: true
                }

            }

            cellHeight: 180
            cellWidth: 180
        }

    }

    AddClassPupup{
        id : addClassPupup
        anchors.centerIn: parent
    }

    Item {
        id: autoQos
        height: 200
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.verticalCenter: parent.verticalCenter

        Button {
            id: activeAutoQosButton
            y: 72
            width: 153
            height: 34
            display: AbstractButton.TextBesideIcon
            hoverEnabled: true

            icon.name :"AddClassIcon"
            icon.source: "../assets/Yes.png"
            icon.color :"transparent"
            text: "Activer AutoQos"
            anchors.left: interfaces.right
            anchors.leftMargin: 0
            anchors.verticalCenter: interfaces.verticalCenter
            font.pointSize: 8
            background: Rectangle {
                anchors.fill: parent
                color:activeAutoQosButton.hovered?"#ddd":"#fff"
            }
            onClicked: addClassPupup.open()
        }

        Item {
            id: interfaces
            height: 70
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
                model: ["your Interface","FastEthernet","GigaEthernet"]
                anchors.leftMargin: 32
                anchors.topMargin: -30
                displayText: currentText
                anchors.top: matchInpytInterface.bottom
                anchors.left: matchInpytInterface.right
            }

            Tumbler {
                id: tumbler1
                y: 43
                width: 60
                height: 127
                anchors.left: parent.left
                anchors.leftMargin: 100
                anchors.verticalCenter: parent.verticalCenter
                model: 10
            }

            Rectangle {
                id: rectangle3
                y: "-3"
                width: 1
                height: 18
                color: "#000000"
                anchors.left: tumbler1.right
                anchors.leftMargin: 0
                anchors.verticalCenter: parent.verticalCenter
            }

            Tumbler {
                id: tumbler2
                y: 43
                width: 60
                height: 127
                anchors.verticalCenter: parent.verticalCenter
                model: 10
                anchors.leftMargin: 0
                anchors.left: tumbler1.right
            }
        }

        Button {
            id: desectiveAutoQosButton
            y: 33
            width: 153
            height: 34
            text: "DésActiver AutoQos"
            anchors.left: activeAutoQosButton.right
            anchors.leftMargin: 10
            anchors.verticalCenter: interfaces.verticalCenter
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
    }




}



























































/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:4;anchors_height:200;anchors_width:200}
D{i:8;anchors_height:200;anchors_width:200}D{i:6;anchors_height:140;anchors_width:140;anchors_x:0;anchors_y:0}
D{i:11;anchors_x:378;anchors_y:72}D{i:14;anchors_x:200;anchors_y:156}D{i:15;anchors_height:127;anchors_width:60;anchors_x:430;anchors_y:43}
D{i:16;anchors_x:-2;anchors_y:"-3"}D{i:17;anchors_height:127;anchors_width:60;anchors_x:-9;anchors_y:43}
D{i:13;anchors_width:300;anchors_x:0}D{i:18;anchors_x:452;anchors_y:173}D{i:10;anchors_height:140;anchors_width:140;anchors_x:0;anchors_y:0}
}
 ##^##*/
