import QtQuick 2.0

Item {
    width: parent.width
    height: element.height
    property string label: ""
    property string iconText: ""
    property string content: ""
    property alias fontAwesome: fontAwesomeLoadder.name
    FontLoader {
        id: fontAwesomeLoadder
        source: "qrc:/fa-solid-900.ttf"
    }
    Row {
        id: element
        width: parent.width
        spacing: 2
        Text {
            id: icon
            text: iconText
            font.pixelSize: 20
            font.family: fontAwesome
            width: 25
        }
        Text {
            anchors.verticalCenter: icon.verticalCenter
            anchors.verticalCenterOffset: 2
            text: content
            font.pixelSize: 15
        }
    }
}
