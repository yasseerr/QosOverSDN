import QtQuick 2.0
import QtQuick.Controls 2.3

Item {
    id: item1
    Rectangle {
        id: rectangle
        color: "#ffffff"
        anchors.fill: parent
    }

    Item {
        id: classifTopMenuItem
        height: 70
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0

        Rectangle {
            id: rectangle1
            color: "#faf8f8"
            anchors.fill: parent
        }

        Flow {
            id: flow1
            anchors.fill: parent
        }
        Item{
            id  : nanak
            width: 50
            height: width
            MouseArea{
             anchors.fill: parent
             onClicked: {
                console.log("nanak")
             }
            }
        }


    }

}

/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:2;anchors_height:200;anchors_width:200;anchors_x:0;anchors_y:0}
}
 ##^##*/
