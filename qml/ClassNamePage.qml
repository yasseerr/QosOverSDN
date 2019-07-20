import QtQuick 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.3

Item{

    property var onNextClicked: function(){}

    property alias qosClassName: classNameTextEdit.text
    property alias description: descriptionTextEdit.text
    property string theMatch: radioButtonAll.checked?"all":"any"

    id : root
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
            id: classNamelabel
            x: 30
            y: 150
            color: "#ffffff"
            text: qsTr("Name of Class * :")
            anchors.left: parent.left
            anchors.leftMargin: 50
            anchors.top: parent.top
            anchors.topMargin: 100
            font.family: "Courier"
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 16
        }
        TextEdit {
            id: classNameTextEdit
            x: 190
            y: 168
            width: 200
            height: 35
            color: "#f5f3f3"
            anchors.verticalCenterOffset: 10
            font.bold: true
            anchors.verticalCenter: classNamelabel.verticalCenter
            anchors.left: classNamelabel.right
            anchors.leftMargin: 10
            horizontalAlignment: Text.AlignLeft
            font.underline: false
            selectionColor: "#00801c"
            font.pixelSize: 17

            Rectangle {
                id: rectangle1
                width: parent.width
                height: 2
                color: "#ffffff"
                anchors.top: parent.top
                anchors.topMargin: 30
                anchors.left: parent.left
                anchors.leftMargin: 0
            }
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
        ColumnLayout{
            id : matchColumn
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: classNameTextEdit.bottom
            anchors.topMargin: 20
            RadioButton {
                id: radioButtonMany
                text: "match-any  Logical-OR"
                checked: true
                contentItem: Text {
                    id: matchanyRadio
                    height: 30
                    text: parent.text
                    leftPadding: radioButtonMany.indicator.width+radioButtonMany.spacing
                    color: "#ffffff"
                    verticalAlignment: Text.AlignVCenter
                }
            }

            RadioButton {
                id: radioButtonAll
                x: -6
                y: -6
                height: 30
                text: "match-All  Logical-AND"
                contentItem: Text {
                    id: matchAllRadio
                    text: parent.text
                    leftPadding: radioButtonAll.indicator.width+radioButtonAll.spacing
                    color: "#ffffff"
                    verticalAlignment: Text.AlignVCenter
                }
            }
        }

        Text {
            id: discription
            height: 20
            color: "#ffffff"
            text: qsTr("discription :")
            anchors.leftMargin: 50
            anchors.topMargin: 20
            horizontalAlignment: Text.AlignHCenter
            lineHeight: 0.6
            font.family: "Courier"
            font.pixelSize: 16
            anchors.left: parent.left
            anchors.top: matchColumn.bottom
        }

        TextEdit {
            id: descriptionTextEdit
            y: 269
            width: 200
            height: 38
            color: "#f5f3f3"
            anchors.horizontalCenter: classNameTextEdit.horizontalCenter
            selectionColor: "#00801c"
            anchors.verticalCenter: discription.verticalCenter
            font.underline: false
            horizontalAlignment: Text.AlignLeft
            font.bold: true
            font.pixelSize: 17
            Rectangle {
                id: rectangle2
                width: parent.width
                height: 2
                color: "#ffffff"
                anchors.leftMargin: 0
                anchors.topMargin: 30
                anchors.top: parent.top
                anchors.left: parent.left
            }
            anchors.verticalCenterOffset: 10
        }
    }
}




































































