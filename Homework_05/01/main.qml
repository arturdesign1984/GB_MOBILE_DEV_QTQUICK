import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12
import "points.js" as JSPoints

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Rectangle {
        anchors.fill: parent

        Canvas {
        id: mycanvas
        anchors.fill: parent
        property string selectedSHape: "star"
        property var posHor: mycanvas.width / 2
        property var posVer: mycanvas.height / 2
        property var firstV: 20
        property var secondV: 50
        property var thickness: 1
        property var thirdV: 5
        property var points: 0
        onPaint: {
            var canvasContext = getContext("2d")
                        canvasContext.clearRect(0, 0, width, height)
                        switch(mycanvas.selectedSHape) {
                        case "star":
                            var points = JSPoints.getStarPoints(posHor, posVer, firstV, secondV, thirdV)
                            break
                        case "ring":
                            points = JSPoints.getRingPoints(posHor, posVer, firstV, thickness)
                            break
                        case "house":
                            points = JSPoints.getHousePoints(posHor, posVer, firstV, secondV)
                            break
                        case "sandclock":
                            points = JSPoints.getSandclockPoints(posHor, posVer, firstV, secondV)
                            break
                        }
                        canvasContext.beginPath()
                        canvasContext.moveTo(points[0], points[1])
                        for (var i = 0; i < points.length; i+= 2) {
                            canvasContext.lineTo(points[i], points[i + 1])
                        }
                        canvasContext.closePath()
                        canvasContext.stroke()
                    }
        }
        ComboBox {
            id:comboBox
            anchors.horizontalCenter: parent.horizontalCenter
            y: parent.height/2 + 50

            model: ["star", "ring", "house", "sandclock"]
            currentIndex: 0
            onCurrentIndexChanged: {
                mycanvas.selectedSHape = model[currentIndex]
                mycanvas.requestPaint()
            }
        }
    }
}
