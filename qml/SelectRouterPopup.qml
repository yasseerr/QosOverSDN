import QtQuick 2.12
import QtQuick.Controls 2.12

Popup {
    id: root
    width: 300
    height: 150
    padding: 1
    modal: true

    property var applyToRouterFunc: function(){}
    property int deviceId: parseInt(comboBox.currentText)
    Rectangle {
        id: rectangle
        color: "#ee1c1a1a"
        anchors.bottomMargin: 0
        anchors.fill: parent
    }

    Button {
        id: applyToRouter
        x: 120
        y: 144
        width: 65
        height: 34
        text: qsTr("Apply")
        anchors.verticalCenterOffset: 20
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter

        onClicked: root.applyToRouterFunc()
    }

    ComboBox{
        id: comboBox
        x: 68
        y: 104
        width: 166
        height: 29
        model: deviceModel
        textRole: "deviceId"
        anchors.horizontalCenterOffset: 0
        anchors.verticalCenterOffset: -20
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
    }


}







/*##^## Designer {
    D{i:1;anchors_height:200;anchors_width:200}
}
 ##^##*/
