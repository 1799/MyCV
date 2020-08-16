import QtQuick 2.0
import components 1.0

Item {
    width: parent.width
    height: mainRow.implicitHeight
    property string startTime: ""
    property string endTime: ""
    property string company: ""
    property string responsibilities: ""
    property string skillGained: ""
    property string position: ""
    property string cvInfo: ""
    property bool isPersonal: false
    FontLoader {
        id: fontAwesomeLoadder
        source: "qrc:/fa-solid-900.ttf"
    }
    Row {
        id: mainRow
        width: parent.width
        Column {
            visible: !isPersonal
            spacing: 5
            width: parent.width / 6
            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: startTime
                font.pixelSize: 18
            }
            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "\uf103"
                font.pixelSize: 18
                font.family: fontAwesomeLoadder.name
            }
            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: endTime
                font.pixelSize: 18
            }
        }
        Column {
            spacing: 5
            width: parent.width * 5  / 6
            Headline {
                width: parent.width
                label: company
                shortLine: true
                isSmallFont: true
            }
            Text {
                text: isPersonal ? "* " + position : "Position: " + position
                width: parent.width
                font.pixelSize: 16
                wrapMode: Text.WordWrap
                font.bold: true
            }
            Text {
                text: isPersonal ? "Features: " : "* Main responsibilities:"
                width: parent.width
                font.pixelSize: 16
                wrapMode: Text.WordWrap
                font.bold: true
            }
            Text {
                text: responsibilities
                width: parent.width
                font.pixelSize: 16
                wrapMode: Text.WordWrap
            }
            Text {
                text: isPersonal ? "Techs used: " : "* Achievements and skills gained:"
                width: parent.width
                font.pixelSize: 16
                wrapMode: Text.WordWrap
                font.bold: true
            }
            Text {
                text: skillGained
                width: parent.width
                font.pixelSize: 16
                wrapMode: Text.WordWrap
            }
            Text {
                visible: isPersonal
                text: "* This CV"
                width: parent.width
                font.pixelSize: 16
                font.bold: true
            }
            Text {
                text: cvInfo
                width: parent.width
                font.pixelSize: 16
                wrapMode: Text.WordWrap
            }
        }
    }
}
