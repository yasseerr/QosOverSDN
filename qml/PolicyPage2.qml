import QtQuick 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.3

Item{

    property var onNextClicked: function(){}
    property var onReturnClicked: function(){}
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
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: -6
        anchors.topMargin: 0
        opacity: 1
        anchors.fill: parent

        Text {
            id: classmapnamelabel
            x: 30
            y: 150
            color: "#ffffff"
            text: qsTr("class-map name :")
            anchors.left: parent.left
            anchors.leftMargin: 51
            anchors.top: parent.top
            anchors.topMargin: 47
            font.family: "Courier"
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 16

            ComboBox {
                id: comboBox
                x: 176
                y: -5
                width: 200
                height: 30
                model: ["name Of Class"]
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

        Button {
            id: rButton
            x: 88
            y: 382
            width: 100
            height: 50
            text: "<font color='#fff'>Return</font>"
            anchors.bottom: parent.bottom
            hoverEnabled: true
            anchors.bottomMargin: 48
            spacing: 3
            anchors.rightMargin: 452
            anchors.right: parent.right
            opacity: 1
            icon.color: "#00000000"
            icon.name: "backgroungimage"
            background: Rectangle {
                color: rButton.hovered?Qt.lighter("#1a1818"):"#1a1818"
                anchors.fill: parent
            }
            icon.source: "../assets/returnButton.png"
            display: AbstractButton.TextUnderIcon
            focusPolicy: Qt.WheelFocus

            onClicked: root.onReturnClicked()
        }

        Item {
            id: radioButtons
            x: 38
            y: 94
            width: 559
            height: 266

            RadioButton {
                id: radioButton1
                x: 7
                y: 21
                text: qsTr("Radio Button")

                SpinBox {
                    id: spinBox2
                    height: 30
                    editable: true
                    anchors.verticalCenterOffset: 0
                    anchors.top: parent.top
                    anchors.topMargin: 5
                    anchors.left: parent.left
                    anchors.leftMargin: 303
                    anchors.right: parent.right
                    anchors.rightMargin: -325
                    anchors.verticalCenter: parent.verticalCenter
                    font.pointSize: 8
                    spacing: -2
                    to: 20000
                    from: 8
                    value: 8
                }

                Text {
                    id: bandwidthKps
                    x: 67
                    y: 3
                    width: 217
                    height: 21
                    color: "#ffffff"
                    text: qsTr("Bandwidth :")
                    topPadding: -2
                    lineHeight: 0.2
                    font.pixelSize: 16
                    anchors.leftMargin: 36
                    anchors.topMargin: 20
                    horizontalAlignment: Text.AlignHCenter
                    font.family: "Courier"
                    anchors.top: classmapnamelabel.bottom
                    anchors.left: parent.left
                }

                Text {
                    id: descriptionTextEdit
                    x: 74
                    y: 24
                    width: 217
                    height: 21
                    color: "#ffffff"
                    text: qsTr("Kilo Bits per second")
                    topPadding: -4
                    font.capitalization: Font.Capitalize
                    fontSizeMode: Text.VerticalFit
                    anchors.leftMargin: 29
                    anchors.topMargin: 0
                    horizontalAlignment: Text.AlignHCenter
                    lineHeight: 0.2
                    font.family: "Courier"
                    font.pixelSize: 6
                    anchors.left: parent.left
                    anchors.top: bandwidthKps.bottom
                }


            }

            RadioButton {
                id: radioButton2
                x: 7
                y: 102
                text: qsTr("Radio Button")

                Text {
                    id: bandwidthpercent
                    x: 42
                    y: 6
                    width: 237
                    height: 30
                    color: "#ffffff"
                    text: qsTr("Bandwidth :")
                    font.pixelSize: 16
                    lineHeight: 0.2
                    horizontalAlignment: Text.AlignHCenter

                    Text {
                        id: descriptionTextEdit1
                        x: 11
                        width: 217
                        height: 21
                        color: "#ffffff"
                        text: qsTr(" % of total Bandwidth")
                        lineHeight: 0.2
                        font.pixelSize: 6
                        anchors.leftMargin: 0
                        anchors.topMargin: 25
                        horizontalAlignment: Text.AlignHCenter
                        font.family: "Courier"
                        anchors.top: parent.top
                        anchors.left: parent.left
                        fontSizeMode: Text.VerticalFit
                        font.capitalization: Font.Capitalize
                        topPadding: -4
                    }

                    SpinBox {
                        id: spinBox1
                        width: 130
                        height: 30
                        editable: true
                        anchors.top: parent.top
                        anchors.topMargin: 0
                        anchors.left: parent.left
                        anchors.leftMargin: 261
                        anchors.verticalCenterOffset: 0
                        anchors.verticalCenter: parent.verticalCenter
                        to: 75
                    }
                    font.family: "Courier"
                    topPadding: -2
                }
            }

            RadioButton {
                id: radioButton3
                x: 7
                y: 183
                text: qsTr("Radio Button")

                Text {
                    id: bandwidthpercent1
                    x: 21
                    width: 217
                    color: "#ffffff"
                    text: qsTr("Bandwidth :")
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 18
                    anchors.top: parent.top
                    anchors.topMargin: 2
                    lineHeight: 0.2
                    font.pixelSize: 16
                    horizontalAlignment: Text.AlignHCenter
                    font.family: "Courier"
                    topPadding: -2
                }

                Text {
                    id: descriptionTextEdit2
                    x: 47
                    y: 28
                    width: 217
                    height: 21
                    color: "#ffffff"
                    text: qsTr(" % of the remaining bandwidth")
                    font.pixelSize: 6
                    lineHeight: 0.2
                    horizontalAlignment: Text.AlignHCenter
                    font.family: "Courier"
                    fontSizeMode: Text.Fit
                    font.capitalization: Font.Capitalize
                    topPadding: -4
                }

                SpinBox {
                    id: spinBox
                    x: 304
                    y: -4
                    height: 30
                    editable: true
                    anchors.verticalCenterOffset: 0
                    anchors.verticalCenter: parent.verticalCenter
                    to: 75
                }
            }
        }

    }

}

















































































/*##^## Designer {
    D{i:1;anchors_y:210}
}
 ##^##*/
