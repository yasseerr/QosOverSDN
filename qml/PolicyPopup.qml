import QtQuick 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.3
import "./"

Popup{
    id: root
    width: 640
    height: 480
    visible: false
    clip: true
    modal: true
    padding: 4
    SwipeView {
        id: swipeView
        anchors.fill: parent
        clip: true


        Policypage1{
            id: policyNamePage1
            onNextClicked: function(){
                swipeView.setCurrentIndex(1)
            }
        }
       PolicyPage2{
           id:policyNamePage2
           onReturnClicked: function(){
                swipeView.setCurrentIndex(0)
           }
           onNextClicked: function(){
              swipeView.setCurrentIndex(2)
           }
       }
       Policypage3{
           id:policyNamePage3
           onReturnClicked: function(){
                swipeView.setCurrentIndex(1)
           }
           onFinishClicked: function(){
                policiesModel.addQosPolicy( policyNamePage1.name,policyNamePage1.description,
                                           policyNamePage2.className,policyNamePage2.bandwidthKb,policyNamePage2.bandwidthPersent,policyNamePage2.bandwidthRemaining,policyNamePage3.precedence,policyNamePage3.dscp
                                           )
               root.close()
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








































































