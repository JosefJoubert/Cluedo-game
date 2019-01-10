import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

Item {
    width: 1000
    height: 800


    Connections{
        target : Me
        onSlobbyUpdate:{
            text2.text = count
            addButton.enabled = superuser
            swipeView.setCurrentIndex(3)
        }
        onSselectCharacter:{
            selectCharacter.open()
            if (Green == false){
                iGreen.enabled = false
            }
            if (Peach == false){
                iPeach.enabled = false
            }
            if (Peacock == false){
                iPeacock.enabled = false
            }
            if (Plum == false){
                iPlum.enabled = false
            }
            if (Scarlet == false){
                iScarlet.enabled = false
            }
            if (White == false){
                iWhite.enabled = false
            }
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

        Text {
            id: text1
            x: 296
            y: 388
            color: "#f2f2f2"
            text: qsTr("Waiting for game to start. Connected players:")
            font.pixelSize: 20
        }

        Text {
            id: text2
            x: 731
            y: 385
            color: "#f2f2f2"
            text: qsTr("0")
            font.pixelSize: 20
        }

        Button {
            id: addButton
            x: 450
            y: 512
            text: "Start Game"
            enabled: true
            onClicked: {
                Me.startGame()
                selectCharacter.open()
            }
        }
    }
    Popup {
        id : selectCharacter
        implicitWidth: 800
        implicitHeight: 800
        x : parent.width/2 - implicitWidth/2
        y : parent.height/2 - implicitHeight/2
        modal : true
        focus : true

        contentItem: ColumnLayout {
            spacing : 30
            anchors.centerIn: parent
            Label {
                Layout.alignment: Qt.AlignCenter
                text : "Choose a character:"
                font.bold: true
                font.pointSize: 32
            }
            RowLayout {
                spacing: 30
                implicitHeight : 100
                Layout.alignment: Qt.AlignCenter
                Image {
                    id : iGreen
                    Layout.preferredHeight: 257
                    Layout.preferredWidth: 187
                    source: "Images/green.jpg"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            selectCharacter.close()
                            Me.chooseCharacter(10)
                        }
                    }
                }

                Image {
                    id : iPeach
                    Layout.preferredHeight: 257
                    Layout.preferredWidth: 187
                    source: "Images/peach.jpg"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            selectCharacter.close()
                            Me.chooseCharacter(11)
                        }
                    }
                }

                Image {
                    id : iPeacock
                    Layout.preferredHeight: 257
                    Layout.preferredWidth: 187
                    source: "Images/peacock.jpg"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            selectCharacter.close()
                            Me.chooseCharacter(12)
                        }
                    }
                }
            }

            RowLayout {
                spacing: 30
                implicitHeight : 100
                Layout.alignment: Qt.AlignCenter
                Image {
                    id : iPlum
                    Layout.preferredHeight: 257
                    Layout.preferredWidth: 187
                    source: "Images/plum.jpg"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            selectCharacter.close()
                            Me.chooseCharacter(12)
                        }
                    }
                }

                Image {
                    id : iScarlet
                    Layout.preferredHeight: 257
                    Layout.preferredWidth: 187
                    source: "Images/scarlet.jpg"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            selectCharacter.close()
                            Me.chooseCharacter(13)
                        }
                    }
                }

                Image {
                    id : iWhite
                    Layout.preferredHeight: 257
                    Layout.preferredWidth: 187
                    source: "Images/white.jpg"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            selectCharacter.close()
                            Me.chooseCharacter(14)
                        }
                    }
                }
            }
        }
    }
}
