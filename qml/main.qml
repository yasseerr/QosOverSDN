import QtQuick 2.2
import QtQuick.Window 2.9
Window{
    id: mainWindow
    title: "QosOnSdn"
    flags: Qt.Popup
    Loader{
        anchors.fill: parent
        source: "intro.qml"
    }
}


/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
