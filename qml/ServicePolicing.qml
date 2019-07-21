import QtQuick 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Styles 1.4
import "./"

Rectangle {
    id: rootRectangle
    color: "#f5f5f5"

    border.color: "#95989a"







    Text {
        id: matchInpytInterface
        x: 30
        y: 150
        color: "#0d0000"
        text: qsTr("Match interface  : ")
        font.capitalization: Font.SmallCaps
        anchors.left: parent.left
        horizontalAlignment: Text.AlignHCenter
        anchors.top: parent.top
        font.pixelSize: 16
        anchors.topMargin: 100
        anchors.leftMargin: 30
        font.family: "Courier"
    }

    ComboBox {
        id: comboBoxInterface
        x: 243
        y: 156
        width: 202
        height: 34
        font.pointSize: 10
        font.bold: true
        focusPolicy: Qt.NoFocus
        anchors.verticalCenterOffset: 0
        anchors.verticalCenter: matchInpytInterface.verticalCenter
        model: ["FastEthernet","GigabitEthernet","Serial"]
        displayText: currentText
        Rectangle {
            id: rectangle
            y: 9
            width: 102
            height: 70
            color: "#ffffff"
            radius: 4
            anchors.left: parent.left
            anchors.leftMargin: 204
            anchors.verticalCenterOffset: 0
            anchors.verticalCenter: parent.verticalCenter
        }

        Tumbler {
            id: tumbler2
            x: 632
            y: 50
            width: 60
            height: 68
            spacing: 0
            currentIndex: 2
            visibleItemCount: 3
            model: 10
            font.bold: true
            focusPolicy: Qt.ClickFocus
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: 1
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: 175
        }

        Tumbler {
            id: tumbler1
            x: 145
            y: -38
            width: 47
            height: 68
            visibleItemCount: 3
            anchors.horizontalCenterOffset: 123
            anchors.horizontalCenter: parent.horizontalCenter
            model: 10
            font.bold: true
            font.pointSize: 10
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: 1
        }

        Rectangle {
            id: rectangle3
            x: 228
            y: 12
            width: 0
            height: 18
            color: "#000000"
            anchors.right: tumbler2.left
            anchors.rightMargin: -1
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: tumbler2.horizontalCenter
            anchors.horizontalCenterOffset: -30
        }
    }

    Item {
        id: radioButtons
        width: 200
        height: 88
        anchors.top: parent.top
        anchors.topMargin: 158
        anchors.left: parent.left
        anchors.leftMargin: 30
        anchors.verticalCenterOffset: -38
        anchors.verticalCenter: parent.verticalCenter

        RadioButton {
            id: inputcontrol
            width: 131
            height: 38
            text: qsTr("RadioButton")
            checkable: true
            anchors.left: parent.left
            anchors.leftMargin: 0
            checked: true

            indicator: Rectangle {
                implicitWidth: 26
                implicitHeight: 26
                x: inputcontrol.leftPadding
                y: parent.height / 2 - height / 2
                radius: 13
                border.color: "#000000"

                Rectangle {
                    width: 14
                    height: 14
                    color: "#000000"
                    x: 6
                    y: 6
                    radius: 7
                    visible: inputcontrol.checked
                }
            }

            contentItem: Text {
                color: "#020202"
                font: inputcontrol.font
                opacity: enabled ? 1.0 : 0.3
                text: "INPUTE"

                style: Text.Normal
                styleColor: "#090000"

                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                verticalAlignment: Text.AlignVCenter
                leftPadding: inputcontrol.indicator.width + inputcontrol.spacing
            }
        }

        RadioButton {
            id: outpucontrol
            x: 1
            y: 44
            width: 131
            height: 38
            text: qsTr("RadioButton")
            anchors.left: parent.left
            contentItem: Text {
                color: "#020202"
                text: "OUTPUT"

                opacity: enabled ? 1.0 : 0.3
                anchors.verticalCenter: parent.verticalCenter
                leftPadding: outpucontrol.indicator.width + outpucontrol.spacing
                anchors.horizontalCenter: parent.horizontalCenter
                styleColor: "#090000"
                verticalAlignment: Text.AlignVCenter
                font: outpucontrol.font

                style: Text.Normal
            }
            checked: false
            indicator: Rectangle {
                x: outpucontrol.leftPadding
                y: parent.height / 2 - height / 2
                radius: 13
                implicitWidth: 26
                implicitHeight: 26
                border.color: "#000000"
                Rectangle {
                    x: 6
                    y: 6
                    width: 14
                    height: 14
                    color: "#000000"
                    radius: 7
                    visible: outpucontrol.checked
                }
            }
            anchors.leftMargin: 0
        }
    }

    Item {
        id: element1
        x: 0
        y: 252
        width: 298
        height: 111

        Text {
            id: matchInpytInterface1
            color: "#0d0000"
            text: qsTr("policy-map name :")
            anchors.left: parent.left
            anchors.leftMargin: 30
            anchors.top: parent.top
            anchors.topMargin: 47
            anchors.verticalCenter: parent.verticalCenter
            font.capitalization: Font.SmallCaps
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 16
            font.family: "Courier"
        }

        ComboBox {
            id: comboBoxPolicy
            y: 156
            width: 202
            height: 40
            font.pointSize: 10
            font.bold: true
            anchors.left: parent.left
            anchors.leftMargin: 243
            anchors.verticalCenter: parent.verticalCenter
            textRole: "name"
            model: policiesModel
            displayText: currentText
        }
    }



    Button {
        id: controls
        x: 30
        y: 383
        text: qsTr("Button")
        onClicked:  mainForm.applyServicePolicingToRouter(parseInt(comboBoxRouterId.currentText),comboBoxInterface.currentText,
                                                         tumbler1.currentIndex,tumbler2.currentIndex,
                                                          outpucontrol.checked?"output":"input",comboBoxPolicy.currentText)

        contentItem: Text {
            color: "#060606"
            font: inputcontrol.font
            opacity: enabled ? 1.0 : 0.3
            text: "APLAY"



            renderType: Text.QtRendering
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }

        background: Rectangle {
            implicitWidth: 100
            implicitHeight: 40
            opacity: enabled ? 1 : 0.3
            border.color: inputcontrol.down ? "#17a81a" : "#21be2b"
            border.width: 1
            radius: 2
        }
    }

    Text {
        id: routertLabel
        x: 38
        y: 150
        color: "#0d0000"
        text: qsTr("Router :")
        anchors.leftMargin: 30
        anchors.top: parent.top
        font.capitalization: Font.SmallCaps
        font.pixelSize: 16
        anchors.topMargin: 31
        horizontalAlignment: Text.AlignHCenter
        anchors.left: parent.left
        font.family: "Courier"
    }

      ComboBox {
          id: comboBoxRouterId
          x: 243
          y: 151
          width: 202
          height: 34
          textRole: "deviceId"
          model: deviceModel
          anchors.verticalCenter: matchInpytInterface.verticalCenter
          font.pointSize: 10
          displayText: currentText
          focusPolicy: Qt.NoFocus
          font.bold: true
          anchors.verticalCenterOffset: -69
      }



}













































































































/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:3;anchors_x:200;anchors_y:156}D{i:2;anchors_x:200;anchors_y:156}
D{i:7;anchors_x:30;anchors_y:147}D{i:17;anchors_x:30;anchors_y:150}D{i:18;anchors_x:243;anchors_y:156}
D{i:23;anchors_x:200;anchors_y:156}
}
 ##^##*/
