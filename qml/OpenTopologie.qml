import QtQuick 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Styles 1.4
import "./"
import Qt.labs.folderlistmodel 2.12
Item {
    id:root
    //anchors.fill: parent
    visible: true
    ListView {
        id: filesListView
        x: 8
        width: 304
        clip: true
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
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
                border.color: delegateMA.containsMouse? "#17a81a" : "#21be2b"

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
                        mainForm.deleteTopologie(fileName)
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
                    text: fileName
                    padding: 5
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                }
            }
        }
        //TODO : Load files from Directory
        model: folderModel

        Rectangle {
            id: rectangle
            color: "#00ffffff"
            border.width: 1
            anchors.fill: parent
        }

        FolderListModel{
            id: folderModel
            nameFilters: ["*.yaml"]
            folder: "../data/topologies"
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
            text: "New Topologie"
            anchors.left: parent.left
            icon.source: "../assets/test.png"
            background: Rectangle {
                color: addFileButton.hovered?"#ddd":"#fff"
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
        id: rootbob
        x: 126
        y: 0
        width: 388
        height: 136
        visible: false
        clip: true
        modal: true
        padding: 4
        Rectangle {
            id: rootContent
            color: "#ee1c1a1a"
            anchors.fill: parent
            opacity: 1



            Rectangle {
                id: rectangle2
                x: 7
                y: 1
                width: 150
                height: 2
                color: "#ffffff"
                anchors.verticalCenterOffset: 13
                anchors.horizontalCenterOffset: 0
                anchors.horizontalCenter: fileNameInput.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }


            Text {
                id: element1
                width: 114
                height: 14
                color: "#ffffff"
                text: qsTr("Name Of Topologie :")
                anchors.left: parent.left
                anchors.leftMargin: 20
                anchors.verticalCenterOffset: 0
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 12
            }

            TextInput {
                id: fileNameInput
                y: 68
                width: 150
                height: 14
                color: "#ffffff"
                text: "test"
                anchors.left: element1.right
                anchors.leftMargin: 20
                selectionColor: "#ffffff"
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 14
            }

            RoundButton {
                id: roundButton
                y: 222
                width: 41
                height: 41
                text: "+"
                anchors.left: fileNameInput.right
                anchors.leftMargin: 10
                anchors.verticalCenter: fileNameInput.verticalCenter
                onClicked: mainForm.addTopologie(fileNameInput.text)
            }
        }




    }


}





































































/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:9;anchors_height:200;anchors_width:200}
D{i:1;anchors_height:200;anchors_width:180;anchors_x:0;anchors_y:129}D{i:19;anchors_x:177}
D{i:20;anchors_x:421}D{i:16;anchors_height:150;anchors_width:150;anchors_x:74;anchors_y:105}
}
 ##^##*/
