import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    id: root
    width: 640
    height: 480
    visible: true
    title: qsTr("Курс валют ЦБ РФ")

    property string textRequest: "москв";

    function getData() {
        listview.model.clear()
        var xmlhttp = new XMLHttpRequest();
        var url = "https://www.cbr-xml-daily.ru/latest.js";
        xmlhttp.onreadystatechange = function() {
            if (xmlhttp.readyState == XMLHttpRequest.DONE && xmlhttp.status == 200) {
                print(xmlhttp.responseText)
                parseCBR(xmlhttp.responseText);
            } else {
                print("Запрос неудачный."  + "\nКод ошибки: " + xmlhttp.status + "\n" + xmlhttp.responseText)
            }
        }
        xmlhttp.open("GET", url, true);
        xmlhttp.send();
    }

    // Парсинг JSON ответа от сервера и запись значений в ListView
    function parseCBR(response) {
        var jsonObj = JSON.parse(response);
        var jsonCBR = jsonObj.rates
        var money = [["AUD", 1/jsonCBR.AUD], ["AZN", 1/jsonCBR.AZN], ["GBP", 1/jsonCBR.GBP], ["AMD", 1/jsonCBR.AMD],
                     ["BYN", 1/jsonCBR.BYN], ["BGN", 1/jsonCBR.BGN], ["BRL", 1/jsonCBR.BRL], ["HUF", 1/jsonCBR.HUF],
                     ["VND", 1/jsonCBR.VND], ["HKD", 1/jsonCBR.HKD], ["GEL", 1/jsonCBR.GEL], ["DKK", 1/jsonCBR.DKK],
                     ["AED", 1/jsonCBR.AED], ["USD", 1/jsonCBR.USD], ["EUR", 1/jsonCBR.EUR], ["EGP", 1/jsonCBR.EGP],
                     ["INR", 1/jsonCBR.INR], ["IDR", 1/jsonCBR.IDR], ["KZT", 1/jsonCBR.KZT], ["CAD", 1/jsonCBR.CAD],
                     ["QAR", 1/jsonCBR.QAR], ["KGS", 1/jsonCBR.KGS], ["CNY", 1/jsonCBR.CNY], ["MDL", 1/jsonCBR.MDL],
                     ["NZD", 1/jsonCBR.NZD], ["NOK", 1/jsonCBR.NOK], ["PLN", 1/jsonCBR.PLN], ["RON", 1/jsonCBR.RON],
                     ["XDR", 1/jsonCBR.XDR], ["SGD", 1/jsonCBR.SGD], ["TJS", 1/jsonCBR.TJS], ["THB", 1/jsonCBR.THB],
                     ["TRY", 1/jsonCBR.TRY], ["TMT", 1/jsonCBR.TMT], ["UZS", 1/jsonCBR.UZS], ["UAH", 1/jsonCBR.UAH],
                     ["CZK", 1/jsonCBR.CZK], ["SEK", 1/jsonCBR.SEK], ["CHF", 1/jsonCBR.CHF], ["RSD", 1/jsonCBR.RSD],
                     ["ZAR", 1/jsonCBR.ZAR], ["KRW", 1/jsonCBR.KRW], ["JPY", 1/jsonCBR.JPY]
                ]
        for(var i = 0; i < money.length ; i++){
            listview.model.append( {listdata: money[i][0] + " - " + money[i][1] + " руб."})
        }
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
            delegate: Rectangle{
                width: root.width
                height: 30
                Text {
                    text: listdata
                    anchors.centerIn: parent
                }
            }
        }
        Button {
            anchors.bottom: parent.bottom
            width: parent.width
            text: "Подтянуть данные"
            onClicked: getData()
        }
    }
}

