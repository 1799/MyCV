import QtQuick 2.0
import QtGraphicalEffects 1.14


Item {
    width: parent.width
    height: element.height
    property string iconText: ""
    property string content: ""
    property alias fontAwesome: fontAwesomeLoadder.name
    property int starNumber: 0
    FontLoader {
        id: fontAwesomeLoadder
        source: "qrc:/fa-solid-900.ttf"
    }
    Row {
        id: element
        width: parent.width
        spacing: 4
        Text {
            anchors.verticalCenter: starPoint.verticalCenter
            anchors.verticalCenterOffset: 3
            text: content + ":"
            font.pixelSize: 16
            font.bold: true
            width: 125
        }
        Text {
            id: starPoint
            text: "\uf005"
            font.pixelSize: 16
            font.family: fontAwesome
            color: starNumber > 0 ? "#41cd52" : "white"
            layer.enabled: true
            layer.effect:    Glow {
                anchors.fill: starPoint
                radius: 3
                samples: 10
                spread: 0.5
                smooth: true
                color: "#41cd52"
                source: starPoint
            }
        }
        Text {
            id: starPoint2
            text: "\uf005"
            font.pixelSize: 16
            font.family: fontAwesome
            color: starNumber > 1 ? "#41cd52" : "white"
            layer.enabled: true
            layer.effect:    Glow {
                anchors.fill: starPoint2
                radius: 3
                samples: 10
                spread: 0.5
                smooth: true
                color: "#41cd52"
                source: starPoint2
            }
        }
        Text {
            id: starPoint3
            text: "\uf005"
            font.pixelSize: 16
            font.family: fontAwesome
            color: starNumber > 2 ? "#41cd52" : "white"
            layer.enabled: true
            layer.effect:    Glow {
                anchors.fill: starPoint3
                radius: 3
                samples: 10
                spread: 0.5
                smooth: true
                color: "#41cd52"
                source: starPoint3
            }
        }
        Text {
            id: starPoint4
            text: "\uf005"
            font.pixelSize: 16
            font.family: fontAwesome
            color: starNumber > 3 ? "#41cd52" : "white"
            layer.enabled: true
            layer.effect:    Glow {
                anchors.fill: starPoint4
                radius: 3
                samples: 10
                spread: 0.5
                smooth: true
                color: "#41cd52"
                source: starPoint4
            }
        }
        Text {
            id: starPoint5
            text: "\uf005"
            font.pixelSize: 16
            font.family: fontAwesome
            color: starNumber > 4 ? "#41cd52" : "white"
            layer.enabled: true
            layer.effect:    Glow {
                anchors.fill: starPoint5
                radius: 3
                samples: 10
                spread: 0.5
                smooth: true
                color: "#41cd52"
                source: starPoint5
            }
        }
    }
}
