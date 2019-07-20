import QtQuick 2.12
import QtQuick.Controls 2.12

Item {
    property string name_p: "Not Defined"
    property string description_p: "Not Defined"
    property string match_p: "Not Defined"
    property string protocoles_p: "Not Defined"
    property string precedence_p: "Not Defined"
    property string interfeace_p: "Not Defined"
    property string mac_p: "Not Defined"
    property string color_p: "#336699"

    id: element
    x: 5
    height: 170
    width: 170
    Rectangle {
        id : backgroundRect
        anchors.fill: parent
        color: color_p
        border.width: 1
        opacity: 0.8
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Column{
        id: row
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
            id: matchLabel
            text: match_p
        }

        Label {
            id: protocolesLabel
            text: protocoles_p
        }

        Label {
            id: precedenceLabel
            text: precedence_p
        }

        Label {
            id: interfaceLabel
            text: interfeace_p
        }

        Label {
            id: macLabel
            text: mac_p
        }
    }

}
