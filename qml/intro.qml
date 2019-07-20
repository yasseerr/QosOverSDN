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
        width: 276
        height: 60
        property int animOffset: -5
        color: "#b49527"
        text: qsTr("QosOverSdn")
        anchors.verticalCenterOffset: -129
        anchors.horizontalCenterOffset: 0
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

    Text {
        id: namelabel
        x: 30
        y: 150
        color: "#ffffff"
        text: qsTr("UserName :")
        anchors.verticalCenterOffset: 0
        anchors.horizontalCenterOffset: -130
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 16
        font.family: "Courier"
    }

    TextInput {
        id: usernameInput
        x: 276
        y: 168
        width: 200
        height: 35
        color: "#f5f3f3"
        anchors.verticalCenterOffset: 1
        anchors.horizontalCenterOffset: 40
        anchors.verticalCenter: parent.verticalCenter
        font.bold: true
        horizontalAlignment: Text.AlignLeft
        font.pixelSize: 17
        anchors.horizontalCenter: parent.horizontalCenter
        selectionColor: "#00801c"
        Rectangle {
            id: rectangle1
            width: 165
            height: 2
            color: "#ffffff"
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.topMargin: 30
            anchors.leftMargin: 0
        }
        font.underline: false
    }

    Text {
        id: passwordlabel
        x: -8
        y: -8
        color: "#ffffff"
        text: qsTr("Password :")
        anchors.horizontalCenterOffset: -140
        anchors.horizontalCenter: parent.horizontalCenter
        horizontalAlignment: Text.AlignHCenter
        anchors.top: namelabel.bottom
        font.pixelSize: 16
        anchors.topMargin: 30
        font.family: "Courier"
    }

    TextInput {
        id: passwordInput
        x: 78
        width: 200
        height: 34
        color: "#f5f3f3"
        anchors.top: usernameInput.bottom
        anchors.topMargin: 21
        anchors.horizontalCenterOffset: 40
        anchors.horizontalCenter: parent.horizontalCenter
        font.bold: true
        echoMode: TextInput.Password
        horizontalAlignment: Text.AlignLeft
        font.pixelSize: 17
        selectionColor: "#00801c"
        Rectangle {
            id: rectangle3
            width: 165
            height: 2
            color: "#ffffff"
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.topMargin: 30
            anchors.leftMargin: 0
        }
        font.underline: false
    }


}



/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:1;anchors_height:200;anchors_width:200;anchors_x:197;anchors_y:124}
D{i:10;anchors_y:-8}
}
 ##^##*/
