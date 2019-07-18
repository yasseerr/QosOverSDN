import QtQuick 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.3

Item{

    property var onNextClicked: function(){}
    //property alias qosPolicyName: classNameTextEdit.text
    property alias description: descriptionTextEdit.text
    // property string theMatch: radioButtonAll.checked?"match-all":"match-any"

    id : root
    width: 640
    height: 480

    opacity: 1
    clip: true
    Rectangle {
        id: rootContent
        color: "#ee1c1a1a"
        anchors.rightMargin: 1
        anchors.bottomMargin: 0
        anchors.leftMargin: -1
        anchors.topMargin: 0
        opacity: 1
        anchors.fill: parent

        Text {
            id: policyNamelabel
            x: 30
            y: 150
            width: 190
            height: 30
            color: "#ffffff"
            text: qsTr("Name of Policy * :")
            anchors.verticalCenterOffset: -80
            anchors.verticalCenter: parent.verticalCenter
            font.family: "Courier"
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 16
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

            icon.name : "backgroungimage"
            icon.source: "../assets/Forward arrow.png"
            icon.color: "transparent"

            text: "<font color='#ffffff'>Next</font>"
            hoverEnabled: true
            display: AbstractButton.TextUnderIcon
            anchors.right: parent.right
            anchors.rightMargin: 50
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 50
            background: Rectangle{
                anchors.fill: parent
                color: nextButton.hovered?Qt.lighter("#1a1818"):"#1a1818"
            }
            onClicked: root.onNextClicked()

        }

        Text {
            id: descriptionTextEdit
            width: 143
            height: 30
            color: "#ffffff"
            text: qsTr("discription :")
            anchors.leftMargin: 37
            anchors.topMargin: 67
            horizontalAlignment: Text.AlignHCenter
            lineHeight: 0.6
            font.family: "Courier"
            font.pixelSize: 16
            anchors.left: parent.left
            anchors.top: policyNamelabel.bottom
        }

        TextInput {
            id: textInput
            x: 190
            y: 210
            width: 187
            height: 33
            color: "#ffffff"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: descriptionTextEdit.verticalCenter
            font.pixelSize: 12

            Rectangle {
                id: rectangle2
                x: 10
                y: 38
                width: 200
                height: 2
                color: "#ffffff"
                anchors.leftMargin: 0
                anchors.topMargin: 40
                anchors.top: parent.top
                anchors.left: parent.left
            }
        }

        TextInput {
            id: textInput1
            x: 210
            y: 210
            width: 188
            height: 30
            color: "#ffffff"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenterOffset: 0
            anchors.verticalCenter: policyNamelabel.verticalCenter
            font.pixelSize: 12
            Rectangle {
                id: rectangle3
                x: 10
                y: 38
                width: 200
                height: 2
                color: "#ffffff"
                anchors.leftMargin: 0
                anchors.topMargin: 40
                anchors.top: parent.top
                anchors.left: parent.left
            }
        }

    }
}











































































/*##^## Designer {
    D{i:8;anchors_y:210}
}
 ##^##*/
