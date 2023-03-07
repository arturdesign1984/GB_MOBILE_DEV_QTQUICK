import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.1

Window {
    width: 320
    height: 240
    visible: true
    title: qsTr("Площадь треугольника")

    property real p: 0
    property real s: 0

    function geron() {
        if (inputA.text*1 !== 0 && inputB.text*1 !== 0 && inputC.text*1 !== 0) {
            p = (inputA.text*1 + inputB.text*1 + inputC.text*1) / 2
            s = Math.sqrt(p*(p-inputA.text*1)*(p-inputB.text*1)*(p-inputC.text*1))

            if(s) {
                result.text = s.toPrecision(2)
            } else {
                result.text = "Ошибка"
            }
        }
    }

    property real aB: 0
    property real bC: 0
    property real aC: 0

    function points() {
        if(inputAx.text !== "" && inputAy.text !== "" &&
            inputBx.text !== "" && inputBy.text !== "" &&
                inputCx.text !== "" && inputCy.text !== "")
        {
            aB = Math.sqrt(Math.pow(inputBx.text*1 - inputAx.text*1, 2) + Math.pow(inputBy.text*1 - inputAy.text*1,2))
            aC = Math.sqrt(Math.pow(inputCx.text*1 - inputAx.text*1, 2) + Math.pow(inputCy.text*1 - inputAy.text*1,2))
            bC = Math.sqrt(Math.pow(inputCx.text*1 - inputBx.text*1, 2) + Math.pow(inputCy.text*1 - inputBy.text*1,2))
            p = (aB + bC + aC) / 2
            s = Math.abs(Math.sqrt(p*(p-aB)*(p-aC)*(p-bC)))

            if(s) {
                result2.text = s.toPrecision(2)
            } else {
                result2.text = "Ошибка"
            }
        }
    }

    GridLayout {
        id: grid
        anchors.fill: parent
        rows: 2
        columns: 2

        Rectangle {
            color: "lightgray"
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.columnSpan: 1
            Layout.rowSpan: 1
            Layout.row: 1
            Layout.column: 1

            Text {
                text: "Вычисление по формуле Герона"
                anchors.horizontalCenter: parent.horizontalCenter
            }

            TextField {
                id: inputA
                width: 100
                height: 25
                y: 30
                anchors.right: inputB.left
                placeholderText: "введите A"
                horizontalAlignment: TextInput.AlignHCenter
                verticalAlignment: TextInput.AlignVCenter
            }

            TextField {
                id: inputB
                width: 100
                height: 25
                y: 30
                anchors.horizontalCenter: parent.horizontalCenter
                placeholderText: "введите B"
                horizontalAlignment: TextInput.AlignHCenter
                verticalAlignment: TextInput.AlignVCenter
            }

            TextField {
                id: inputC
                width: 100
                height: 25
                y: 30
                anchors.left: inputB.right
                placeholderText: "введите C"
                horizontalAlignment: TextInput.AlignHCenter
                verticalAlignment: TextInput.AlignVCenter
            }

            Button {
                id: button
                y: 60
                width: 100
                height: 25
                anchors.left: inputA.left
                text: "Вычислить"
                onClicked: geron()
            }

            TextField {
                id: result
                width: 100
                height: 25
                y: 60
                anchors.left: button.right
                horizontalAlignment: TextInput.AlignHCenter
                verticalAlignment: TextInput.AlignVCenter
            }
        }

        Rectangle {
            color: "lightgray"
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.columnSpan: 1
            Layout.rowSpan: 2
            Layout.row: 2
            Layout.column: 1

            Text {
                text: "Вычисление по координатам вершин"
                anchors.horizontalCenter: parent.horizontalCenter
            }

            TextField {
                id: inputAx
                width: 50
                height: 25
                y: 30
                anchors.right: inputAy.left
                placeholderText: "Ax"
                horizontalAlignment: TextInput.AlignHCenter
                verticalAlignment: TextInput.AlignVCenter
            }

            TextField {
                id: inputAy
                width: 50
                height: 25
                y: 30
                anchors.right: inputBx.left
                placeholderText: "Ay"
                horizontalAlignment: TextInput.AlignHCenter
                verticalAlignment: TextInput.AlignVCenter
            }

            TextField {
                id: inputBx
                width: 50
                height: 25
                y: 30
                anchors.right: parent.horizontalCenter
                placeholderText: "Bx"
                horizontalAlignment: TextInput.AlignHCenter
                verticalAlignment: TextInput.AlignVCenter
            }

            TextField {
                id: inputBy
                width: 50
                height: 25
                y: 30
                anchors.left: inputBx.right
                placeholderText: "By"
                horizontalAlignment: TextInput.AlignHCenter
                verticalAlignment: TextInput.AlignVCenter
            }

            TextField {
                id: inputCx
                width: 50
                height: 25
                y: 30
                anchors.left: inputBy.right
                placeholderText: "Cx"
                horizontalAlignment: TextInput.AlignHCenter
                verticalAlignment: TextInput.AlignVCenter
            }

            TextField {
                id: inputCy
                width: 50
                height: 25
                y: 30
                anchors.left: inputCx.right
                placeholderText: "Cy"
                horizontalAlignment: TextInput.AlignHCenter
                verticalAlignment: TextInput.AlignVCenter
            }

            Button {
                id: button2
                y: 60
                width: 100
                height: 25
                anchors.left: inputAx.left
                text: "Вычислить"
                onClicked: points()
            }

            TextField {
                id: result2
                width: 100
                height: 25
                y: 60
                anchors.left: button2.right
                horizontalAlignment: TextInput.AlignHCenter
                verticalAlignment: TextInput.AlignVCenter
            }
        }
    }
}
