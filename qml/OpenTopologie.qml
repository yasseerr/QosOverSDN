import QtQuick 2.0

Item {
    id:root
    //anchors.fill: parent
    visible: true
    ListView {
        id: filesListView
        x: 0
        y: 0
        width: 110
        height: 160
        anchors.fill: parent
        delegate: Item {
            x: 5
            width: 80
            height: 40
            Rectangle{
                anchors.fill: parent
                color: delegateMA.containsMouse?"#aaaaaa":"#fff"
            }
            MouseArea{
                id : delegateMA
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


}











/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
