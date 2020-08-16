import QtQuick 2.14
import QtQuick.Window 2.14
import QtQuick.Controls 2.14
import components 1.0

Window {
    id: mainWindow
    property int pdfA4Width: 794
    property int pdfA4Height: 1123
    property int totalPage: 2
    property int headlineHeight: 10
    property color headlineColor: "#41cd52"
    visible: true
    width: pdfA4Width
    height: pdfA4Height
    title: qsTr("My CV")
    Item {
        id: mainItem
        anchors.fill: parent
        width: parent.width
        height: parent.height
        Timer {
            id: exportTimer
            interval: 2000
            onTriggered: {
                mainItem.grabToImage(function(result) {
                    result.saveToFile("page " + pageSwipeView.currentIndex + ".png");
                }, Qt.size(794, 1123));
            }
        }

        SwipeView {
            id: pageSwipeView
            anchors.fill: parent
            onCurrentIndexChanged: {
                exportTimer.start();
            }

            Repeater {
                id: pageRepeater
                model: totalPage
                Loader {
                    active: SwipeView.isCurrentItem
                    sourceComponent: Page {
                        header: Rectangle {
                            width: parent.width
                            height: headlineHeight
                            color: headlineColor
                        }
                        footer: Rectangle {
                            width: parent.width
                            height: headlineHeight
                            color: headlineColor
                        }
                        Item {
                            id: mainPage
                            width: parent.width - 40
                            height: parent.height
                            anchors.centerIn: parent
                            Column {
                                anchors.top: parent.top
                                anchors.topMargin: 10
                                anchors.horizontalCenter: parent.horizontalCenter
                                spacing: 10
                                width: parent.width
                                Text {
                                    text: 'Curriculum Vitae'
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    font.pixelSize: 30
                                    visible: pageSwipeView.currentIndex == 0

                                }
                                Item {
                                    id: infoArea
                                    width: parent.width
                                    height: area.height
                                    visible: pageSwipeView.currentIndex == 0
                                    Row {
                                        width: parent.width
                                        height: 300
                                        Column {
                                            id: area
                                            width: parent.width / 4
                                            spacing: 5
                                            Image {
                                                id: avatar
                                                anchors.horizontalCenter: parent.horizontalCenter
                                                source: "qrc:/avatar.jpg"
                                                scale: 0.9
                                            }
                                            Text {
                                                text: 'BUI QUANG PHU'
                                                anchors.horizontalCenter: parent.horizontalCenter
                                                font.pixelSize: 15
                                                font.bold: true
                                            }
                                            Text {
                                                text: 'Embedded Engineer'
                                                anchors.horizontalCenter: parent.horizontalCenter
                                                font.pixelSize: 15
                                                font.bold: true
                                            }
                                        }
                                        Item {
                                            id: detail
                                            width: parent.width * 3 / 4
                                            height: 300
                                            Column {
                                                anchors.fill: parent
                                                width: parent.width
                                                spacing: 10
                                                Headline {
                                                    visible: pageSwipeView.currentIndex == 0
                                                    width: parent.width
                                                    label: "General Info"
                                                }
                                                Row {
                                                    width: parent.width
                                                    Column {
                                                        width: parent.width / 4
                                                        Text {
                                                            id: name
                                                            text: qsTr("Name:")
                                                            font.pixelSize: 20
                                                        }
                                                        Text {
                                                            id: birthDay
                                                            text: qsTr("DOB:")
                                                            font.pixelSize: 20
                                                        }
                                                        Text {
                                                            id: telelphone
                                                            text: qsTr("Tel:")
                                                            font.pixelSize: 20
                                                        }
                                                        Text {
                                                            id: email
                                                            text: qsTr("Email:")
                                                            font.pixelSize: 20
                                                        }
                                                    }
                                                    Column {
                                                        width: parent.width * 3 / 4
                                                        Text {
                                                            id: nameV
                                                            text: qsTr("BUI QUANG PHU")
                                                            font.pixelSize: 20
                                                            font.bold: true
                                                        }
                                                        Text {
                                                            id: birthDayV
                                                            text: qsTr("18/02/1992")
                                                            font.pixelSize: 20
                                                            font.bold: true
                                                        }
                                                        Text {
                                                            id: telelphoneV
                                                            text: qsTr("(+84) 768064947")
                                                            font.pixelSize: 20
                                                            font.bold: true
                                                        }
                                                        Text {
                                                            id: emailV
                                                            text: qsTr("quangphu1799@gmail.com")
                                                            font.pixelSize: 20
                                                            font.bold: true
                                                        }
                                                    }
                                                }
                                                Row {
                                                    width: parent.width
                                                    spacing:  10
                                                    height:  skillColumn.implicitHeight
                                                    Column {
                                                        id: educationColumn
                                                        width: parent.width / 2
                                                        height: educationHL.height
                                                        spacing: 5
                                                        Headline {
                                                            id: educationHL
                                                            width: parent.width
                                                            label: "Education"
                                                        }

                                                        EducationElement {
                                                            iconText: "\uf19c"
                                                            content: "HCM University of Technology"
                                                        }
                                                        EducationElement {
                                                            iconText: "\uf19d"
                                                            content: "Automation Engineering"
                                                        }
                                                        EducationElement {
                                                            iconText: "\uf559"
                                                            content: "TOEIC 690 (2014)"
                                                        }
                                                    }
                                                    Column {
                                                        id: skillColumn
                                                        width: parent.width / 2
                                                        height: skillsHL.height
                                                        spacing: 5
                                                        Headline {
                                                            id: skillsHL
                                                            width: parent.width
                                                            label: "Skills"
                                                        }
                                                        SkillElement {
                                                            content: "C++"
                                                            starNumber: 4
                                                        }
                                                        SkillElement {
                                                            content: "Qt/QML"
                                                            starNumber: 4
                                                        }
                                                        SkillElement {
                                                            content: "Nodejs/SQL"
                                                            starNumber: 3
                                                        }
                                                        SkillElement {
                                                            content: "Communication"
                                                            starNumber: 4
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                Headline {
                                    visible: pageSwipeView.currentIndex == 0
                                    width: parent.width
                                    label: "WORK EXPERIENCE"
                                }
                                JobELement {
                                    visible: pageSwipeView.currentIndex == 0
                                    startTime: "Apr 2016"
                                    endTime: "Apr 2017"
                                    company: "TREK 2000 INTERNATIONAL LIMITED"
                                    position: "Embedded Developer"
                                    responsibilities: " - Develop embedded software for bluetooth products use C/C++ follow company requirements<br>
                                               - Cooperate with app team to test and improve quality of products "
                                    skillGained: " - C/C++ development skills<br>
                                               - Cooperation and communication in English skills<br>
                                               - Microcontroller knowledge: NRF51822, ESP32<br>
                                               - Technical knowledge: Bluetooth Low Energy, SPI, I2C, LCD, sensors,...<br>
                                               - Development tools: KeilC, SVN<br>
                                               - Work oversea in English environment (Singapore 5 months)"
                                }
                                JobELement {
                                    visible: pageSwipeView.currentIndex == 0
                                    startTime: "Jun 2017"
                                    endTime: "Aug 2018"
                                    company: "FPT SOFTWARE DA NANG"
                                    position: "Automotive Tester"
                                    responsibilities: " - Make integration test and unit test for C/C++ driver follow customer requirements<br>
                                               - Discuss with developer to find solutions if there are any bugs"
                                    skillGained: " - Analysing and finding bugs skills<br>
                                               - Work with many customers around the world<br>
                                               - System knowledge: AUTOSAR, Radar system<br>
                                               - Microcontroller knowledge: MPC57XX families, RH850.<br>
                                               - Tools: Git, ClearCase, DOORS, Jira, RTRT, winAMS<br>
                                               - Customers: NXP, BOSCH, SWS"
                                }
                                JobELement {
                                    visible: pageSwipeView.currentIndex == 1
                                    startTime: "Sep 2018"
                                    endTime: "Feb 2019"
                                    company: "FPT SOFTWARE DA NANG"
                                    position: "Automotive Test Leader"
                                    responsibilities: " - Manage team (7-10 members) making unit test C/C++ follow cusomter requirements<br>
                                               - Support C/C++ technical for team member<br>
                                               - Review member's test results<br>
                                               - Discuss solutions with project manager or customer to improve testing process"
                                    skillGained: " - Management skills<br>
                                               - Communication skills<br>
                                               - Analysing and solving issue skill"
                                }
                                JobELement {
                                    visible: pageSwipeView.currentIndex == 1
                                    startTime: "May 2019"
                                    endTime: "Now"
                                    company: "NEXLE CORPORATION"
                                    position: "Senior embedded developer"
                                    responsibilities: " - Develop embedded applications for company and customer using Qt/QML<br>
                                               - Develop APIs using Nodejs as a back-end developer"
                                    skillGained: " - C/C++/Nodejs/SQL development skills<br>
                                               - Development tools: Qt, VS Code<br>
                                               - Technical knowledge: Qt/QML framework, Nodejs handler, Database management (ORACLE, MYSQL,...)"
                                }
                                JobELement {
                                    visible: pageSwipeView.currentIndex == 1
                                    anchors.left: parent.left
                                    anchors.leftMargin: 20
                                    isPersonal: true
                                    endTime: "Now"
                                    company: "PERSONAL PRODUCTS"
                                    position: "Learning English Application"
                                    responsibilities: " - Learning Enlish app for multi platforms (Android, iOS, Desktop)<br>
                                               - Contents: English resources and games (multi players or single player)<br>
                                               - Published to Android and iOS store:<br>
                                                + Android: <font color=\"#0000ff\"><u>https://play.google.com/store/apps/details?id=phubq.app.english</u></font><br>
                                                + iOS:	&nbsp;	&nbsp;	&nbsp;	&nbsp; <font color=\"#0000ff\"><u>https://apps.apple.com/us/app/id1504502705</u></font>"
                                    skillGained: " - Development tool: Qt<br>
                                               - Development languages: C++, QML, Java<br>
                                               - Components: QtQuick, multimedia, animation, MQTT, socket, Firebase<br>
                                               - Platforms: Android, iOS, Desktop"
                                    cvInfo:  " - Development tool and language: Qt/QML<br>
                                               - Source: <font color=\"#0000ff\"><u>https://github.com/1799/MyCV.git</u></font>"
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
