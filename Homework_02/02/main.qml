import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.1

Window {
    width: 640
    height: 480
    visible: true
    title: "Hello square"

    function rectangleChangeColor() {
        myRect.color = Qt.rgba(Math.random(), Math.random(), Math.random(), 1)
    }

    property bool rounded: false

    Rectangle {
        anchors.fill: parent
        color: "lightgray"

        Rectangle {
            id: myRect
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            width: 200
            height: 200
            color: "red"
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onDoubleClicked: if(!rounded) {
                                     rounded = true
                                     toRoundAnimation.start()
                                 } else {
                                     rounded = false
                                     toSquareAnimation.start()
                                 }

                acceptedButtons: Qt.LeftButton | Qt.RightButton
                onClicked: (mouse)=> {
                            if (mouse.button === Qt.RightButton) {
                                rotateAnimation.start()
                            } else {
                                rectangleChangeColor()
                            }
                }
            }
        }
        PropertyAnimation {
            id: toSquareAnimation
            target: myRect
            property: "radius"
            to: 1
            duration: 1000
        }
        PropertyAnimation {
            id: toRoundAnimation
            target: myRect
            property: "radius"
            to: 100
            duration: 1000
        }
        PropertyAnimation {
            id: rotateAnimation
            target: myRect
            property: "rotation"
            to: 360
            duration: 1000
            onRunningChanged: if (!rotateAnimation.running) {
                                  myRect.rotation = 0
                              }
        }
    }
}
