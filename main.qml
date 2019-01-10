import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

ApplicationWindow {
    visible: true
    width: 1000
    height: 720
    title: qsTr("Cluedo")
    id : mainwindow
    SwipeView {
        id: swipeView
        anchors.fill: parent


        Page1 {
        }

        JoinForm {
        }

        StartForm{
        }

        Lobby{
        }

    }

    GameForm {
        id : gameform
        visible : false
        enabled : false
    }

    ParallelAnimation {
        id: growanim
            NumberAnimation {
                target: mainwindow
                properties: "width"
                easing.type: Easing.InOutQuad
                duration: 2000
                to: 1280
            }
            NumberAnimation {
                target: mainwindow
                properties: "x"
                easing.type: Easing.InOutQuad
                duration: 2000
                to: mainwindow.x - 140
            }
            onStopped: {
                showanim.start()
            }
     }
    SequentialAnimation{
        id : showanim
        onStarted: {
            gameform.tile10.visible = true
            gameform.tile11.visible = true
            gameform.tile12.visible = true
            gameform.tile13.visible = true
            gameform.tile14.visible = true
            gameform.tile15.visible = true
            gameform.tile16.visible = true
            gameform.tile17.visible = true
            gameform.tile18.visible = true
            gameform.tile19.visible = true
            gameform.tile20.visible = true
            gameform.tile21.visible = true
            gameform.tile22.visible = true
            gameform.tile23.visible = true
            gameform.tile24.visible = true
            gameform.tile25.visible = true
            gameform.tile26.visible = true
            gameform.tile27.visible = true
            gameform.tile28.visible = true
            gameform.tile29.visible = true
            gameform.tile30.visible = true
            gameform.tile31.visible = true
            gameform.tile32.visible = true
            gameform.tile33.visible = true
            gameform.tile34.visible = true
            gameform.tile35.visible = true
            gameform.tile36.visible = true
            gameform.tile37.visible = true
            gameform.tile38.visible = true
            gameform.tile39.visible = true
            gameform.tile40.visible = true
            gameform.tile41.visible = true
            gameform.tile42.visible = true
            gameform.tile43.visible = true
            gameform.tile44.visible = true
            gameform.tile45.visible = true
            gameform.tile46.visible = true
            gameform.tile47.visible = true
            gameform.tile48.visible = true
            gameform.tile49.visible = true
            gameform.tile50.visible = true
            gameform.tile51.visible = true
            gameform.tile52.visible = true
            gameform.tile53.visible = true
            gameform.tile54.visible = true
            gameform.tile55.visible = true
            gameform.tile56.visible = true
            gameform.tile57.visible = true
            gameform.tile58.visible = true
            gameform.tile59.visible = true
            gameform.tile60.visible = true
            gameform.tile61.visible = true
            gameform.tile62.visible = true
            gameform.tile63.visible = true
            gameform.tile64.visible = true
            gameform.tile65.visible = true
            gameform.tile66.visible = true
            gameform.tile67.visible = true
            gameform.tile68.visible = true
            gameform.tile69.visible = true
            gameform.tile70.visible = true
            gameform.tile71.visible = true
            gameform.tile72.visible = true
            gameform.tile73.visible = true
            gameform.tile74.visible = true
            gameform.tile75.visible = true
            gameform.tile76.visible = true
            gameform.tile77.visible = true
            gameform.tile78.visible = true
            gameform.tile79.visible = true
            gameform.tile80.visible = true
            gameform.tile81.visible = true
            gameform.tile82.visible = true
        }
        ParallelAnimation {

            NumberAnimation {
                target: gameform.tile10
                property: "x"
                duration: 4000
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile10.x

            }
            NumberAnimation {
                target: gameform.tile10
                property: "y"
                duration: 4000
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile10.y
            }
            RotationAnimation {
                target : gameform.tile10
                from : 180
                to : 0
                duration : 4000
            }
            NumberAnimation {
                target: gameform.tile11
                property: "x"
                duration: 1900
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile11.x

            }
            NumberAnimation {
                target: gameform.tile11
                property: "y"
                duration: 200
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile11.y
            }
            RotationAnimation {
                target : gameform.tile11
                from : 180
                to : 0
                duration : 2000
            }
            NumberAnimation {
                target: gameform.tile12
                property: "x"
                duration: 888
                easing.type: Easing.InOutQuad
                from : 100
                to : gameform.tile12.x

            }
            NumberAnimation {
                target: gameform.tile12
                property: "y"
                duration: 777
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile12.y
            }
            RotationAnimation {
                target : gameform.tile12
                from : 180
                to : 0
                duration : 2000
            }
            NumberAnimation {
                target: gameform.tile13
                property: "x"
                duration: 1000
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile13.x

            }
            NumberAnimation {
                target: gameform.tile13
                property: "y"
                duration: 2100
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile13.y
            }
            RotationAnimation {
                target : gameform.tile13
                from : 180
                to : 0
                duration : 800
            }
            NumberAnimation {
                target: gameform.tile14
                property: "x"
                duration: 500
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile14.x

            }
            NumberAnimation {
                target: gameform.tile14
                property: "y"
                duration: 700
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile14.y
            }
            RotationAnimation {
                target : gameform.tile14
                from : 180
                to : 0
                duration : 2000
            }
            NumberAnimation {
                target: gameform.tile15
                property: "x"
                duration: 2000
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile15.x

            }
            NumberAnimation {
                target: gameform.tile15
                property: "y"
                duration: 1500
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile15.y
            }
            RotationAnimation {
                target : gameform.tile15
                from : 180
                to : 0
                duration : 800
            }
            NumberAnimation {
                target: gameform.tile16
                property: "x"
                duration: 2000
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile16.x

            }
            NumberAnimation {
                target: gameform.tile16
                property: "y"
                duration: 700
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile16.y
            }
            RotationAnimation {
                target : gameform.tile16
                from : 180
                to : 0
                duration : 2000
            }
            NumberAnimation {
                target: gameform.tile17
                property: "x"
                duration: 2000
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile17.x

            }
            NumberAnimation {
                target: gameform.tile17
                property: "y"
                duration: 800
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile17.y
            }
            RotationAnimation {
                target : gameform.tile17
                from : 180
                to : 0
                duration : 700
            }
            NumberAnimation {
                target: gameform.tile18
                property: "x"
                duration: 2000
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile18.x

            }
            NumberAnimation {
                target: gameform.tile18
                property: "y"
                duration: 500
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile18.y
            }
            RotationAnimation {
                target : gameform.tile18
                from : 180
                to : 0
                duration : 1500
            }
            NumberAnimation {
                target: gameform.tile19
                property: "x"
                duration: 2000
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile19.x

            }
            NumberAnimation {
                target: gameform.tile19
                property: "y"
                duration: 1700
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile19.y
            }
            RotationAnimation {
                target : gameform.tile19
                from : 180
                to : 0
                duration : 2000
            }
            NumberAnimation {
                target: gameform.tile20
                property: "x"
                duration: 1500
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile20.x

            }
            NumberAnimation {
                target: gameform.tile20
                property: "y"
                duration: 1500
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile20.y
            }
            RotationAnimation {
                target : gameform.tile20
                from : 130
                to : 0
                duration : 2000
            }
            NumberAnimation {
                target: gameform.tile21
                property: "x"
                duration: 900
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile21.x

            }
            NumberAnimation {
                target: gameform.tile21
                property: "y"
                duration: 1500
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile21.y
            }
            RotationAnimation {
                target : gameform.tile21
                from : 180
                to : 0
                duration : 1700
            }
            NumberAnimation {
                target: gameform.tile22
                property: "x"
                duration: 1500
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile22.x

            }
            NumberAnimation {
                target: gameform.tile22
                property: "y"
                duration: 1200
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile22.y
            }
            RotationAnimation {
                target : gameform.tile22
                from : 180
                to : 0
                duration : 2000
            }
            NumberAnimation {
                target: gameform.tile23
                property: "x"
                duration: 1700
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile23.x

            }
            NumberAnimation {
                target: gameform.tile23
                property: "y"
                duration: 1800
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile23.y
            }
            RotationAnimation {
                target : gameform.tile23
                from : 180
                to : 0
                duration : 2000
            }
            NumberAnimation {
                target: gameform.tile24
                property: "x"
                duration: 1300
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile24.x

            }
            NumberAnimation {
                target: gameform.tile24
                property: "y"
                duration: 800
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile24.y
            }
            RotationAnimation {
                target : gameform.tile24
                from : 180
                to : 0
                duration : 1900
            }
            NumberAnimation {
                target: gameform.tile25
                property: "x"
                duration: 700
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile25.x

            }
            NumberAnimation {
                target: gameform.tile25
                property: "y"
                duration: 250
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile25.y
            }
            RotationAnimation {
                target : gameform.tile25
                from : 80
                to : 0
                duration : 2000
            }
            NumberAnimation {
                target: gameform.tile26
                property: "x"
                duration: 1700
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile26.x

            }
            NumberAnimation {
                target: gameform.tile26
                property: "y"
                duration: 1800
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile26.y
            }
            RotationAnimation {
                target : gameform.tile26
                from : 180
                to : 0
                duration : 2000
            }
            NumberAnimation {
                target: gameform.tile27
                property: "x"
                duration: 900
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile27.x

            }
            NumberAnimation {
                target: gameform.tile27
                property: "y"
                duration: 700
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile27.y
            }
            RotationAnimation {
                target : gameform.tile27
                from : 180
                to : 0
                duration : 500
            }
            NumberAnimation {
                target: gameform.tile28
                property: "x"
                duration: 1500
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile28.x

            }
            NumberAnimation {
                target: gameform.tile28
                property: "y"
                duration: 1700
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile28.y
            }
            RotationAnimation {
                target : gameform.tile28
                from : 180
                to : 0
                duration : 2000
            }
            NumberAnimation {
                target: gameform.tile29
                property: "x"
                duration: 1700
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile29.x

            }
            NumberAnimation {
                target: gameform.tile29
                property: "y"
                duration: 1700
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile29.y
            }
            RotationAnimation {
                target : gameform.tile29
                from : 180
                to : 0
                duration : 100
            }
            NumberAnimation {
                target: gameform.tile30
                property: "x"
                duration: 800
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile30.x

            }
            NumberAnimation {
                target: gameform.tile30
                property: "y"
                duration: 900
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile30.y
            }
            RotationAnimation {
                target : gameform.tile30
                from : 180
                to : 0
                duration : 2000
            }
            NumberAnimation {
                target: gameform.tile31
                property: "x"
                duration: 1200
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile31.x

            }
            NumberAnimation {
                target: gameform.tile31
                property: "y"
                duration: 1300
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile31.y
            }
            RotationAnimation {
                target : gameform.tile31
                from : 180
                to : 0
                duration : 2000
            }
            NumberAnimation {
                target: gameform.tile32
                property: "x"
                duration: 2500
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile32.x

            }
            NumberAnimation {
                target: gameform.tile32
                property: "y"
                duration: 2300
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile32.y
            }
            RotationAnimation {
                target : gameform.tile32
                from : 180
                to : 0
                duration : 700
            }
            NumberAnimation {
                target: gameform.tile33
                property: "x"
                duration: 2000
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile33.x

            }
            NumberAnimation {
                target: gameform.tile33
                property: "y"
                duration: 2000
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile33.y
            }
            RotationAnimation {
                target : gameform.tile33
                from : 180
                to : 0
                duration : 2000
            }
            NumberAnimation {
                target: gameform.tile34
                property: "x"
                duration: 1500
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile34.x

            }
            NumberAnimation {
                target: gameform.tile34
                property: "y"
                duration: 1500
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile34.y
            }
            RotationAnimation {
                target : gameform.tile34
                from : 180
                to : 0
                duration : 2000
            }
            NumberAnimation {
                target: gameform.tile35
                property: "x"
                duration: 1700
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile35.x

            }
            NumberAnimation {
                target: gameform.tile35
                property: "y"
                duration: 1900
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile35.y
            }
            RotationAnimation {
                target : gameform.tile35
                from : 180
                to : 0
                duration : 1600
            }
            NumberAnimation {
                target: gameform.tile36
                property: "x"
                duration: 1500
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile36.x

            }
            NumberAnimation {
                target: gameform.tile36
                property: "y"
                duration: 800
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile36.y
            }
            RotationAnimation {
                target : gameform.tile36
                from : 180
                to : 0
                duration : 1700
            }
            NumberAnimation {
                target: gameform.tile37
                property: "x"
                duration: 2000
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile37.x

            }
            NumberAnimation {
                target: gameform.tile37
                property: "y"
                duration: 2000
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile37.y
            }
            RotationAnimation {
                target : gameform.tile37
                from : 180
                to : 0
                duration : 2000
            }
            NumberAnimation {
                target: gameform.tile38
                property: "x"
                duration: 1100
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile38.x

            }
            NumberAnimation {
                target: gameform.tile38
                property: "y"
                duration: 1000
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile38.y
            }
            RotationAnimation {
                target : gameform.tile38
                from : 180
                to : 0
                duration : 2000
            }
            NumberAnimation {
                target: gameform.tile39
                property: "x"
                duration: 1300
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile39.x

            }
            NumberAnimation {
                target: gameform.tile39
                property: "y"
                duration: 900
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile39.y
            }
            RotationAnimation {
                target : gameform.tile39
                from : 180
                to : 0
                duration : 500
            }
            NumberAnimation {
                target: gameform.tile40
                property: "x"
                duration: 2000
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile40.x

            }
            NumberAnimation {
                target: gameform.tile40
                property: "y"
                duration: 2000
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile40.y
            }
            RotationAnimation {
                target : gameform.tile40
                from : 180
                to : 0
                duration : 2000
            }
            NumberAnimation {
                target: gameform.tile41
                property: "x"
                duration: 1500
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile41.x

            }
            NumberAnimation {
                target: gameform.tile41
                property: "y"
                duration: 100
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile41.y
            }
            RotationAnimation {
                target : gameform.tile41
                from : 180
                to : 0
                duration : 1700
            }
            NumberAnimation {
                target: gameform.tile42
                property: "x"
                duration: 2000
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile42.x

            }
            NumberAnimation {
                target: gameform.tile42
                property: "y"
                duration: 2000
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile42.y
            }
            RotationAnimation {
                target : gameform.tile42
                from : 180
                to : 0
                duration : 2000
            }
            NumberAnimation {
                target: gameform.tile43
                property: "x"
                duration: 500
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile43.x

            }
            NumberAnimation {
                target: gameform.tile43
                property: "y"
                duration: 700
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile43.y
            }
            RotationAnimation {
                target : gameform.tile43
                from : 180
                to : 0
                duration : 130
            }
            NumberAnimation {
                target: gameform.tile44
                property: "x"
                duration: 1200
                easing.type : Easing.InOutQuad
                from : -100
                to : gameform.tile44.x

            }
            NumberAnimation {
                target: gameform.tile44
                property: "y"
                duration: 1500
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile44.y
            }
            RotationAnimation {
                target : gameform.tile44
                from : 180
                to : 0
                duration : 1100
            }
            NumberAnimation {
                target: gameform.tile45
                property: "x"
                duration: 1800
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile45.x

            }
            NumberAnimation {
                target: gameform.tile45
                property: "y"
                duration: 1900
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile45.y
            }
            RotationAnimation {
                target : gameform.tile45
                from : 180
                to : 0
                duration : 2000
            }
            NumberAnimation {
                target: gameform.tile46
                property: "x"
                duration: 2000
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile46.x

            }
            NumberAnimation {
                target: gameform.tile46
                property: "y"
                duration: 700
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile46.y
            }
            RotationAnimation {
                target : gameform.tile46
                from : 180
                to : 0
                duration : 2000
            }
            NumberAnimation {
                target: gameform.tile47
                property: "x"
                duration: 400
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile47.x

            }
            NumberAnimation {
                target: gameform.tile47
                property: "y"
                duration: 500
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile47.y
            }
            RotationAnimation {
                target : gameform.tile47
                from : 180
                to : 0
                duration : 1400
            }
            NumberAnimation {
                target: gameform.tile48
                property: "x"
                duration: 800
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile48.x

            }
            NumberAnimation {
                target: gameform.tile48
                property: "y"
                duration: 300
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile48.y
            }
            RotationAnimation {
                target : gameform.tile48
                from : 180
                to : 0
                duration : 400
            }
            NumberAnimation {
                target: gameform.tile49
                property: "x"
                duration: 2000
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile49.x

            }
            NumberAnimation {
                target: gameform.tile49
                property: "y"
                duration: 2000
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile49.y
            }
            RotationAnimation {
                target : gameform.tile49
                from : 180
                to : 0
                duration : 2000
            }
            NumberAnimation {
                target: gameform.tile50
                property: "x"
                duration: 1700
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile50.x

            }
            NumberAnimation {
                target: gameform.tile50
                property: "y"
                duration: 1800
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile50.y
            }
            RotationAnimation {
                target : gameform.tile50
                from : 180
                to : 0
                duration : 2000
            }
            NumberAnimation {
                target: gameform.tile51
                property: "x"
                duration: 1200
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile51.x

            }
            NumberAnimation {
                target: gameform.tile51
                property: "y"
                duration: 1200
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile51.y
            }
            RotationAnimation {
                target : gameform.tile51
                from : 180
                to : 0
                duration : 2000
            }
            NumberAnimation {
                target: gameform.tile52
                property: "x"
                duration: 1700
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile52.x

            }
            NumberAnimation {
                target: gameform.tile52
                property: "y"
                duration: 1700
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile52.y
            }
            RotationAnimation {
                target : gameform.tile52
                from : 180
                to : 0
                duration : 2000
            }
            NumberAnimation {
                target: gameform.tile53
                property: "x"
                duration: 1700
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile53.x

            }
            NumberAnimation {
                target: gameform.tile53
                property: "y"
                duration: 1800
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile53.y
            }
            RotationAnimation {
                target : gameform.tile53
                from : 180
                to : 0
                duration : 2000
            }
            NumberAnimation {
                target: gameform.tile54
                property: "x"
                duration: 2000
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile54.x

            }
            NumberAnimation {
                target: gameform.tile54
                property: "y"
                duration: 2000
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile54.y
            }
            RotationAnimation {
                target : gameform.tile54
                from : 180
                to : 0
                duration : 400
            }
            NumberAnimation {
                target: gameform.tile55
                property: "x"
                duration: 400
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile55.x

            }
            NumberAnimation {
                target: gameform.tile55
                property: "y"
                duration: 400
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile55.y
            }
            RotationAnimation {
                target : gameform.tile55
                from : 180
                to : 0
                duration : 400
            }
            NumberAnimation {
                target: gameform.tile56
                property: "x"
                duration: 2000
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile56.x

            }
            NumberAnimation {
                target: gameform.tile56
                property: "y"
                duration: 2000
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile56.y
            }
            RotationAnimation {
                target : gameform.tile56
                from : 180
                to : 0
                duration : 2000
            }
            NumberAnimation {
                target: gameform.tile57
                property: "x"
                duration: 900
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile57.x

            }
            NumberAnimation {
                target: gameform.tile57
                property: "y"
                duration: 800
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile57.y
            }
            RotationAnimation {
                target : gameform.tile57
                from : 180
                to : 0
                duration : 80
            }
            NumberAnimation {
                target: gameform.tile58
                property: "x"
                duration: 2000
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile58.x

            }
            NumberAnimation {
                target: gameform.tile58
                property: "y"
                duration: 2000
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile58.y
            }
            RotationAnimation {
                target : gameform.tile58
                from : 180
                to : 0
                duration : 2000
            }
            NumberAnimation {
                target: gameform.tile59
                property: "x"
                duration: 500
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile59.x

            }
            NumberAnimation {
                target: gameform.tile59
                property: "y"
                duration: 700
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile59.y
            }
            RotationAnimation {
                target : gameform.tile59
                from : 180
                to : 0
                duration : 2000
            }
            NumberAnimation {
                target: gameform.tile60
                property: "x"
                duration: 800
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile60.x

            }
            NumberAnimation {
                target: gameform.tile60
                property: "y"
                duration: 700
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile60.y
            }
            RotationAnimation {
                target : gameform.tile60
                from : 180
                to : 0
                duration : 800
            }
            NumberAnimation {
                target: gameform.tile61
                property: "x"
                duration: 2000
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile61.x

            }
            NumberAnimation {
                target: gameform.tile61
                property: "y"
                duration: 2000
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile61.y
            }
            RotationAnimation {
                target : gameform.tile61
                from : 180
                to : 0
                duration : 2000
            }
            NumberAnimation {
                target: gameform.tile62
                property: "x"
                duration: 700
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile62.x

            }
            NumberAnimation {
                target: gameform.tile62
                property: "y"
                duration: 100
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile62.y
            }
            RotationAnimation {
                target : gameform.tile62
                from : 180
                to : 0
                duration : 2000
            }
            NumberAnimation {
                target: gameform.tile63
                property: "x"
                duration: 200
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile63.x

            }
            NumberAnimation {
                target: gameform.tile63
                property: "y"
                duration: 200
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile63.y
            }
            RotationAnimation {
                target : gameform.tile63
                from : 180
                to : 0
                duration : 2000
            }
            NumberAnimation {
                target: gameform.tile64
                property: "x"
                duration: 1500
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile64.x

            }
            NumberAnimation {
                target: gameform.tile64
                property: "y"
                duration: 1777
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile64.y
            }
            RotationAnimation {
                target : gameform.tile64
                from : 180
                to : 0
                duration : 2000
            }
            NumberAnimation {
                target: gameform.tile65
                property: "x"
                duration: 1900
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile65.x

            }
            NumberAnimation {
                target: gameform.tile65
                property: "y"
                duration: 1400
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile65.y
            }
            RotationAnimation {
                target : gameform.tile65
                from : 180
                to : 0
                duration : 2000
            }
            NumberAnimation {
                target: gameform.tile66
                property: "x"
                duration: 1800
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile66.x

            }
            NumberAnimation {
                target: gameform.tile66
                property: "y"
                duration: 1700
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile66.y
            }
            RotationAnimation {
                target : gameform.tile66
                from : 180
                to : 0
                duration : 2000
            }
            NumberAnimation {
                target: gameform.tile67
                property: "x"
                duration: 1100
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile67.x

            }
            NumberAnimation {
                target: gameform.tile67
                property: "y"
                duration: 1700
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile67.y
            }
            RotationAnimation {
                target : gameform.tile67
                from : 180
                to : 0
                duration : 2000
            }
            NumberAnimation {
                target: gameform.tile68
                property: "x"
                duration: 800
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile68.x

            }
            NumberAnimation {
                target: gameform.tile68
                property: "y"
                duration: 700
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile68.y
            }
            RotationAnimation {
                target : gameform.tile68
                from : 180
                to : 0
                duration : 10
            }
            NumberAnimation {
                target: gameform.tile69
                property: "x"
                duration: 2000
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile69.x

            }
            NumberAnimation {
                target: gameform.tile69
                property: "y"
                duration: 2000
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile69.y
            }
            RotationAnimation {
                target : gameform.tile69
                from : 180
                to : 0
                duration : 2000
            }
            NumberAnimation {
                target: gameform.tile70
                property: "x"
                duration: 900
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile70.x

            }
            NumberAnimation {
                target: gameform.tile70
                property: "y"
                duration: 900
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile70.y
            }
            RotationAnimation {
                target : gameform.tile70
                from : 180
                to : 0
                duration : 2000
            }
            NumberAnimation {
                target: gameform.tile71
                property: "x"
                duration: 2000
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile71.x

            }
            NumberAnimation {
                target: gameform.tile71
                property: "y"
                duration: 2000
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile71.y
            }
            RotationAnimation {
                target : gameform.tile71
                from : 180
                to : 0
                duration : 2000
            }
            NumberAnimation {
                target: gameform.tile72
                property: "x"
                duration: 1800
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile72.x

            }
            NumberAnimation {
                target: gameform.tile72
                property: "y"
                duration: 1900
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile72.y
            }
            RotationAnimation {
                target : gameform.tile72
                from : 180
                to : 0
                duration : 1400
            }
            NumberAnimation {
                target: gameform.tile73
                property: "x"
                duration: 2000
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile73.x

            }
            NumberAnimation {
                target: gameform.tile73
                property: "y"
                duration: 2000
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile73.y
            }
            RotationAnimation {
                target : gameform.tile73
                from : 180
                to : 0
                duration : 500
            }
            NumberAnimation {
                target: gameform.tile74
                property: "x"
                duration: 1500
                easing.type: Easing.InOutQuad
                from : 100
                to : gameform.tile74.x

            }
            NumberAnimation {
                target: gameform.tile74
                property: "y"
                duration: 2000
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile74.y
            }
            RotationAnimation {
                target : gameform.tile74
                from : 180
                to : 0
                duration : 1700
            }
            NumberAnimation {
                target: gameform.tile75
                property: "x"
                duration: 1900
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile75.x

            }
            NumberAnimation {
                target: gameform.tile75
                property: "y"
                duration: 1500
                easing.type: Easing.InOutQuad
                from : 100
                to : gameform.tile75.y
            }
            RotationAnimation {
                target : gameform.tile75
                from : 180
                to : 0
                duration : 2000
            }
            NumberAnimation {
                target: gameform.tile76
                property: "x"
                duration: 2000
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile76.x

            }
            NumberAnimation {
                target: gameform.tile76
                property: "y"
                duration: 1900
                easing.type: Easing.InOutQuad
                from : -500
                to : gameform.tile76.y
            }
            RotationAnimation {
                target : gameform.tile76
                from : 120
                to : 0
                duration : 2000
            }
            NumberAnimation {
                target: gameform.tile77
                property: "x"
                duration: 2500
                easing.type: Easing.InOutQuad
                from : 200
                to : gameform.tile77.x

            }
            NumberAnimation {
                target: gameform.tile77
                property: "y"
                duration: 1700
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile77.y
            }
            RotationAnimation {
                target : gameform.tile77
                from : 180
                to : 0
                duration : 1500
            }
            NumberAnimation {
                target: gameform.tile78
                property: "x"
                duration: 1200
                easing.type: Easing.InOutQuad
                from : 100
                to : gameform.tile78.x

            }
            NumberAnimation {
                target: gameform.tile78
                property: "y"
                duration: 1800
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile78.y
            }
            RotationAnimation {
                target : gameform.tile78
                from : 20
                to : 0
                duration : 2000
            }
            NumberAnimation {
                target: gameform.tile79
                property: "x"
                duration: 2200
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile79.x

            }
            NumberAnimation {
                target: gameform.tile79
                property: "y"
                duration: 2000
                easing.type: Easing.InOutQuad
                from : 100
                to : gameform.tile79.y
            }
            RotationAnimation {
                target : gameform.tile79
                from : 180
                to : 0
                duration : 1700
            }
            NumberAnimation {
                target: gameform.tile80
                property: "x"
                duration: 900
                easing.type: Easing.InOutQuad
                from : 100
                to : gameform.tile80.x

            }
            NumberAnimation {
                target: gameform.tile80
                property: "y"
                duration: 700
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile80.y
            }
            RotationAnimation {
                target : gameform.tile80
                from : 180
                to : 0
                duration : 2000
            }
            NumberAnimation {
                target: gameform.tile81
                property: "x"
                duration: 1100
                easing.type: Easing.InOutQuad
                from : 600
                to : gameform.tile81.x

            }
            NumberAnimation {
                target: gameform.tile81
                property: "y"
                duration: 1800
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile81.y
            }
            RotationAnimation {
                target : gameform.tile81
                from : 180
                to : 0
                duration : 1700
            }
            NumberAnimation {
                target: gameform.tile82
                property: "x"
                duration: 500
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile82.x

            }
            NumberAnimation {
                target: gameform.tile82
                property: "y"
                duration: 500
                easing.type: Easing.InOutQuad
                from : -100
                to : gameform.tile82.y
            }
            RotationAnimation {
                target : gameform.tile82
                from : 180
                to : 0
                duration : 500
            }
        }
        NumberAnimation {
            targets: [gameform.boardimg,gameform.player1,gameform.player2,gameform.player3,gameform.player4,
                gameform.player5,gameform.player6,gameform.notesButton,gameform.cardsButton,gameform.peacock,
                gameform.plum,gameform.scarlet,gameform.green,gameform.white,gameform.mustard]
            property: "opacity"
            duration: 2000
            easing.type: Easing.InOutQuad
            to: 1.0
        }
}
    function grow() {
        mainwindow.height = 720
        mainwindow.x = mainwindow.x + mainwindow.width/2
        mainwindow.width = 120
        mainwindow.y = mainwindow.y - 90
        gameform.tile10.visible = false
        gameform.tile11.visible = false
        gameform.tile12.visible = false
        gameform.tile13.visible = false
        gameform.tile14.visible = false
        gameform.tile15.visible = false
        gameform.tile16.visible = false
        gameform.tile17.visible = false
        gameform.tile18.visible = false
        gameform.tile19.visible = false
        gameform.tile20.visible = false
        gameform.tile21.visible = false
        gameform.tile22.visible = false
        gameform.tile23.visible = false
        gameform.tile24.visible = false
        gameform.tile25.visible = false
        gameform.tile26.visible = false
        gameform.tile27.visible = false
        gameform.tile28.visible = false
        gameform.tile29.visible = false
        gameform.tile30.visible = false
        gameform.tile31.visible = false
        gameform.tile32.visible = false
        gameform.tile33.visible = false
        gameform.tile34.visible = false
        gameform.tile35.visible = false
        gameform.tile36.visible = false
        gameform.tile37.visible = false
        gameform.tile38.visible = false
        gameform.tile39.visible = false
        gameform.tile40.visible = false
        gameform.tile41.visible = false
        gameform.tile42.visible = false
        gameform.tile43.visible = false
        gameform.tile44.visible = false
        gameform.tile45.visible = false
        gameform.tile46.visible = false
        gameform.tile47.visible = false
        gameform.tile48.visible = false
        gameform.tile49.visible = false
        gameform.tile50.visible = false
        gameform.tile51.visible = false
        gameform.tile52.visible = false
        gameform.tile53.visible = false
        gameform.tile54.visible = false
        gameform.tile55.visible = false
        gameform.tile56.visible = false
        gameform.tile57.visible = false
        gameform.tile58.visible = false
        gameform.tile59.visible = false
        gameform.tile60.visible = false
        gameform.tile61.visible = false
        gameform.tile62.visible = false
        gameform.tile63.visible = false
        gameform.tile64.visible = false
        gameform.tile65.visible = false
        gameform.tile66.visible = false
        gameform.tile67.visible = false
        gameform.tile68.visible = false
        gameform.tile69.visible = false
        gameform.tile70.visible = false
        gameform.tile71.visible = false
        gameform.tile72.visible = false
        gameform.tile73.visible = false
        gameform.tile74.visible = false
        gameform.tile75.visible = false
        gameform.tile76.visible = false
        gameform.tile77.visible = false
        gameform.tile78.visible = false
        gameform.tile79.visible = false
        gameform.tile80.visible = false
        gameform.tile81.visible = false
        gameform.tile82.visible = false
        growanim.start()
    }

}
