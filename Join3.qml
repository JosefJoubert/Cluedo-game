import QtQuick 2.4

JoinForm {
    mouseArea1.onClicked: {
        serverModel.append({name:"server1",full:3})
        busyIndicator1.visible = false
        usernameinput.forceActiveFocus()
        console.log("hello")
    }
    mouseArea1.onDoubleClicked: {
        usernameinput.selectAll()
    }
    mouseArea2.onClicked: {
        passwordinput.forceActiveFocus()
    }
    mouseArea2.onDoubleClicked: {
        passwordinput.selectAll()
    }

    serverview.add: Transition {
        NumberAnimation { properties: "x,y"; from: 100; duration: 100 }
        NumberAnimation { properties: "opacity"; from: 0.0; to: 1.0; duration: 1000 }
    }

}

