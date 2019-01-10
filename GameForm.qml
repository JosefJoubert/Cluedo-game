import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.1

Item {
    width: 1280
    height: 720
    property alias card3: card3
    property alias card2: card2
    property alias card1: card1
    property alias plum: plum
    property alias scarlet: scarlet
    property alias white: white
    property alias mustard: peach
    property alias green: green
    property alias peacock: peacock
    property alias notesButton: notesButton
    property alias cardsButton: cardsButton
    property alias player6: player6
    property alias player5: player5
    property alias player4: player4
    property alias player3: player3
    property alias player2: player2
    property alias player1: player1
    property alias tile82: tile82
    property alias tile81: tile81
    property alias tile80: tile80
    property alias tile79: tile79
    property alias tile78: tile78
    property alias tile77: tile77
    property alias tile76: tile76
    property alias tile75: tile75
    property alias tile72: tile72
    property alias tile71: tile71
    property alias tile70: tile70
    property alias tile69: tile69
    property alias tile64: tile64
    property alias tile63: tile63
    property alias tile62: tile62
    property alias tile61: tile61
    property alias tile56: tile56
    property alias tile55: tile55
    property alias tile54: tile54
    property alias tile53: tile53
    property alias tile52: tile52
    property alias tile51: tile51
    property alias tile50: tile50
    property alias tile49: tile49
    property alias tile48: tile48
    property alias tile47: tile47
    property alias tile46: tile46
    property alias tile45: tile45
    property alias tile44: tile44
    property alias tile43: tile43
    property alias tile42: tile42
    property alias tile41: tile41
    property alias tile40: tile40
    property alias tile39: tile39
    property alias tile38: tile38
    property alias tile37: tile37
    property alias tile36: tile36
    property alias tile35: tile35
    property alias tile34: tile34
    property alias tile33: tile33
    property alias tile32: tile32
    property alias tile31: tile31
    property alias tile30: tile30
    property alias tile28: tile28
    property alias tile27: tile27
    property alias tile26: tile26
    property alias tile25: tile25
    property alias tile24: tile24
    property alias tile23: tile23
    property alias tile22: tile22
    property alias tile21: tile21
    property alias tile20: tile20
    property alias tile19: tile19
    property alias tile18: tile18
    property alias tile17: tile17
    property alias tile16: tile16
    property alias tile15: tile15
    property alias tile14: tile14
    property alias tile13: tile13
    property alias tile12: tile12
    property alias tile11: tile11
    property alias tile10: tile10
    property alias tile74: tile74
    property alias tile73: tile73
    property alias tile68: tile68
    property alias tile67: tile67
    property alias tile66: tile66
    property alias tile65: tile65
    property alias tile60: tile60
    property alias tile59: tile59
    property alias tile58: tile58
    property alias tile57: tile57
    property alias tile29: tile29
    property alias boardimg: boardimg
    id : gameform




    property var movable

    MessageDialog {
        id: moveRequest
        title: "New Turn"
        text: ""
        onAccepted: {
            Qt.quit()
        }
    }

    Connections{
        target : Me
        onSguess:{
            sendAccuseSuspect.open()
        }
        onSmoveRequest:{
            moveRequest.text = message
            moveRequest.open()
        }
        onInitCards:{
            cardsPane.loadCards(fcard,scard,tcard)
            showResponse.c1 = fcard
            showResponse.c2 = scard
            showResponse.c3 = tcard
        }
        onShowRequestnot:{
            showGuess.c1 = card1
            showGuess.c2 = card2
            showGuess.c3 = card3
            showGuess.character = character
            showGuess.open()
        }
        onShowRequestfor:{
            showGuess.c1 = card1
            showGuess.c2 = card2
            showGuess.c3 = card3
            showGuess.character = character
            showResponse.open()
            showGuess.open()
        }

        onSboardState:{
            if (player1 == "Green"){
                movable = green
            }
            else if (player1 == "Peach"){
                movable = peach
            }
            else if (player1 == "Peacock"){
                movable = peacock
            }
            else if (player1 == "Plum"){
                movable = plum
            }
            else if (player1 == "Scarlet"){
                movable = scarlet
            }
            else if (player1 == "White"){
                movable = white
            }
            moveTo(pos1)
            if (player2 == "Green"){
                movable = green
            }
            else if (player2 == "Peach"){
                movable = peach
            }
            else if (player2 == "Peacock"){
                movable = peacock
            }
            else if (player2 == "Plum"){
                movable = plum
            }
            else if (player2 == "Scarlet"){
                movable = scarlet
            }
            else if (player2 == "White"){
                movable = white
            }
            moveTo(pos2)
            if (player3 == "Green"){
                movable = green
            }
            else if (player3 == "Peach"){
                movable = peach
            }
            else if (player3 == "Peacock"){
                movable = peacock
            }
            else if (player3 == "Plum"){
                movable = plum
            }
            else if (player3 == "Scarlet"){
                movable = scarlet
            }
            else if (player3 == "White"){
                movable = white
            }
            moveTo(pos3)
            if (player4 == "Green"){
                movable = green
            }
            else if (player4 == "Peach"){
                movable = peach
            }
            else if (player4 == "Peacock"){
                movable = peacock
            }
            else if (player4 == "Plum"){
                movable = plum
            }
            else if (player4 == "Scarlet"){
                movable = scarlet
            }
            else if (player4 == "White"){
                movable = white
            }
            moveTo(pos4)
            if (player5 == "Green"){
                movable = green
            }
            else if (player5 == "Peach"){
                movable = peach
            }
            else if (player5 == "Peacock"){
                movable = peacock
            }
            else if (player5 == "Plum"){
                movable = plum
            }
            else if (player5 == "Scarlet"){
                movable = scarlet
            }
            else if (player5 == "White"){
                movable = white
            }
            moveTo(pos5)
            if (player6 == "Green"){
                movable = green
            }
            else if (player6 == "Peach"){
                movable = peach
            }
            else if (player6 == "Peacock"){
                movable = peacock
            }
            else if (player6 == "Plum"){
                movable = plum
            }
            else if (player6 == "Scarlet"){
                movable = scarlet
            }
            else if (player6 == "White"){
                movable = white
            }
            moveTo(pos6)
            if (player1 == "Green"){
                movable = green
            }
            else if (player1 == "Peach"){
                movable = peach
            }
            else if (player1 == "Peacock"){
                movable = peacock
            }
            else if (player1 == "Plum"){
                movable = plum
            }
            else if (player1 == "Scarlet"){
                movable = scarlet
            }
            else if (player1 == "White"){
                movable = white
            }
            moveTo(pos1)
        }
    }

    function moveTo(pos){
        if (pos == 0){
            movable.anchors.centerIn = mouseArea0
        }
        else if (pos == 1){
            movable.anchors.centerIn = mouseArea1
        }
        else if (pos == 2){
            movable.anchors.centerIn = mouseArea2
        }
        else if (pos == 3){
            movable.anchors.centerIn = mouseArea3
        }
        else if (pos == 4){
            movable.anchors.centerIn = mouseArea4
        }
        else if (pos == 5){
            movable.anchors.centerIn = mouseArea5
        }
        else if (pos == 6){
            movable.anchors.centerIn = mouseArea6
        }
        else if (pos == 7){
            movable.anchors.centerIn = mouseArea7
        }
        else if (pos == 8){
            movable.anchors.centerIn = mouseArea8
        }
        else if (pos == 9){
            movable.anchors.centerIn = mouseArea9
        }
        else if (pos == 10){
            movable.anchors.centerIn = tile10
        }
        else if (pos == 11){
            movable.anchors.centerIn = tile11
        }
        else if (pos == 12){
            movable.anchors.centerIn = tile12
        }
        else if (pos == 13){
            movable.anchors.centerIn = tile13
        }
        else if (pos == 14){
            movable.anchors.centerIn = tile14
        }
        else if (pos == 15){
            movable.anchors.centerIn = tile15
        }
        else if (pos == 16){
            movable.anchors.centerIn = tile16
        }
        else if (pos == 17){
            movable.anchors.centerIn = tile17
        }
        else if (pos == 18){
            movable.anchors.centerIn = tile18
        }
        else if (pos == 19){
            movable.anchors.centerIn = tile19
        }
        else if (pos == 20){
            movable.anchors.centerIn = tile20
        }
        else if (pos == 21){
            movable.anchors.centerIn = tile21
        }
        else if (pos == 22){
            movable.anchors.centerIn = tile22
        }
        else if (pos == 23){
            movable.anchors.centerIn = tile23
        }
        else if (pos == 24){
            movable.anchors.centerIn = tile24
        }
        else if (pos == 25){
            movable.anchors.centerIn = tile25
        }
        else if (pos == 26){
            movable.anchors.centerIn = tile26
        }
        else if (pos == 27){
            movable.anchors.centerIn = tile27
        }
        else if (pos == 28){
            movable.anchors.centerIn = tile28
        }
        else if (pos == 29){
            movable.anchors.centerIn = tile29
        }
        else if (pos == 30){
            movable.anchors.centerIn = tile30
        }
        else if (pos == 31){
            movable.anchors.centerIn = tile31
        }
        else if (pos == 32){
            movable.anchors.centerIn = tile32
        }
        else if (pos == 33){
            movable.anchors.centerIn = tile33
        }
        else if (pos == 34){
            movable.anchors.centerIn = tile34
        }
        else if (pos == 35){
            movable.anchors.centerIn = tile35
        }
        else if (pos == 36){
            movable.anchors.centerIn = tile36
        }
        else if (pos == 37){
            movable.anchors.centerIn = tile37
        }
        else if (pos == 38){
            movable.anchors.centerIn = tile38
        }
        else if (pos == 39){
            movable.anchors.centerIn = tile39
        }
        else if (pos == 40){
            movable.anchors.centerIn = tile40
        }
        else if (pos == 41){
            movable.anchors.centerIn = tile41
        }
        else if (pos == 42){
            movable.anchors.centerIn = tile42
        }
        else if (pos == 43){
            movable.anchors.centerIn = tile43
        }
        else if (pos == 44){
            movable.anchors.centerIn = tile44
        }
        else if (pos == 45){
            movable.anchors.centerIn = tile45
        }
        else if (pos == 46){
            movable.anchors.centerIn = tile46
        }
        else if (pos == 47){
            movable.anchors.centerIn = tile47
        }
        else if (pos == 48){
            movable.anchors.centerIn = tile48
        }
        else if (pos == 49){
            movable.anchors.centerIn = tile49
        }
        else if (pos == 50){
            movable.anchors.centerIn = tile50
        }
        else if (pos == 51){
            movable.anchors.centerIn = tile51
        }
        else if (pos == 52){
            movable.anchors.centerIn = tile52
        }
        else if (pos == 53){
            movable.anchors.centerIn = tile53
        }
        else if (pos == 54){
            movable.anchors.centerIn = tile54
        }
        else if (pos == 55){
            movable.anchors.centerIn = tile55
        }
        else if (pos == 56){
            movable.anchors.centerIn = tile56
        }
        else if (pos == 57){
            movable.anchors.centerIn = tile57
        }
        else if (pos == 58){
            movable.anchors.centerIn = tile58
        }
        else if (pos == 59){
            movable.anchors.centerIn = tile59
        }
        else if (pos == 60){
            movable.anchors.centerIn = tile60
        }
        else if (pos == 61){
            movable.anchors.centerIn = tile61
        }
        else if (pos == 62){
            movable.anchors.centerIn = tile62
        }
        else if (pos == 63){
            movable.anchors.centerIn = tile63
        }
        else if (pos == 64){
            movable.anchors.centerIn = tile64
        }
        else if (pos == 65){
            movable.anchors.centerIn = tile65
        }
        else if (pos == 66){
            movable.anchors.centerIn = tile66
        }
        else if (pos == 67){
            movable.anchors.centerIn = tile67
        }
        else if (pos == 68){
            movable.anchors.centerIn = tile68
        }
        else if (pos == 69){
            movable.anchors.centerIn = tile69
        }
        else if (pos == 70){
            movable.anchors.centerIn = tile70
        }
        else if (pos == 71){
            movable.anchors.centerIn = tile71
        }
        else if (pos == 72){
            movable.anchors.centerIn = tile72
        }
        else if (pos == 73){
            movable.anchors.centerIn = tile73
        }
        else if (pos == 74){
            movable.anchors.centerIn = tile74
        }
        else if (pos == 75){
            movable.anchors.centerIn = tile75
        }
        else if (pos == 76){
            movable.anchors.centerIn = tile76
        }
        else if (pos == 77){
            movable.anchors.centerIn = tile77
        }
        else if (pos == 78){
            movable.anchors.centerIn = tile78
        }
        else if (pos == 79){
            movable.anchors.centerIn = tile79
        }
        else if (pos == 80){
            movable.anchors.centerIn = tile80
        }
        else if (pos == 81){
            movable.anchors.centerIn = tile81
        }
        else if (pos == 82){
            movable.anchors.centerIn = tile82
        }

    }


    property var cardCharacter


    Rectangle {
        id: rectangle1
        width: 1280
        height: 720
        color: "#ebed9b"
        radius: 1
        border.width: 10
        border.color: "#fbf6ce"
        anchors.bottomMargin: -40
        anchors.fill: parent

        Image {
            id: boardimg
            x: 135
            y: 0
            width: 1090
            height: 720
            opacity: 0
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            source: "Images/BoardD.jpg"
        }

        Pane {
            id: player1
            x: 1192
            y: 30
            width: 76
            height: 154
            opacity: 0
            background : Rectangle {
                anchors.fill: parent
                color : "lightgreen"
                radius : 5
            }
            Text {
                id: name1
                x: 0
                y: 0
                text: qsTr("Mr. Green")
                font.pixelSize: 12
            }
        }

        Pane {
            id: player2
            x: 1192
            y: 227
            width: 76
            height: 154
            opacity: 0
            background : Rectangle {
                anchors.fill: parent
                color : "#ebba5d"
                radius : 5
                opacity: 1
            }
            Text {
                id: name2
                x: -2
                y: 0
                text: qsTr("Miss Peach")
                font.pixelSize: 12
            }
        }


        Pane {
            id: player3
            x: 1192
            y: 420
            width: 76
            height: 154
            opacity: 0
            background : Rectangle {
                anchors.fill: parent
                color : "#FF54D8"
                radius : 5
            }
            Text {
                id: name3
                x: -7
                y: -5
                width: 66
                height: 46
                text: qsTr("Professor Plum")
                clip: true
                textFormat: Text.RichText
                horizontalAlignment: Text.AlignHCenter
                wrapMode: Text.WordWrap
                verticalAlignment: Text.AlignTop
                font.pixelSize: 12
            }
        }


        Pane {
            id: player4
            x: 13
            y: 30
            width: 76
            height: 154
            opacity: 0
            background : Rectangle {
                anchors.fill: parent
                color : "#FF4B4B"
                radius : 5
            }
            Text {
                id: name4
                x: -5
                y: 0
                text: qsTr("Miss Scarlet")
                opacity: 1
                font.pixelSize: 12
            }
        }

        Pane {
            id: player5
            x: 13
            y: 227
            width: 76
            height: 154
            opacity: 0
            background : Rectangle {
                anchors.fill: parent
                color : "#E2E2E2"
                radius : 5
            }
            Text {
                id: name5
                x: -2
                y: 0
                text: qsTr("Mrs. White")
                font.pixelSize: 12
            }
        }

        Pane {
            id: player6
            x: 13
            y: 420
            width: 76
            height: 154
            opacity: 0
            background : Rectangle {
                anchors.fill: parent
                color : "#5FB5FF"
                radius : 5
            }
            Text {
                id: name6
                x: -9
                y: 0
                text: qsTr("Mrs. Peacock")
                font.pixelSize: 12
            }
        }









    }


    Image {
        id: tile57
        x: 541
        y: 460
        width: 50
        height: 37
        source: "Images/tile1.jpg"

        MouseArea {
            id: mouseArea57
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.mirror = true
            }
            onExited: {
                parent.mirror = false
            }
            onClicked: {
                Me.makeMove(57)
            }
        }
    }

    Image {
        id: tile58
        x: 590
        y: 460
        width: 50
        height: 37
        source: "Images/tile2.jpg"

        MouseArea {
            id: mouseArea58
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.mirror = true
            }
            onExited: {
                parent.mirror = false
            }
            onClicked: {
                Me.makeMove(58)
            }
        }
    }


    Image {
        id: tile59
        x: 639
        y: 460
        width: 50
        height: 37
        source: "Images/tile3.jpg"

        MouseArea {
            id: mouseArea59
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.mirror = true
            }
            onExited: {
                parent.mirror = false
            }
            onClicked: {
                Me.makeMove(59)
            }
        }
    }


    Image {
        id: tile60
        x: 689
        y: 460
        width: 50
        height: 37
        source: "Images/tile4.jpg"

        MouseArea {
            id: mouseArea60
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.mirror = true
            }
            onExited: {
                parent.mirror = false
            }
            onClicked: {
                Me.makeMove(60)
            }
        }
    }


    Image {
        id: tile65
        x: 541
        y: 497
        width: 50
        height: 37
        source: "Images/tile5.jpg"

        MouseArea {
            id: mouseArea65
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.mirror = true
            }
            onExited: {
                parent.mirror = false
            }
            onClicked: {
                Me.makeMove(65)
            }
        }
    }


    Image {
        id: tile66
        x: 590
        y: 497
        width: 50
        height: 37
        source: "Images/tile6.jpg"

        MouseArea {
            id: mouseArea66
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.mirror = true
            }
            onExited: {
                parent.mirror = false
            }
            onClicked: {
                Me.makeMove(66)
            }
        }
    }


    Image {
        id: tile67
        x: 639
        y: 497
        width: 50
        height: 37
        source: "Images/tile7.jpg"

        MouseArea {
            id: mouseArea67
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.mirror = true
            }
            onExited: {
                parent.mirror = false
            }
            onClicked: {
                Me.makeMove(67)
            }
        }
    }


    Image {
        id: tile68
        x: 689
        y: 497
        width: 50
        height: 37
        source: "Images/tile8.jpg"

        MouseArea {
            id: mouseArea68
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.mirror = true
            }
            onExited: {
                parent.mirror = false
            }
            onClicked: {
                Me.makeMove(68)
            }
        }
    }


    Image {
        id: tile73
        x: 541
        y: 534
        width: 50
        height: 37
        source: "Images/tile9.jpg"

        MouseArea {
            id: mouseArea73
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.mirror = true
            }
            onExited: {
                parent.mirror = false
            }
            onClicked: {
                Me.makeMove(73)
            }
        }
    }


    Image {
        id: tile74
        x: 590
        y: 534
        width: 50
        height: 37
        source: "Images/tile10.jpg"

        MouseArea {
            id: mouseArea74
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.mirror = true
            }
            onExited: {
                parent.mirror = false
            }
            onClicked: {
                Me.makeMove(74)
            }
        }
    }


    Image {
        id: tile75
        x: 639
        y: 534
        width: 50
        height: 37
        source: "Images/tile11.jpg"

        MouseArea {
            id: mouseArea75
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.mirror = true
            }
            onExited: {
                parent.mirror = false
            }
            onClicked: {
                Me.makeMove(75)
            }
        }
    }


    Image {
        id: tile76
        x: 689
        y: 534
        width: 50
        height: 37
        source: "Images/tile12.jpg"

        MouseArea {
            id: mouseArea76
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.mirror = true
            }
            onExited: {
                parent.mirror = false
            }
            onClicked: {
                Me.makeMove(76)
            }
        }
    }


    Image {
        id: tile79
        x: 541
        y: 571
        width: 50
        height: 37
        source: "Images/tile13.jpg"

        MouseArea {
            id: mouseArea79
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.mirror = true
            }
            onExited: {
                parent.mirror = false
            }
            onClicked: {
                Me.makeMove(79)
            }
        }
    }


    Image {
        id: tile80
        x: 590
        y: 571
        width: 50
        height: 37
        visible: true
        source: "Images/tile14.jpg"

        MouseArea {
            id: mouseArea80
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.mirror = true
            }
            onExited: {
                parent.mirror = false
            }
            onClicked: {
                Me.makeMove(80)
            }
        }
    }


    Image {
        id: tile81
        x: 639
        y: 571
        width: 50
        height: 37
        source: "Images/tile15.jpg"

        MouseArea {
            id: mouseArea81
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.mirror = true
            }
            onExited: {
                parent.mirror = false
            }
            onClicked: {
                Me.makeMove(81)
            }
        }
    }


    Image {
        id: tile82
        x: 689
        y: 571
        width: 50
        height: 37
        source: "Images/tile16.jpg"

        MouseArea {
            id: mouseArea82
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.mirror = true
            }
            onExited: {
                parent.mirror = false
            }
            onClicked: {
                Me.makeMove(82)
            }
        }
    }



    Image {
        id: tile50
        x: 491
        y: 386
        width: 50
        height: 37
        source: "Images/tile14.jpg"

        MouseArea {
            id: mouseArea50
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.mirror = true
            }
            onExited: {
                parent.mirror = false
            }
            onClicked: {
                Me.makeMove(50)
            }
        }
    }



    Image {
        id: tile49
        x: 442
        y: 386
        width: 50
        height: 37
        source: "Images/tile13.jpg"

        MouseArea {
            id: mouseArea49
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.mirror = true
            }
            onExited: {
                parent.mirror = false
            }
            onClicked: {
                Me.makeMove(49)
            }
        }
    }



    Image {
        id: tile47
        x: 491
        y: 349
        width: 50
        height: 37
        source: "Images/tile10.jpg"

        MouseArea {
            id: mouseArea47
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.mirror = true
            }
            onExited: {
                parent.mirror = false
            }
            onClicked: {
                Me.makeMove(47)
            }
        }
    }



    Image {
        id: tile46
        x: 442
        y: 349
        width: 50
        height: 37
        source: "Images/tile9.jpg"

        MouseArea {
            id: mouseArea46
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.mirror = true
            }
            onExited: {
                parent.mirror = false
            }
            onClicked: {
                Me.makeMove(46)
            }
        }
    }



    Image {
        id: tile40
        x: 492
        y: 312
        width: 50
        height: 37
        source: "Images/tile6.jpg"

        MouseArea {
            id: mouseArea40
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.mirror = true
            }
            onExited: {
                parent.mirror = false
            }
            onClicked: {
                Me.makeMove(40)
            }
        }
    }



    Image {
        id: tile39
        x: 442
        y: 312
        width: 50
        height: 37
        source: "Images/tile5.jpg"

        MouseArea {
            id: mouseArea39
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.mirror = true
            }
            onExited: {
                parent.mirror = false
            }
            onClicked: {
                Me.makeMove(39)
            }
        }
    }



    Image {
        id: tile33
        x: 491
        y: 277
        width: 50
        height: 37
        source: "Images/tile2.jpg"

        MouseArea {
            id: mouseArea33
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.mirror = true
            }
            onExited: {
                parent.mirror = false
            }
            onClicked: {
                Me.makeMove(33)
            }
        }
    }



    Image {
        id: tile32
        x: 442
        y: 277
        width: 50
        height: 37
        source: "Images/tile1.jpg"

        MouseArea {
            id: mouseArea32
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.mirror = true
            }
            onExited: {
                parent.mirror = false
            }
            onClicked: {
                Me.makeMove(32)
            }
        }
    }



    Image {
        id: tile72
        x: 491
        y: 534
        width: 50
        height: 37
        source: "Images/tile14.jpg"

        MouseArea {
            id: mouseArea72
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.mirror = true
            }
            onExited: {
                parent.mirror = false
            }
            onClicked: {
                Me.makeMove(72)
            }
        }
    }



    Image {
        id: tile71
        x: 442
        y: 534
        width: 50
        height: 37
        source: "Images/tile13.jpg"

        MouseArea {
            id: mouseArea71
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.mirror = true
            }
            onExited: {
                parent.mirror = false
            }
            onClicked: {
                Me.makeMove(71)
            }
        }
    }



    Image {
        id: tile64
        x: 491
        y: 497
        width: 50
        height: 37
        source: "Images/tile10.jpg"

        MouseArea {
            id: mouseArea64
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.mirror = true
            }
            onExited: {
                parent.mirror = false
            }
            onClicked: {
                Me.makeMove(64)
            }
        }
    }



    Image {
        id: tile63
        x: 442
        y: 497
        width: 50
        height: 37
        source: "Images/tile9.jpg"

        MouseArea {
            id: mouseArea63
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.mirror = true
            }
            onExited: {
                parent.mirror = false
            }
            onClicked: {
                Me.makeMove(63)
            }
        }
    }



    Image {
        id: tile56
        x: 492
        y: 460
        width: 50
        height: 37
        source: "Images/tile6.jpg"

        MouseArea {
            id: mouseArea56
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.mirror = true
            }
            onExited: {
                parent.mirror = false
            }
            onClicked: {
                Me.makeMove(56)
            }
        }
    }



    Image {
        id: tile55
        x: 442
        y: 460
        width: 50
        height: 37
        source: "Images/tile5.jpg"

        MouseArea {
            id: mouseArea55
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.mirror = true
            }
            onExited: {
                parent.mirror = false
            }
            onClicked: {
                Me.makeMove(55)
            }
        }
    }



    Image {
        id: tile53
        x: 491
        y: 423
        width: 50
        height: 37
        source: "Images/tile2.jpg"

        MouseArea {
            id: mouseArea53
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.mirror = true
            }
            onExited: {
                parent.mirror = false
            }
            onClicked: {
                Me.makeMove(53)
            }
        }
    }



    Image {
        id: tile52
        x: 442
        y: 423
        width: 50
        height: 37
        source: "Images/tile1.jpg"

        MouseArea {
            id: mouseArea52
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.mirror = true
            }
            onExited: {
                parent.mirror = false
            }
            onClicked: {
                Me.makeMove(52)
            }
        }
    }



    Image {
        id: tile14
        x: 442
        y: 170
        width: 50
        height: 37
        source: "Images/tile7.jpg"

        MouseArea {
            id: mouseArea14
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.mirror = true
            }
            onExited: {
                parent.mirror = false
            }
            onClicked: {
                Me.makeMove(14)
            }
        }
    }

    Image {
        id: tile15
        x: 492
        y: 170
        width: 50
        height: 37
        source: "Images/tile8.jpg"

        MouseArea {
            id: mouseArea15
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.mirror = true
            }
            onExited: {
                parent.mirror = false
            }
            onClicked: {
                Me.makeMove(15)
            }
        }
    }

    Image {
        id: tile18
        x: 492
        y: 206
        width: 50
        height: 37
        source: "Images/tile12.jpg"

        MouseArea {
            id: mouseArea18
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.mirror = true
            }
            onExited: {
                parent.mirror = false
            }
            onClicked: {
                Me.makeMove(18)
            }
        }
    }

    Image {
        id: tile25
        x: 492
        y: 243
        width: 50
        height: 37
        source: "Images/tile16.jpg"

        MouseArea {
            id: mouseArea25
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.mirror = true
            }
            onExited: {
                parent.mirror = false
            }
            onClicked: {
                Me.makeMove(25)
            }
        }
    }

    Image {
        id: tile19
        x: 541
        y: 206
        width: 50
        height: 37
        source: "Images/tile1.jpg"

        MouseArea {
            id: mouseArea19
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.mirror = true
            }
            onExited: {
                parent.mirror = false
            }
            onClicked: {
                Me.makeMove(19)
            }
        }
    }

    Image {
        id: tile20
        x: 590
        y: 206
        width: 50
        height: 37
        source: "Images/tile2.jpg"

        MouseArea {
            id: mouseArea20
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.mirror = true
            }
            onExited: {
                parent.mirror = false
            }
            onClicked: {
                Me.makeMove(20)
            }
        }
    }

    Image {
        id: tile21
        x: 639
        y: 206
        width: 50
        height: 37
        source: "Images/tile3.jpg"

        MouseArea {
            id: mouseArea21
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.mirror = true
            }
            onExited: {
                parent.mirror = false
            }
            onClicked: {
                Me.makeMove(21)
            }
        }
    }

    Image {
        id: tile22
        x: 689
        y: 206
        width: 50
        height: 37
        source: "Images/tile4.jpg"

        MouseArea {
            id: mouseArea22
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.mirror = true
            }
            onExited: {
                parent.mirror = false
            }
            onClicked: {
                Me.makeMove(22)
            }
        }
    }

    Image {
        id: tile26
        x: 541
        y: 243
        width: 50
        height: 37
        source: "Images/tile5.jpg"

        MouseArea {
            id: mouseArea26
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.mirror = true
            }
            onExited: {
                parent.mirror = false
            }
            onClicked: {
                Me.makeMove(26)
            }
        }
    }

    Image {
        id: tile27
        x: 590
        y: 243
        width: 50
        height: 37
        source: "Images/tile6.jpg"

        MouseArea {
            id: mouseArea27
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.mirror = true
            }
            onExited: {
                parent.mirror = false
            }
            onClicked: {
                Me.makeMove(27)
            }
        }
    }

    Image {
        id: tile28
        x: 639
        y: 243
        width: 50
        height: 37
        source: "Images/tile7.jpg"

        MouseArea {
            id: mouseArea28
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.mirror = true
            }
            onExited: {
                parent.mirror = false
            }
            onClicked: {
                Me.makeMove(28)
            }
        }
    }

    Image {
        id: tile29
        x: 689
        y: 243
        width: 50
        height: 37
        source: "Images/tile8.jpg"

        MouseArea {
            id: mouseArea29
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.mirror = true
            }
            onExited: {
                parent.mirror = false
            }
            onClicked: {
                Me.makeMove(29)
            }
        }
    }

    Image {
        id: tile34
        x: 541
        y: 277
        width: 50
        height: 37
        source: "Images/tile9.jpg"

        MouseArea {
            id: mouseArea34
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.mirror = true
            }
            onExited: {
                parent.mirror = false
            }
            onClicked: {
                Me.makeMove(34)
            }
        }
    }

    Image {
        id: tile35
        x: 590
        y: 277
        width: 50
        height: 37
        source: "Images/tile10.jpg"

        MouseArea {
            id: mouseArea35
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.mirror = true
            }
            onExited: {
                parent.mirror = false
            }
            onClicked: {
                Me.makeMove(35)
            }
        }
    }

    Image {
        id: tile36
        x: 639
        y: 277
        width: 50
        height: 37
        source: "Images/tile11.jpg"

        MouseArea {
            id: mouseArea36
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.mirror = true
            }
            onExited: {
                parent.mirror = false
            }
            onClicked: {
                Me.makeMove(36)
            }
        }
    }

    Image {
        id: tile37
        x: 689
        y: 277
        width: 50
        height: 37
        source: "Images/tile12.jpg"

        MouseArea {
            id: mouseArea37
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.mirror = true
            }
            onExited: {
                parent.mirror = false
            }
            onClicked: {
                Me.makeMove(37)
            }
        }
    }

    Image {
        id: tile41
        x: 541
        y: 312
        width: 50
        height: 37
        source: "Images/tile13.jpg"

        MouseArea {
            id: mouseArea41
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.mirror = true
            }
            onExited: {
                parent.mirror = false
            }
            onClicked: {
                Me.makeMove(41)
            }
        }
    }

    Image {
        id: tile42
        x: 590
        y: 312
        width: 50
        height: 37
        source: "Images/tile14.jpg"

        MouseArea {
            id: mouseArea42
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.mirror = true
            }
            onExited: {
                parent.mirror = false
            }
            onClicked: {
                Me.makeMove(42)
            }
        }
    }

    Image {
        id: tile43
        x: 639
        y: 312
        width: 50
        height: 37
        source: "Images/tile15.jpg"

        MouseArea {
            id: mouseArea43
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.mirror = true
            }
            onExited: {
                parent.mirror = false
            }
            onClicked: {
                Me.makeMove(43)
            }
        }
    }

    Image {
        id: tile44
        x: 689
        y: 312
        width: 50
        height: 37
        source: "Images/tile16.jpg"

        MouseArea {
            id: mouseArea44
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.mirror = true
            }
            onExited: {
                parent.mirror = false
            }
            onClicked: {
                Me.makeMove(44)
            }
        }
    }

    Image {
        id: tile12
        x: 541
        y: 133
        width: 50
        height: 37
        source: "Images/tile9.jpg"

        MouseArea {
            id: mouseArea12
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.mirror = true
            }
            onExited: {
                parent.mirror = false
            }
            onClicked: {
                Me.makeMove(12)
            }
        }
    }

    Image {
        id: tile13
        x: 590
        y: 133
        width: 50
        height: 37
        source: "Images/tile10.jpg"

        MouseArea {
            id: mouseArea13
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.mirror = true
            }
            onExited: {
                parent.mirror = false
            }
            onClicked: {
                Me.makeMove(13)
            }
        }
    }

    Image {
        id: tile16
        x: 541
        y: 170
        width: 50
        height: 37
        source: "Images/tile13.jpg"

        MouseArea {
            id: mouseArea16
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.mirror = true
            }
            onExited: {
                parent.mirror = false
            }
            onClicked: {
                Me.makeMove(16)
            }
        }
    }

    Image {
        id: tile17
        x: 590
        y: 170
        width: 50
        height: 37
        source: "Images/tile14.jpg"

        MouseArea {
            id: mouseArea17
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.mirror = true
            }
            onExited: {
                parent.mirror = false
            }
            onClicked: {
                Me.makeMove(17)
            }
        }
    }

    Image {
        id: tile23
        x: 738
        y: 206
        width: 50
        height: 37
        source: "Images/tile1.jpg"

        MouseArea {
            id: mouseArea23
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.mirror = true
            }
            onExited: {
                parent.mirror = false
            }
            onClicked: {
                Me.makeMove(23)
            }
        }
    }

    Image {
        id: tile24
        x: 787
        y: 206
        width: 50
        height: 37
        source: "Images/tile2.jpg"

        MouseArea {
            id: mouseArea24
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.mirror = true
            }
            onExited: {
                parent.mirror = false
            }
            onClicked: {
                Me.makeMove(24)
            }
        }
    }

    Image {
        id: tile30
        x: 738
        y: 243
        width: 50
        height: 37
        source: "Images/tile5.jpg"

        MouseArea {
            id: mouseArea30
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.mirror = true
            }
            onExited: {
                parent.mirror = false
            }
            onClicked: {
                Me.makeMove(30)
            }
        }
    }

    Image {
        id: tile31
        x: 788
        y: 243
        width: 50
        height: 37
        source: "Images/tile6.jpg"

        MouseArea {
            id: mouseArea31
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.mirror = true
            }
            onExited: {
                parent.mirror = false
            }
            onClicked: {
                Me.makeMove(31)
            }
        }
    }

    Image {
        id: tile38
        x: 738
        y: 277
        width: 50
        height: 37
        source: "Images/tile9.jpg"

        MouseArea {
            id: mouseArea38
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.mirror = true
            }
            onExited: {
                parent.mirror = false
            }
            onClicked: {
                Me.makeMove(38)
            }
        }
    }

    Image {
        id: tile45
        x: 738
        y: 312
        width: 50
        height: 37
        source: "Images/tile13.jpg"

        MouseArea {
            id: mouseArea45
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.mirror = true
            }
            onExited: {
                parent.mirror = false
            }
            onClicked: {
                Me.makeMove(45)
            }
        }
    }

    Image {
        id: tile54
        x: 738
        y: 423
        width: 50
        height: 37
        source: "Images/tile3.jpg"

        MouseArea {
            id: mouseArea54
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.mirror = true
            }
            onExited: {
                parent.mirror = false
            }
            onClicked: {
                Me.makeMove(54)
            }
        }
    }

    Image {
        id: tile61
        x: 738
        y: 460
        width: 50
        height: 37
        source: "Images/tile7.jpg"

        MouseArea {
            id: mouseArea61
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.mirror = true
            }
            onExited: {
                parent.mirror = false
            }
            onClicked: {
                Me.makeMove(61)
            }
        }
    }

    Image {
        id: tile62
        x: 788
        y: 460
        width: 50
        height: 37
        source: "Images/tile8.jpg"

        MouseArea {
            id: mouseArea62
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.mirror = true
            }
            onExited: {
                parent.mirror = false
            }
            onClicked: {
                Me.makeMove(62)
            }
        }
    }

    Image {
        id: tile69
        x: 738
        y: 497
        width: 50
        height: 37
        source: "Images/tile11.jpg"

        MouseArea {
            id: mouseArea69
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.mirror = true
            }
            onExited: {
                parent.mirror = false
            }
            onClicked: {
                Me.makeMove(69)
            }
        }
    }

    Image {
        id: tile70
        x: 787
        y: 497
        width: 50
        height: 37
        source: "Images/tile12.jpg"

        MouseArea {
            id: mouseArea70
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.mirror = true
            }
            onExited: {
                parent.mirror = false
            }
            onClicked: {
                Me.makeMove(70)
            }
        }
    }

    Image {
        id: tile77
        x: 738
        y: 534
        width: 50
        height: 37
        source: "Images/tile15.jpg"

        MouseArea {
            id: mouseArea77
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.mirror = true
            }
            onExited: {
                parent.mirror = false
            }
            onClicked: {
                Me.makeMove(77)
            }
        }
    }









    Image {
        id: tile10
        x: 442
        y: 133
        width: 50
        height: 37
        source: "Images/tile3.jpg"

        MouseArea {
            id: mouseArea10
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0
            hoverEnabled: true
            anchors.fill: parent
            onEntered: {
                parent.mirror = true
            }
            onExited: {
                parent.mirror = false
            }
            onClicked: {
                Me.makeMove(10)
            }
        }
    }

    Image {
        id: tile11
        x: 491
        y: 133
        width: 50
        height: 37
        source: "Images/tile4.jpg"

        MouseArea {
            id: mouseArea11
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.mirror = true
            }
            onExited: {
                parent.mirror = false
            }
            onClicked: {
                Me.makeMove(11)
            }
        }
    }

    Image {
        id: tile78
        x: 788
        y: 534
        width: 50
        height: 37
        source: "Images/tile16.jpg"

        MouseArea {
            id: mouseArea78
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.mirror = true
            }
            onExited: {
                parent.mirror = false
            }
            onClicked: {
                Me.makeMove(78)
            }
        }
    }



    Image {
        id: tile48
        x: 738
        y: 349
        width: 50
        height: 37
        source: "Images/tile2.jpg"

        MouseArea {
            id: mouseArea48
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.mirror = true
            }
            onExited: {
                parent.mirror = false
            }
            onClicked: {
                Me.makeMove(48)
            }
        }
    }



    Image {
        id: tile51
        x: 738
        y: 386
        width: 50
        height: 37
        source: "Images/tile6.jpg"

        MouseArea {
            id: mouseArea51
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.mirror = true
            }
            onExited: {
                parent.mirror = false
            }
            onClicked: {
                Me.makeMove(51)
            }
        }
    }

    Button {
        id: cardsButton
        x: 8
        y: 680
        width: 182
        height: 40
        text: qsTr("My Cards")
        opacity: 0
        onClicked: {
            cardsPane.state == 'Raised' ? cardsPane.state = "" : cardsPane.state = "Raised"
        }
    }

    Button {
        id: notesButton
        x: 1090
        y: 680
        width: 182
        height: 40
        text: qsTr("My Notes")
        opacity: 0

        onClicked: {
            notesPane.state == 'Raised' ? notesPane.state = "" : notesPane.state = "Raised"
        }
    }
    Pane {
        id: notesPane
        x: 602
        y: 720
        width: 482
        height: 382
        z: 1

        CheckBox {
            id: checkBox1
            x: 0
            y: 0
            width: 150
            height: 40
            text: qsTr("Hall")
            tristate: true
        }

        CheckBox {
            id: checkBox2
            x: 0
            y: 163
            width: 150
            height: 40
            text: qsTr("Lounge")
            tristate: true
        }

        CheckBox {
            id: checkBox3
            x: 0
            y: 41
            width: 150
            height: 40
            text: qsTr("Billiard Room")
            tristate: true
        }

        CheckBox {
            id: checkBox4
            x: 0
            y: 82
            width: 150
            height: 40
            text: qsTr("Stydy Room")
            tristate: true
        }

        CheckBox {
            id: checkBox5
            x: 0
            y: 122
            width: 150
            height: 40
            text: qsTr("Garage")
            tristate: true
        }

        CheckBox {
            id: checkBox6
            x: 156
            y: 41
            width: 150
            height: 40
            text: qsTr("Peach")
            tristate: true
        }

        CheckBox {
            id: checkBox7
            x: 0
            y: 281
            width: 150
            height: 40
            text: qsTr("Bathroom")
            tristate: true
        }

        CheckBox {
            id: checkBox8
            x: 0
            y: 320
            width: 150
            height: 40
            text: qsTr("Dining Room")
            tristate: true
        }

        CheckBox {
            id: checkBox9
            x: 156
            y: 0
            width: 150
            height: 40
            text: qsTr("Green")
            tristate: true
        }

        CheckBox {
            id: checkBox10
            x: 0
            y: 241
            width: 150
            height: 40
            text: qsTr("Bedroom")
            tristate: true
        }

        CheckBox {
            id: checkBox11
            x: 0
            y: 202
            width: 150
            height: 40
            text: qsTr("Kitchen")
            tristate: true
        }

        CheckBox {
            id: checkBox12
            x: 156
            y: 202
            width: 150
            height: 40
            text: qsTr("White")
            tristate: true
        }

        CheckBox {
            id: checkBox13
            x: 156
            y: 163
            width: 150
            height: 40
            text: qsTr("Scarlet")
            tristate: true
        }

        CheckBox {
            id: checkBox14
            x: 156
            y: 122
            width: 150
            height: 40
            text: qsTr("Plum")
            tristate: true
        }

        CheckBox {
            id: checkBox15
            x: 156
            y: 82
            width: 150
            height: 40
            text: qsTr("Peacock")
            tristate: true
        }

        CheckBox {
            id: checkBox16
            x: 312
            y: 0
            width: 150
            height: 40
            text: qsTr("Rope")
            tristate: true
        }

        CheckBox {
            id: checkBox17
            x: 312
            y: 41
            width: 150
            height: 40
            text: qsTr("Revolver")
            tristate: true
        }

        CheckBox {
            id: checkBox18
            x: 312
            y: 82
            width: 150
            height: 40
            text: qsTr("Candlestick")
            tristate: true
        }

        CheckBox {
            id: checkBox19
            x: 312
            y: 122
            width: 150
            height: 40
            text: qsTr("Axe")
            tristate: true
        }

        CheckBox {
            id: checkBox20
            x: 312
            y: 163
            width: 150
            height: 40
            text: qsTr("Poison")
            tristate: true
        }

        CheckBox {
            id: checkBox21
            x: 312
            y: 202
            width: 150
            height: 40
            text: qsTr("Syringe")
            tristate: true
        }
        states: State {
            name : "Raised"
            PropertyChanges{ target : notesPane; y : gameform.height - notesPane.height}
        }
        transitions: Transition {
            NumberAnimation { properties: "y"; easing.type: Easing.InOutQuad }
        }


    }

    Pane {
        id: cardsPane
        x: 196
        y: 720
        width: 584
        height: 284
        function loadCards(fcard, scard, tcard){
            card1.source = fcard
            card2.source = scard
            card3.source = tcard
        }

        Image {
            id: card1
            x: 0
            y: 0
            width: 187
            height: 257
            source: "Images/mustard.jpg"
        }

        Image {
            id: card2
            x: 188
            y: 0
            width: 187
            height: 257
            source: "Images/billiard.jpg"
        }

        Image {
            id: card3
            x: 375
            y: 0
            width: 187
            height: 257
            source: "Images/poison.jpg"
        }
        states: [
            State {
                name: "Raised"
                PropertyChanges {
                    target: cardsPane
                    y: gameform.height - cardsPane.height
                }
            }]
        transitions: [
            Transition {
                NumberAnimation {
                    properties: "y"
                    easing.type: Easing.InOutQuad
                }
            }]
    }

    MouseArea {
        id: mouseArea8
        x: 161
        y: 71
        width: 277
        height: 198
        onClicked: {
            Me.makeMove(8)
        }
    }

    MouseArea {
        id: mouseArea9
        x: 454
        y: 8
        width: 183
        height: 116
        onClicked: {
            Me.makeMove(9)
        }
    }

    MouseArea {
        id: mouseArea0
        x: 540
        y: 348
        width: 198
        height: 111
        onClicked: {
            Me.makeMove(0)
        }
    }

    MouseArea {
        id: mouseArea2
        x: 212
        y: 279
        width: 227
        height: 216
        onClicked: {
            Me.makeMove(2)
        }
    }

    MouseArea {
        id: mouseArea5
        x: 211
        y: 505
        width: 223
        height: 201
        onClicked: {
            Me.makeMove(5)
        }
    }

    MouseArea {
        id: mouseArea1
        x: 446
        y: 609
        width: 394
        height: 111
        onClicked: {
            Me.makeMove(1)
        }
    }

    MouseArea {
        id: mouseArea6
        x: 846
        y: 471
        width: 244
        height: 199
        onClicked: {
            Me.makeMove(6)
        }
    }

    MouseArea {
        id: mouseArea4
        x: 797
        y: 289
        width: 316
        height: 165
        onClicked: {
            Me.makeMove(4)
        }
    }

    MouseArea {
        id: mouseArea7
        x: 846
        y: 72
        width: 237
        height: 197
        onClicked: {
            Me.makeMove(7)
        }
    }

    Image {
        id: plum
        x: 1209
        y: 492
        width: 40
        height: 50
        opacity: 0
        z: 1
        source: "Images/plumpeg.png"
        clip: true
    }

    Image {
        id: scarlet
        x: 31
        y: 104
        width: 40
        height: 50
        opacity: 0
        z: 1
        source: "Images/scarletpeg.png"
        clip: true
    }

    Image {
        id: white
        x: 31
        y: 306
        width: 40
        height: 50
        opacity: 0
        z: 1
        source: "Images/whitepeg.png"
        clip: true
    }

    Image {
        id: peach
        x: 1209
        y: 306
        width: 40
        height: 50
        opacity: 0
        z: 1
        source: "Images/mustardpeg.png"
        clip: true
    }

    Image {
        id: green
        x: 1210
        y: 104
        width: 40
        height: 50
        opacity: 0
        z: 1
        clip: true
        source: "Images/greenpeg.png"



    }

    Image {
        id: peacock
        x: 31
        y: 492
        width: 40
        height: 50
        opacity: 0
        z: 1
        source: "Images/peacockpeg.png"
        clip: true
    }

    MouseArea {
        id: mouseArea3
        x: 650
        y: 35
        width: 182
        height: 162
        onClicked: {
            Me.makeMove(3)
        }
    }

    Popup {
        id : showGuess
        property var c1: ""
        property var c2: ""
        property var c3: ""
        property var character : ""
        implicitWidth: 800
        implicitHeight: 600
        x : parent.width/2 - implicitWidth/2
        y : parent.height/2 - implicitHeight/2
        modal : true
        focus : true

        contentItem: ColumnLayout {
            spacing : 30
            anchors.centerIn: parent
            Label {
                id : accusation
                Layout.alignment: Qt.AlignCenter
                text : showGuess.character + " made a guess!"
                font.bold: true
                font.pointSize: 32
            }
            RowLayout {
                spacing: 30
                implicitHeight : 100
                Layout.alignment: Qt.AlignCenter
                Image {
                    id: firstCard
                    Layout.preferredHeight: 257
                    Layout.preferredWidth: 187
                    source: showGuess.c1
                }

                Image {
                    id: secondCard
                    Layout.preferredHeight: 257
                    Layout.preferredWidth: 187
                    source: showGuess.c2
                }

                Image {
                    id: thirdCard
                    Layout.preferredHeight: 257
                    Layout.preferredWidth: 187
                    source: showGuess.c3
                }
            }

            Button {
                id : okButton
                text : "Ok"
                Layout.alignment: Qt.AlignCenter
                onClicked: {
                    showGuess.close()
                }
            }
        }
    }

    Popup {
        id : showResponse
        property var c1: ""
        property var c2: ""
        property var c3: ""
        implicitWidth: 800
        implicitHeight: 600
        x : parent.width/2 - implicitWidth/2
        y : parent.height/2 - implicitHeight/2
        modal : true
        focus : true
        contentItem: ColumnLayout {
            spacing : 30
            anchors.centerIn: parent
            Label {
                Layout.alignment: Qt.AlignCenter
                text : "You need to respond to the request"
                font.bold: true
                font.pointSize: 32
            }
            RowLayout {
                spacing: 30
                implicitHeight : 100
                Layout.alignment: Qt.AlignCenter
                Image {
                    Layout.preferredHeight: 257
                    Layout.preferredWidth: 187
                    source: showResponse.c1
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            Me.showCard(0)
                            showResponse.close()
                        }
                    }
                }

                Image {
                    Layout.preferredHeight: 257
                    Layout.preferredWidth: 187
                    source: showResponse.c2
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            Me.showCard(1)
                            showResponse.close()
                        }
                    }
                }

                Image {
                    Layout.preferredHeight: 257
                    Layout.preferredWidth: 187
                    source: showResponse.c3
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            Me.showCard(2)
                            showResponse.close()
                        }
                    }
                }
            }

        }
    }

    Popup {
        id : sendAccuseSuspect
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
                text : "Choose a suspect:"
                font.bold: true
                font.pointSize: 32
            }



            RowLayout {
                spacing: 30
                implicitHeight : 100
                Layout.alignment: Qt.AlignCenter
                Image {
                    Layout.preferredHeight: 257
                    Layout.preferredWidth: 187
                    source: "Images/green.jpg"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            sendAccuseSuspect.close()
                            cardCharacter = 10
                            sendAccuseWeapon.open()
                        }
                    }
                }

                Image {
                    Layout.preferredHeight: 257
                    Layout.preferredWidth: 187
                    source: "Images/peach.jpg"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            sendAccuseSuspect.close()
                            cardCharacter = 11
                            sendAccuseWeapon.open()
                        }
                    }
                }

                Image {
                    Layout.preferredHeight: 257
                    Layout.preferredWidth: 187
                    source: "Images/peacock.jpg"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            sendAccuseSuspect.close()
                            cardCharacter = 12
                            sendAccuseWeapon.open()
                        }
                    }
                }
            }

            RowLayout {
                spacing: 30
                implicitHeight : 100
                Layout.alignment: Qt.AlignCenter
                Image {
                    Layout.preferredHeight: 257
                    Layout.preferredWidth: 187
                    source: "Images/plum.jpg"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            sendAccuseSuspect.close()
                            cardCharacter = 13
                            sendAccuseWeapon.open()
                        }
                    }
                }

                Image {
                    Layout.preferredHeight: 257
                    Layout.preferredWidth: 187
                    source: "Images/scarlet.jpg"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            sendAccuseSuspect.close()
                            cardCharacter = 14
                            sendAccuseWeapon.open()
                        }
                    }
                }

                Image {
                    Layout.preferredHeight: 257
                    Layout.preferredWidth: 187
                    source: "Images/white.jpg"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            sendAccuseSuspect.close()
                            cardCharacter = 15
                            sendAccuseWeapon.open()
                        }
                    }
                }
            }
        }
    }
    Popup {
        id : sendAccuseWeapon
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
                text : "Choose a weapon:"
                font.bold: true
                font.pointSize: 32
            }



            RowLayout {
                spacing: 30
                implicitHeight : 100
                Layout.alignment: Qt.AlignCenter
                Image {
                    Layout.preferredHeight: 257
                    Layout.preferredWidth: 187
                    source: "Images/rope.jpg"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            sendAccuseWeapon.close()
                            Me.guessResponse(cardCharacter,16)
                        }
                    }
                }

                Image {
                    Layout.preferredHeight: 257
                    Layout.preferredWidth: 187
                    source: "Images/revolver.jpg"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            sendAccuseWeapon.close()
                            Me.guessResponse(cardCharacter,17)
                        }
                    }
                }

                Image {
                    Layout.preferredHeight: 257
                    Layout.preferredWidth: 187
                    source: "Images/axe.jpg"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            sendAccuseWeapon.close()
                            Me.guessResponse(cardCharacter,18)
                        }
                    }
                }
            }

            RowLayout {
                spacing: 30
                implicitHeight : 100
                Layout.alignment: Qt.AlignCenter
                Image {
                    Layout.preferredHeight: 257
                    Layout.preferredWidth: 187
                    source: "Images/poison.jpg"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            sendAccuseWeapon.close()
                            Me.guessResponse(cardCharacter,19)
                        }
                    }
                }

                Image {
                    Layout.preferredHeight: 257
                    Layout.preferredWidth: 187
                    source: "Images/candlestick.jpg"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            sendAccuseWeapon.close()
                            Me.guessResponse(cardCharacter,20)
                        }
                    }
                }

                Image {
                    Layout.preferredHeight: 257
                    Layout.preferredWidth: 187
                    source: "Images/syringe.jpg"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            sendAccuseWeapon.close()
                            Me.guessResponse(cardCharacter,21)
                        }
                    }
                }
            }
        }
    }
















}

