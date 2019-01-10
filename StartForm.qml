import QtQuick 2.4
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

Item {
    width: 1000
    height: 800


    Connections{
        target : GameClass
        onServerIP: {
            infoText.text = "The server is now broadcasting on the network.\nYou could add it manually using the IP: " + IP + " and the port: 2001"
        }
        onClientConnected: {
            serverModel.append({name : username})
        }
    }

    Rectangle {
        id: background
        color: "#070606"
        anchors.fill: parent

        Image {
            id: image1
            x: 374
            y: 0
            source: "Images/Logo1.png"
            width: sourceSize.width
            height: sourceSize.height
            anchors.horizontalCenter: parent.horizontalCenter
            cache: true
            fillMode: Image.PreserveAspectFit
        }

        ListModel {
            id: serverModel
        }

        ListView {
            id: serverview
            model: serverModel
            x: 643
            y: 450
            width: 299
            height: 200
            anchors.horizontalCenterOffset: 1
            anchors.horizontalCenter: parent.horizontalCenter
            enabled: true
            focus : true
            delegate: Text {
                text: name
                font.pointSize: 17
                color: "white"
                MouseArea {
                    id: delegatearea
                    z : 1
                    anchors.fill: parent
                }
            }
            add: Transition {
                NumberAnimation { properties: "x,y"; from: 100; duration: 100 }
                NumberAnimation { properties: "opacity"; from: 0.0; to: 1.0; duration: 1000 }
            }

        }

        Text {
            id: lobbyText
            x: 474
            y: 420
            color: "#fbfbfb"
            text: qsTr("Lobby:")
            font.pixelSize: 20
        }

        Button {
            id: startgameButton
            x: 721
            y: 528
            text: qsTr("Start Game")
            enabled: true
            font.pointSize: 20
            font.bold: true
            onClicked: {
                mainwindow.grow()
                swipeView.visible = false
                swipeView.enabled = false
                gameform.visible = true
                gameform.enabled = true

            }
        }

        Text {
            id: infoText
            x: 489
            y: 170
            width: 608
            height: 74
            color: "#fbfbfb"
            text: qsTr("")
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 20
        }
    }

    TextArea {
        id: serverName
        x: 412
        y: 263
        placeholderText: "Server name"
        font.pointSize: 20
        onTextChanged: {
            if (text.length != 0) {
                startButton.enabled = true
            }
            else {
                startButton.enabled = false
            }
        }
    }

    Button {
        id: startButton
        x: 381
        y: 333
        width: 234
        height: 45
        text: qsTr("Start Server")
        enabled: false
        font.pointSize: 20
        font.bold: true
        onClicked: {
            startgameButton.enabled = true
            GameClass.startServer(serverName.text)
        }
    }

}
