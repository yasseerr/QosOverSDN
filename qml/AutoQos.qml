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
        anchors.top: parent.top
        anchors.topMargin: 150
        anchors.left: parent.left
        anchors.leftMargin: 0

        Button {
            id: activeAutoQosButton
            y: 108
            width: 153
            height: 34
            display: AbstractButton.TextBesideIcon
            hoverEnabled: true

            icon.name :"AddClassIcon"
            icon.source: "../assets/Yes.png"
            icon.color :"transparent"
            text: "APLY AutoQos"
            anchors.left: parent.left
            anchors.leftMargin: 34
            //anchors.top: interfaces.bottom
            anchors.topMargin: 30
            font.pointSize: 8
            background: Rectangle {
                anchors.fill: parent
                color:activeAutoQosButton.hovered?"#ddd":"#fff"
            }
            onClicked: {
                mainForm.applyAutoQos(comboBoxRouter.currentText,comboBoxInterface.currentText,
                                      tumbler1.currentIndex,tumbler2.currentIndex)
            }
        }

        Button {
            id: desectiveAutoQosButton
            width: 145
            height: 34
            text: "Disactivate AutoQos"
            anchors.top: activeAutoQosButton.bottom
            anchors.topMargin: 30
            anchors.left: parent.left
            anchors.leftMargin: 36
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

        ComboBox {
            id: comboBoxInterface
            width: 202
            height: 40
            anchors.left: parent.left
            anchors.leftMargin: 208
            anchors.top: parent.top
            anchors.topMargin: -57
            model: ["FastEthernet","GigaEthernet","Serial"]
            font.bold: true
            focusPolicy: Qt.NoFocus
            font.pointSize: 10
            displayText: currentText
            Rectangle {
                id: rectangle
                y: 9
                width: 96
                height: 56
                color: "#ffffff"
                radius: 5
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                anchors.verticalCenterOffset: 0
                anchors.leftMargin: 204
            }

            Tumbler {
                id: tumbler2
                x: 632
                y: 50
                width: 60
                height: 68
                model: 10
                font.bold: true
                focusPolicy: Qt.ClickFocus
                anchors.verticalCenter: parent.verticalCenter
                anchors.verticalCenterOffset: 1
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 0
                anchors.horizontalCenterOffset: 175
                currentIndex: 2
                visibleItemCount: 3
            }

            Tumbler {
                id: tumbler1
                x: 145
                y: -38
                width: 47
                height: 68
                model: 10
                font.bold: true
                font.pointSize: 10
                anchors.verticalCenter: parent.verticalCenter
                anchors.verticalCenterOffset: 1
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.horizontalCenterOffset: 123
                visibleItemCount: 3
            }

            Rectangle {
                id: rectangle3
                x: 228
                y: 12
                width: 0
                height: 18
                color: "#000000"
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: tumbler2.left
                anchors.horizontalCenter: tumbler2.horizontalCenter
                anchors.horizontalCenterOffset: -30
                anchors.rightMargin: -1
            }
        }

        ComboBox {
            id: comboBoxRouter
            x: 6
            y: -1
            width: 202
            height: 40
            textRole: "deviceId"
            model: deviceModel
            anchors.left: parent.left
            font.bold: true
            font.pointSize: 10
            focusPolicy: Qt.NoFocus
            anchors.top: parent.top
            displayText: currentText
            anchors.topMargin: 29
            anchors.leftMargin: 201
        }
    }

    Text {
        id: matchInpytInterface
        x: 30
        y: 150
        color: "#0d0000"
        text: qsTr("Match interface  : ")
        anchors.left: parent.left
        font.capitalization: Font.SmallCaps
        horizontalAlignment: Text.AlignHCenter
        anchors.top: parent.top
        font.pixelSize: 16
        anchors.topMargin: 100
        anchors.leftMargin: 30
        font.family: "Courier"
    }

    Text {
        id: matchInpytInterface1
        x: 36
        y: 147
        color: "#0d0000"
        text: qsTr("Router")
        anchors.left: parent.left
        font.capitalization: Font.SmallCaps
        horizontalAlignment: Text.AlignHCenter
        anchors.top: parent.top
        font.pixelSize: 16
        anchors.topMargin: 192
        anchors.leftMargin: 30
        font.family: "Courier"
    }




}













































































/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:2;anchors_x:21;anchors_y:72}D{i:4;anchors_y:33}
D{i:6;anchors_height:40;anchors_width:202;anchors_x:217;anchors_y:28}D{i:11;anchors_height:40;anchors_width:202;anchors_x:217;anchors_y:28}
}
 ##^##*/
