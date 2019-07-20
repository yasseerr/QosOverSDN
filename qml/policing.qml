import QtQuick 2.4
import QtQuick.Controls.Material 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Styles 1.4
import "./"

Rectangle {
    id: rootRectangle
    color: "#f5f5f5"
    border.color: "#95989a"

    Item {
        id: menuItem
        height: 38
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.top: parent.top

        Rectangle {
            id: menuItemBG
            color: "#ffffff"
            anchors.fill: parent
        }

        Button {
            id: addPolicyButton
            width: 105
            display: AbstractButton.TextBesideIcon
            hoverEnabled: true
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0

            icon.name :"AddClassIcon"
            icon.source: "../assets/test.png"
            icon.color :"transparent"
            text: "New Policy"
            font.pointSize: 8
            background: Rectangle {
                anchors.fill: parent
                color:addPolicyButton.hovered?"#ddd":"#fff"
            }
            onClicked: addPolicyPupup.open()
        }
        Button {
            id: refreshButton
            hoverEnabled: true
            anchors.left: addPolicyButton.right
            anchors.leftMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0

            anchors.top: parent.top
            anchors.topMargin: 0
            width: 100
            icon.name :"AddClassIcon"
            icon.source: "../assets/icon2.png"
            icon.color :"transparent"
            text: "Reload"
            font.pointSize: 8
            background: Rectangle {
                anchors.fill: parent
                color:refreshButton.hovered?"#ddd":"#fff"
            }
        }
    }

    Item {
        id: contentItem
        anchors.top: menuItem.bottom
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.topMargin: 0

        Rectangle {
            id: contentBG
            color: "#eeeeee"
            anchors.fill: parent
        }



        PolicyPopup{
            id : addPolicyPupup
            anchors.centerIn: parent
        }

        GridView {
            id: gridView
            clip: true
            anchors.fill: parent
            anchors.margins: 10
            model : policiesModel
            delegate:QosPolicyDelegate{
                name_p: name
                description_p: description
                className_p: className
                bandwidthKb_p: bandwidthKb
                bandwidthPercent_p: bandwidthPercent
                bandwidthRemaining_p: bandwidthRemaining
                precedence_p: precedence
                dscp_p: dscp
            }
            cellHeight: 180
            cellWidth: 180
        }

    }
    Connections{
        target: policiesModel
        onUpdateModelSig:{
            gridView.model = 0
            gridView.update()
            gridView.model = policiesModel
            gridView.update()
        }
    }


}



























































/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:8;anchors_height:200;anchors_width:200}
D{i:10;anchors_height:140;anchors_width:140;anchors_x:0;anchors_y:0}
}
 ##^##*/
