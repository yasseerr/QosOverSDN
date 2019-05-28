import QtQuick 2.9
import QtQuick.Controls 2.2


Item {
    id: element1
    width: parent.width
    height: childrenRect.height
    clip: true
    property string title: "Title1"
    property var subItems: []
    property var subItemsFunctions: []
    property string iconName: ""
    property var clickOpperation: function(){}
    property bool selected: true
    Item {
        id: header1
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 5
        width: parent.width
        height: titleelement.height
        Rectangle {
            id: bgrectangle
            color: mouseArea1.containsMouse?Qt.lighter("#2D2130"):"#00ffffff"
            anchors.fill: parent
        }
        Text{
            id: titleelement
            color: "#faf7f6"
            text: qsTr(element1.title)
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.right: parent.right
            anchors.rightMargin: 0
            font.bold: true
            anchors.left: parent.left
            anchors.leftMargin: 5
            font.pixelSize: 17
            padding: 10
        }
        MouseArea {
            id: mouseArea1
            hoverEnabled: true
            anchors.fill: parent
            onClicked: {
                element1.selected = !element1.selected
                element1.clickOpperation()
                element1.update()
            }
        }
        Image {
            id: toggleimage
            visible: element1.subItems.length>0
            width: height
            height: titleelement.height/3
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 0
            fillMode: Image.PreserveAspectFit
            source: "../assets/dropdown.png"
            transform: Rotation{
                origin.x : toggleimage.width/2
                origin.y : toggleimage.width/2
                angle: element1.selected?180:0
            }
        }
    }



    Flow{
        id : subFlow
        visible: element1.selected
        height: element1.selected?childrenRect.height:0
        anchors.left: parent.left
        anchors.leftMargin: parent.width/5
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.top: header1.bottom
        anchors.topMargin: 5
    }

    Component.onCompleted: {
        for( var i=0;i<subItems.length;i++){
            var obj1 = itemGenerator.createObject(subFlow)
            obj1.title = subItems[i]
            obj1.subOpp = subItemsFunctions[i]

        }
    }


    Component{
        id : itemGenerator
        Item{
            id:subItemRoot
            property string title : "SubTitle1"
            property var subOpp: function(){}
            width: parent.width
            height: childrenRect.height
            Rectangle {
                id: bgrectangleComp
                color: mouseAreaComponant.containsMouse?Qt.lighter("#2D2130"):"#00ffffff"
                anchors.fill: parent
            }
            Text {
                id: titleComp
                color: "#faf7f6"
                text: qsTr(title)
                padding: 7
                width: parent.width
                font.pixelSize: 14
            }
            MouseArea {
                id: mouseAreaComponant
                hoverEnabled: true
                height: 20
                anchors.fill: titleComp
                onClicked: {
                    subItemRoot.subOpp()
                }
            }
        }
    }



}















/*##^## Designer {
    D{i:2;anchors_x:0;anchors_y:0}D{i:1;anchors_height:200;anchors_width:200}
}
 ##^##*/
