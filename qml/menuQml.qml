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
        color: "#504064"
        anchors.fill: parent
    }

    Image {
        id: image
        width: 200
        height: width
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        fillMode: Image.PreserveAspectFit
        source: "../assets/logo2.png"
    }

    ScrollView {
        id: scrollView
        clip :true
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        contentHeight: flow1.height
        contentWidth: parent.width
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.top: image.bottom
        anchors.topMargin: 0

        Flow {
            id: flow1
            width: scrollView.width
            height: childrenRect.height
            MenuItem_Q{
                title: "Topologio"
                subItems: ["Aficher La Topologie","Ajouter Router","deconnecter"]
                subItemsFunctions:[displayTopologie,addRouter,exit_from_item]
            }
            MenuItem_Q{
                title: "Quality Of Service"
                subItems: ["Classification and Markage","Policing","shaping","Gestion du congestion"]
                subItemsFunctions:[displayClassification,exit_from_item,exit_from_item]
            }
            MenuItem_Q{
                title: "AutoQos"
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
    function displayTopologie(){
        mainForm.displayTopologie()
    }
    function displayClassification(){
        mainForm.displayClassification()
    }
    function addRouter(){
        mainForm.showTopoDialogue()
    }
}















/*##^## Designer {
    D{i:1;anchors_height:200;anchors_width:200}D{i:2;anchors_width:100}D{i:3;anchors_height:200;anchors_width:200}
}
 ##^##*/
