import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Styles 1.4

Item {
    id: item1
    width: 1280
    height: 800
    property alias quitArea: quitArea
    property alias startArea: startArea
    property alias joinArea: joinArea
    property alias joinButton: joinButton
    property alias quitButton: quitButton
    property alias startButton: startButton

    Rectangle {
        id: background
        color: "#070606"
        radius: 0
        anchors.fill: parent
        border.width: 0
        border.color: "#040404"
        enabled: false
        z: -1
    }

    ColumnLayout {
        x: 390
        y: 217
        width: 500
        height: 400
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 50

        Button {
            id: joinButton
            Layout.preferredHeight:  100
            text: qsTr("Join Game")
            font.pointSize: 32
            background: Rectangle{
                radius : 10
                color: "grey"
            }

            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

            Layout.fillWidth: true
            MouseArea {
                id : joinArea
                anchors.fill: parent
                hoverEnabled: true
            }

        }

        Button {
            id: startButton
            Layout.preferredHeight:  100
            text: qsTr("Start Game")
            enabled: true
            font.pointSize: 32

            background: Rectangle{
                color : "grey"
                radius : 10
            }

            Layout.fillWidth: true
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

            MouseArea {
                id : startArea
                enabled: true
                anchors.fill: parent
                hoverEnabled: true
            }


        }

        Button {
            id: quitButton
            Layout.preferredHeight: 100
            text: qsTr("Quit  Game")
            font.pointSize: 32
            background: Rectangle{
                radius : 10
                color: "grey"
            }
            Layout.fillWidth: true
            MouseArea {
                id : quitArea
                anchors.fill: parent
                hoverEnabled: true
            }
        }
    }

    Image {
        id: logo
        x: 374
        y: 0
        source: "Images/Logo1.png"
        width: sourceSize.width
        height: sourceSize.height
        anchors.horizontalCenter: parent.horizontalCenter
        clip: true
        cache: true
        fillMode: Image.PreserveAspectFit

    }
}
