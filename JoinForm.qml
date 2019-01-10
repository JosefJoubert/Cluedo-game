import QtQuick 2.4
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.1

Item {
    width: 1000
    height: 800

    Connections{
        target : Me
        onSconnectFail:{
            connectFailed.text = message
            connectFailed.open()
        }
    }
    Connections{
        target : UDP
        onServerFound:{
            serverModel.append({IP : IP, Port : Port, name : name})
            busyIndicator1.visible = false
        }
    }


    MessageDialog {
        id: connectFailed
        title: "Connect Fail"
        text: "Cannot connect to server."
    }

    Rectangle {
        id: background
        y: 0
        width: 1280
        height: 800
        anchors.fill: parent
        color: "#070606"
        enabled: false
        z: -1
        anchors.rightMargin: -248
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 1

        Image {
            id: logo
            x: 251
            y: 0
            source: "Images/Logo1.png"
            width: sourceSize.width
            height: sourceSize.height
            clip: true
            cache: true
            fillMode: Image.PreserveAspectFit

        }

        BusyIndicator {
            id: busyIndicator1
            x: 763
            y: 431
        }

        ListModel {
            id : serverModel

        }


    }

    Button {
        id: joinButton
        x: 743
        y: 600
        text: "Join Server"
        enabled: false
        onClicked: {
            if (busyIndicator1.visible == false){
                Me.setNamePassword(usernameinput.text,"")
                Me.startClass(serverview.currentItem.address,serverview.currentItem.port)
            }
        }
    }

    Text {
        id: text1
        x: 714
        y: 307
        color: "#fbfbfb"
        text: qsTr("Finding servers")
        opacity: 1
        font.bold: true
        wrapMode: Text.WordWrap
        font.pixelSize: 21
    }


    TextArea {
        id: usernameinput
        x: 150
        y: 451
        width: 200
        height: 39
        color: "#ffffff"
        font.bold: true
        font.pointSize: 16
        placeholderText: qsTr("Username")
        onTextChanged: {
            if (text.length != 0) {
                joinButton.enabled = true
            }
        }
        MouseArea {
            id: mouseArea1
            anchors.fill: parent
            preventStealing: true
            onClicked: {
                usernameinput.forceActiveFocus()
            }
            onDoubleClicked: {
                usernameinput.selectAll()
            }
        }
    }


    ListView {
        id: serverview
        model: serverModel
        x: 643
        y: 363
        width: 299
        height: 200
        enabled: true
        focus : true
        delegate: ColumnLayout{
            property var address : IP
            property var port : Port
            Text {
                text: IP
                font.pointSize: 12
                color: "white"
            }
            Text {
                text: Port
                font.pointSize: 12
                color: "white"
            }
            Text {
                text: name
                font.pointSize: 12
                color: "white"
            }

            MouseArea {
                id: delegatearea
                z : 1
                anchors.fill: parent
                onClicked: {
                    serverview.currentIndex = index
                }
            }
        }

        highlight: Rectangle {
            width: 500
            height: 50
            color: "red"
            radius : 6

        }
        add: Transition {
            NumberAnimation { properties: "x,y"; from: 100; duration: 100 }
            NumberAnimation { properties: "opacity"; from: 0.0; to: 1.0; duration: 1000 }
        }
        highlightFollowsCurrentItem: true


    }

    Popup {
        id : addPopup
        implicitWidth: 300
        implicitHeight: 300
        x : parent.width/2 - implicitWidth/2
        y : parent.height/2 - implicitHeight/2
        modal : true
        focus : true

        contentItem: ColumnLayout {
            spacing : 30
            Label {
                text : "Add server"
                font.bold: true
            }

            TextArea {
                id : serverIP
                placeholderText: "Server IP"
                activeFocusOnTab : true
            }
            TextArea {
                id : serverPort
                placeholderText: "Server Port"
            }
            TextArea {
                id : serverName
                placeholderText: "Server Name"
            }

            RowLayout {
                spacing: 30
                Button {
                    id : okButton
                    text : "Add"
                    onClicked: {
                        if (serverIP.text.length != 0) {
                            if (serverPort.text.length != 0) {
                                serverModel.append({IP : serverIP.text, Port : serverPort.text, name : serverName.text})
                                busyIndicator1.visible = false
                                serverIP.text = ""
                                serverName.text = ""
                                serverPort.text = ""
                                addPopup.close()
                            }
                        }
                    }
                }
                Button {
                    text : "Cancel"
                    onClicked: {
                        serverIP.text = ""
                        serverName.text = ""
                        serverPort.text = ""
                        addPopup.close()
                    }
                }
            }
        }
    }




    Button {
        id: addButton
        x: 450
        y: 512
        text: qsTr("Add server")
        onClicked: {
            addPopup.open()
        }
    }
}
