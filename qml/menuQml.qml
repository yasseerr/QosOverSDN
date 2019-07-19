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
                title: "Topologie"
                subItems: ["Display Topologie","Add Router","Open Topologie"]
                subItemsFunctions:[displayTopologie,addRouter,openTopologieView]
            }
            MenuItem_Q{
                title: "Quality Of Service"
                subItems: ["Classification","Policing","Service policing"]
                subItemsFunctions:[displayClassification,displayPolicing,displayServicePolicing]
            }
            MenuItem_Q{
                title: "AutoQos"
                subItems: ["affichage"]
                subItemsFunctions:[displayAutoQos]
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
    function displayPolicing(){
        mainForm.displayPolicing()
    }
    function addRouter(){
        mainForm.showTopoDialogue()
    }
    function openTopologieView(){
        mainForm.openTopologieView()
    }
    function displayAutoQos(){
        mainForm.displayAutoQos()
    }
    function displayServicePolicing(){
        mainForm.displayServicePolicing()
    }

}















/*##^## Designer {
    D{i:1;anchors_height:200;anchors_width:200}D{i:2;anchors_width:100}D{i:3;anchors_height:200;anchors_width:200}
}
 ##^##*/
