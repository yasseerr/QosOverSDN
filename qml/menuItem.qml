import QtQuick 2.9

Item {
    id: element1
    width: parent.width
    height: childrenRect.height
    property string title: "Title1"
    property var subItems: []
    property var subItemsFunctions: []
    property string iconName: ""
    property var clickOpperation: function(){}

    Rectangle {
        id: bgrectangle
        x: 5
        y: 0
        color: "#ffffff"
        anchors.fill: parent
    }

    Text{
        id: titleelement
        text: qsTr(element1.title)
        font.bold: true
        anchors.left: parent.left
        anchors.leftMargin: 5
        font.pixelSize: 20
        padding: 5
    }

    MouseArea {
        id: mouseArea
        width: 100
        height: 100
    }

    Component{
        id : itemGenerator
        Item{
            property string title : "SubTitle1"
            width: parent.width
            height: childrenRect.height
            Text {
                text: qsTr(title)
                padding: 5
                width: parent.width
            }
        }
    }



}

/*##^## Designer {
    D{i:1;anchors_height:200;anchors_width:200}D{i:3;anchors_height:100;anchors_width:100}
}
 ##^##*/
