import QtQuick 2.0

Item {
    width: parent.width
    height: clm.implicitHeight
    property string label: ""
    property bool shortLine: false
    property bool isSmallFont: false
    Column {
        id: clm
        width: parent.width
        Text {
            id: labelId
            text: label
            font.pixelSize: isSmallFont ? 18 : 20
            font.bold: true
        }
        Rectangle {
            width: shortLine  ? labelId.implicitWidth + 30 : parent.width - 30
            height: 1
            color: headlineColor
        }
    }
}
