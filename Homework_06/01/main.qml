import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    id: root
    width: 640
    height: 480
    visible: true
    title: qsTr("NumbersAPI")

    property string textRequest: "0";

    function getData() {
        listview.model.clear()

        var xmlhttp = new XMLHttpRequest();
        var url = "http://numbersapi.com/" + textRequest;
        xmlhttp.onreadystatechange = function() {
            if (xmlhttp.readyState == XMLHttpRequest.DONE && xmlhttp.status == 200) {
                print(xmlhttp.responseText)
                listview.model.append({listdata: xmlhttp.responseText})
            }
        }
        xmlhttp.open("GET", url, true);
        xmlhttp.send();
    }

    Item {
        anchors.fill: parent
        ListModel {
            id: model
        }
        ListView {
            id: listview
            anchors.fill: parent
            model: model
            header: Rectangle {
                height: 35
                width: parent.width
                color: "dark green"
                Text {
                    anchors.centerIn: parent
                    text: "Данные от сервера"
                    color: "white"
                }
            }
            delegate: Rectangle {
                width: root.width
                height: 30
                Text {
                    text: listdata
                    anchors.centerIn: parent
                }
            }
        }
        Button {
            id: numButton
            anchors.bottom: parent.bottom
            width: parent.width
            text: "Интересный факт о числе"
            onClicked: dialogNum.open()
        }
        Button {
            id: mathButton
            anchors.bottom: numButton.top
            width: parent.width
            text: "О числе в математике"
            onClicked: dialogMath.open()
        }
        Button {
            id: dateButton
            anchors.bottom: mathButton.top
            width: parent.width
            text: "Интересный факт о дате"
            onClicked: dialogDate.open()
        }
        Button {
            id: yearButton
            anchors.bottom: dateButton.top
            width: parent.width
            text: "Интересный факт о годе"
            onClicked: dialogYear.open()
        }
        Button {
            id: randomNumButton
            anchors.bottom: yearButton.top
            width: parent.width
            text: "Факт случайном числе"
            onClicked: {
                textRequest = "random/trivia"
                getData()
            }
        }
        Dialog {
            id: dialogNum
            anchors.centerIn: parent
            title: "Введите число"
            standardButtons: Dialog.Ok | Dialog.Cancel
            Column {
                anchors.fill: parent
                spacing: 5
                TextField {
                    id: numberFact
                    anchors.horizontalCenter: parent.horizontalCenter
                    placeholderText: "Число"
                }
            }
            onAccepted: {
                textRequest = numberFact.text
                getData()
            }
        }
        Dialog {
            id: dialogMath
            anchors.centerIn: parent
            title: "Введите число"
            standardButtons: Dialog.Ok | Dialog.Cancel
            Column {
                anchors.fill: parent
                spacing: 5
                TextField {
                    id: numberMath
                    anchors.horizontalCenter: parent.horizontalCenter
                    placeholderText: "Число"
                }
            }
            onAccepted: {
                textRequest = numberMath.text + "/math"
                getData()
            }
        }
        Dialog {
            id: dialogDate
            anchors.centerIn: parent
            title: "Введите дату"
            standardButtons: Dialog.Ok | Dialog.Cancel
            Column {
                anchors.fill: parent
                spacing: 5
                TextField {
                    id: numberDate
                    anchors.horizontalCenter: parent.horizontalCenter
                    placeholderText: "Дата (мм/дд)"
                }
            }
            onAccepted: {
                textRequest = numberDate.text + "/date"
                getData()
            }
        }
        Dialog {
            id: dialogYear
            anchors.centerIn: parent
            title: "Введите год"
            standardButtons: Dialog.Ok | Dialog.Cancel
            Column {
                anchors.fill: parent
                spacing: 5
                TextField {
                    id: numberYear
                    anchors.horizontalCenter: parent.horizontalCenter
                    placeholderText: "Год"
                }
            }
            onAccepted: {
                textRequest = numberYear.text + "/year"
                getData()
            }
        }
    }
}

