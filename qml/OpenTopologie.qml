import QtQuick 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Styles 1.4
import "./"
Item {
    id:root
    //anchors.fill: parent
    visible: true
    ListView {
        id: filesListView
        x: 8
        width: 180
        height: 200
        anchors.top: parent.top
        anchors.topMargin: 50
        focus: true

        contentWidth: width
        delegate: Item {
            id: element
            x: 5
            width: 300
            height: 40

            Rectangle{
                anchors.fill: parent
                color: delegateMA.containsMouse?"#aaaaaa":"#fff"
                border.color: control.down ? "#17a81a" : "#21be2b"

            }

            Image {
                id: image

                width: 20
                height:20
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 10
                fillMode: Image.PreserveAspectFit
                source: "../assets/No.png"
        //TODO add function yasser
                MouseArea{
                    id : delegateMANO
                    hoverEnabled: true
                    anchors.fill: parent
                    onClicked: {
                        //mainForm.drawTopologie(fileNameText.text)
                        console.log("we are in the image baby !!!")
                    }
                }
            }






            MouseArea{
                id : delegateMA
                anchors.rightMargin: 30
                hoverEnabled: true
                anchors.fill: parent
                onClicked: mainForm.drawTopologie(fileNameText.text)
            }


            Row {
                id: row1
                Text {
                    id: fileNameText
                    text: name
                }
            }
        }
        //TODO : Load files from Directory
        model: ListModel {
            ListElement {
                name: "topo1.yaml"
            }

            ListElement {
                name: "topo2.yaml"
            }

            ListElement {
                name: "topo3.yaml"
            }

            ListElement {
                name: "topo4.yaml"
            }
        }


    }

    Item {
        id: menuItem
        height: 38
        anchors.rightMargin: 2
        anchors.leftMargin: -2
        anchors.topMargin: 0
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.right: parent.right
        Rectangle {
            id: menuItemBG
            color: "#ffffff"
            anchors.fill: parent
        }

        Button {
            id: addFileButton
            width: 134
            text: "New File.yaml"
            anchors.left: parent.left
            icon.source: "../assets/test.png"
            background: Rectangle {
                color: addClassButton.hovered?"#ddd":"#fff"
                anchors.fill: parent
            }
            icon.color: "#00000000"
            font.pointSize: 8
            icon.name: "AddClassIcon"
            anchors.top: parent.top
            display: AbstractButton.TextBesideIcon
            hoverEnabled: true
            anchors.bottomMargin: 0
            anchors.topMargin: 0
            anchors.bottom: parent.bottom
            anchors.leftMargin: 0

            onClicked: rootbob.open()
        }
    }

    Popup{
        anchors.centerIn: parent
        id: rootbob
        width: 150
        height: 136


        visible: false
        clip: true
        modal: true
        padding: 4
        Rectangle {
            id: rootContent
            y: 105
            height: 150
            color: "#ee1c1a1a"
            anchors.left: parent.left
            anchors.leftMargin: 74
            anchors.right: parent.right
            anchors.rightMargin: 171
            opacity: 1

            Text {
                id: element1
                width: 114
                height: 14
                color: "#ffffff"
                text: qsTr("Name Of File :")
                anchors.verticalCenterOffset: 0
                anchors.horizontalCenterOffset: -110
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 12
            }

            TextInput {
                id: textInput
                x: 177
                y: 68
                width: 80
                height: 20
                color: "#ffffff"
                selectionColor: "#ffffff"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 12
            }

            Rectangle {
                id: rectangle2
                x: 7
                y: 1
                width: 150
                height: 2
                color: "#ffffff"
                anchors.verticalCenterOffset: 17
                anchors.horizontalCenterOffset: 0
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }
        }




    }


}























































/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:1;anchors_height:200;anchors_width:180;anchors_x:0;anchors_y:129}
D{i:19;anchors_height:150;anchors_width:150;anchors_x:74;anchors_y:105}
}
 ##^##*/
