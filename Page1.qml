import QtQuick 2.0

Page1Form {
    startArea.onEntered: {
        startButton.font.pointSize = 40
        startButton.font.bold = true
        joinButton.font.pointSize = 28
        quitButton.font.pointSize = 28
    }
    startArea.onClicked: {
        swipeView.setCurrentIndex(2)
    }
    startArea.onExited:  {
        startButton.font.pointSize = 32
        startButton.font.bold = false
        joinButton.font.pointSize = 32
        quitButton.font.pointSize = 32
    }
    joinArea.onEntered: {
        joinButton.font.pointSize = 40
        joinButton.font.bold = true
        startButton.font.pointSize = 28
        quitButton.font.pointSize = 28
    }
    joinArea.onClicked: {
        swipeView.setCurrentIndex(1)
        UDP.start()
    }
    joinArea.onExited: {
        joinButton.font.pointSize = 32
        joinButton.font.bold = false
        startButton.font.pointSize = 32
        quitButton.font.pointSize = 32
    }
    quitArea.onEntered: {
        quitButton.font.pointSize = 40
        quitButton.font.bold = true
        startButton.font.pointSize = 28
        joinButton.font.pointSize = 28
    }
    quitArea.onClicked: {
        Qt.quit()
    }
    quitArea.onExited:  {
        quitButton.font.pointSize = 32
        quitButton.font.bold = false
        joinButton.font.pointSize = 32
        startButton.font.pointSize = 32
    }
}
