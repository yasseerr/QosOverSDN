import QtQuick 2.12
import QtQuick.Controls 2.12

Item {
    property string name_p: "Not Defined"
    property string description_p: "Not Defined"
    property string className_p: "Not Defined"
    property int bandwidthKb_p: -1
    property int bandwidthPercent_p: -1
    property int bandwidthRemaining_p:  -1
    property string precedence_p: "Not Defined"
    property string dscp_p: "Not Defined"
    property string color_p: "#336699"

    id: element
    x: 5
    height: 170
    width: 170
    clip: true
    Rectangle {
        id : backgroundRect
        anchors.fill: parent
        color: color_p
        border.width: 1
        opacity: 0.8
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Flickable {
        id: flickable
        flickableDirection: Flickable.VerticalFlick
        anchors.fill: parent

        Column{
            id: row
            x: 10
            y: 10
            anchors.rightMargin: 10
            anchors.leftMargin: 10
            anchors.bottomMargin: 10
            anchors.topMargin: 10
            spacing: 4
            anchors.fill: parent

            Text {
                id: name
                text: name_p
                font.pointSize: 12
                font.bold: true
            }

            Label {
                id: descLabel
                text: description_p
            }

            Label {
                id: classNameLabel
                text: className_p
            }

            Label {
                id: bandwidthLabel
                text: bandwidthKb_p+" KB/s"
                visible: bandwidthKb_p != "-1"
            }

            Label {
                id: bandwidthPercentLabel
                text: bandwidthPercent_p+" %"
                visible: bandwidthPercent_p!="-1"
            }

            Label {
                id: bandwidthRemainingLabel
                text: bandwidthRemaining_p+" %rem"
                visible: bandwidthRemaining_p!="-1"
            }

            Label {
                id: precedenceLabel
                text: precedence_p
            }
            Label {
                id: dscpLabel
                text: dscp_p
            }
        }
    }

}

/*##^## Designer {
    D{i:2;anchors_height:300;anchors_width:300}
}
 ##^##*/
