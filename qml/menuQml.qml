import QtQuick 2.9
import QtQuick.Controls 2.2
import "./"

Item {
    id: element
    width: 200
    height: 600

    Rectangle {
        id: bgrectangle
        height: 600
        color: "#2d2130"
        anchors.fill: parent
    }

    Image {
        id: image
        width: 100
        height: width
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        fillMode: Image.PreserveAspectFit
        source: "../assets/logo1.png"
    }

    ScrollView {
        id: scrollView
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        contentHeight: childrenRect.height
        contentWidth: parent.width
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.top: image.bottom
        anchors.topMargin: parent.height/8

        Flow {
            id: flow1
            width: scrollView.width
            height: childrenRect.height
            MenuItem_Q{
                title: "Network Controller"
                subItems: ["connecter a un Network","Actualiser","deconnecter"]
                subItemsFunctions:[exit_from_item,exit_from_item,exit_from_item]
            }
            MenuItem_Q{
                title: "Quality Of Service"
                subItems: ["classification et markage","gestion du congestion","shaping and plocing"]
                subItemsFunctions:[exit_from_item,exit_from_item,exit_from_item]
            }
            MenuItem_Q{
                title: "Topologie"
                subItems: ["affichage","Actualiser"]
                subItemsFunctions:[exit_from_item,exit_from_item]
            }
            MenuItem_Q{
                title: "Deconnecter"
            }
        }
    }

    function exit_from_item(){
        mainForm.exit_app()
    }

}















/*##^## Designer {
    D{i:1;anchors_height:200;anchors_width:200}D{i:2;anchors_width:100}D{i:3;anchors_height:200;anchors_width:200}
}
 ##^##*/
