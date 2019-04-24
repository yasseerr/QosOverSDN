import QtQuick 2.2

Item {
    id: element
    visible:true
    anchors.fill: parent
    Rectangle {
        id: bgrectangle
        color: "#2d2130"
        anchors.fill: parent
    }

    Text {
        id: title
        x: 275
        y: 220
        property int animOffset: -5
        color: "#b49527"
        text: qsTr("QosOverSdn")
        anchors.verticalCenterOffset: animOffset
        font.family: "Times New Roman"
        font.bold: true
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: parent.width/13
        SequentialAnimation{
            running: true
            loops: -1
            NumberAnimation {
                target: title
                property: "animOffset"
                duration: 1000
                easing.type: Easing.Linear
                from : -5
                to : 0
            }
            NumberAnimation {
                target: title
                property: "animOffset"
                duration: 1000
                easing.type: Easing.Linear
                from : 0
                to : -5
            }
        }

    }


}

/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:1;anchors_height:200;anchors_width:200;anchors_x:197;anchors_y:124}
}
 ##^##*/
