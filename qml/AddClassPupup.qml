import QtQuick 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.3
import "./"

Popup{
//    property var classModelRef: null
    id: root
    width: 640
    height: 480
    clip: true
    modal: true
    padding: 4
    SwipeView {
        id: swipeView
        anchors.fill: parent
        clip: true
        ClassNamePage{
            id: classNamePage
            onNextClicked: function(){
                swipeView.setCurrentIndex(1)
            }
        }
        MatchPage{
            id:matchPage
            onReturnClicked: function(){
                 swipeView.setCurrentIndex(0)
            }
            onNextClicked: function(){
                swipeView.setCurrentIndex(2)
            }
        }
        MatchFinPage{
            id:matchFinPage
            onReturnClicked: function(){
                 swipeView.setCurrentIndex(1)
            }
            onFinishClicked:function(){
                var protocolesList = []
                for(var i=0;i< matchPage.protocoles.count;i++){
                    protocolesList.push(matchPage.protocoles.get(i).protocole)
                }
                classesModel.addQosClass(classNamePage.qosClassName,classNamePage.theMatch,classNamePage.description,
                                       protocolesList,matchPage.precedence,matchPage.dscp,
                                       matchFinPage.interfaceType,matchFinPage.index1,matchFinPage.index2,matchFinPage.destinationsMAC)
                matchPage.protocoles.clear()
                root.close()
                swipeView.setCurrentIndex(2)

            }
        }
    }

    PageIndicator {
        id: pageIndicator
        font.pointSize: 12
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 5
        anchors.horizontalCenter: parent.horizontalCenter
        count: swipeView.count
        currentIndex: swipeView.currentIndex
        delegate: Rectangle {
            implicitWidth: 8
            implicitHeight: 8

            radius: width / 2
            color: "#ffffff"

            opacity: index ===pageIndicator.currentIndex ? 0.95 : pressed ? 0.7 : 0.45

            Behavior on opacity {
                OpacityAnimator {
                    duration: 100
                }
            }
        }
    }

}








































































