import QtQuick 2.15
import QtQuick.Window 2.15
import Qt.labs.qmlmodels 1.0
import QtQuick.LocalStorage 2.12
import QtQuick.Controls 2.5
import "DBFunctions.js" as DbFunctions
Window {
    id: mainWindow
    width: 640
    height: 480
    visible: true
    title: qsTr("DB Example")
    property int cellHorizontalSpacing: 10

    TableModel {
        id: tableModel
        TableModelColumn { display: "id" }
        TableModelColumn { display: "first_name" }
        TableModelColumn { display: "last_name" }
        TableModelColumn { display: "email" }
        TableModelColumn { display: "phone" }
        rows: []
    }
    TableView {
        id: table
        anchors.fill: parent
        columnSpacing: 1
        rowSpacing: 1
        model: tableModel
        delegate: Rectangle {
            implicitWidth: Math.max(100, /*left*/ cellHorizontalSpacing + innerText.width + /*right*/ cellHorizontalSpacing)
            implicitHeight: 50
            border.width: 1
            Text {
                id: innerText
                text: display
                anchors.centerIn: parent
            }
        }
    }
    Button {
        id: button3
        text: "Наполнить таблицы"
        height: button2.height
        anchors.bottom: button2.bottom
        anchors.left: button2.right
        onClicked: {
            var db = LocalStorage.openDatabaseSync("DBExample", "1.0", "Пример локальной базы данных", 1000)
            var db2 = LocalStorage.openDatabaseSync("DBExample2", "1.0", "Пример локальной базы данных", 1000)
            try {
                db.transaction((tx) => {
                    DbFunctions.addContact(tx, "Иванов", "Иван", "ivanoviv2182@mail.ru", "+7(988)37333112")
                    DbFunctions.addContact(tx, "Заварнов", "Владимир", "zavlad@mail.ru", "+7(977)98373331")
                    DbFunctions.addContact(tx, "Говорун", "Максим", "landlord2000@mail.ru", "+7(977)3311111")
                })
                db2.transaction((tx) => {
                    DbFunctions.addContact(tx, "Петров", "Петр", "petrov@mail.ru", "+7(921)3854735")
                    DbFunctions.addContact(tx, "Сидоров", "Тимур", "timur@mail.ru", "+7(911)3856983")
                    DbFunctions.addContact(tx, "Ковальчук", "Анна", "abracadabra@mail.ru", "+7(999)2200000")
                })
                db.transaction((tx) => { DbFunctions.readContacts(tx, table.model) })
            } catch (err) {
                console.log("Error creating or updating table in database: " + err)
            }
        }
    }
    Component.onCompleted: {
        var data_array = ListModel
        var db = LocalStorage.openDatabaseSync("DBExample", "1.0", "Пример локальной базы данных", 1000)
        var db2 = LocalStorage.openDatabaseSync("DBExample2", "1.0", "Пример локальной базы данных", 1000)
        try {
            db.transaction(DbFunctions.createSimpleTable);
            db2.transaction(DbFunctions.createSimpleTable);
        } catch (err) {
            console.log("Error creating or updating table in database: " + err)
        }
    }
    ComboBox {
        id: comboBox
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.margins: 5
//        textRole: "key"
        model: ListModel {
            ListElement { text: "DBExample" }
            ListElement { text: "DBExample2" }
        }
        onDisplayTextChanged: {
            var data_array = ListModel
            var db = LocalStorage.openDatabaseSync(comboBox.currentText, "1.0", "Пример локальной базы данных", 1000)
            tableModel.clear()
            db.transaction((tx) => { DbFunctions.readContacts(tx, table.model) })
        }
    }
    Dialog {
        id: dialog
        anchors.centerIn: parent
        title: "Add person"
        standardButtons: Dialog.Ok | Dialog.Cancel
        Column {
            anchors.fill: parent
            spacing: 5
            TextField {
                id: firstName
                placeholderText: "Имя"
            }
            TextField {
                id: lastName
                placeholderText: "Фамилия"
            }
            TextField {
                id: email
                placeholderText: "E-mail"
            }
            TextField {
                id: phone
                placeholderText: "Номер телефона"
            }
        }
        onAccepted: {
            var db = LocalStorage.openDatabaseSync(comboBox.currentText, "1.0", "Пример локальной базы данных", 1000)
            try {
                db.transaction((tx) => {
                    var resObj = DbFunctions.addContact(tx, firstName.text, lastName.text, email.text, phone.text);
                })
                tableModel.clear()
                db.transaction((tx) => { DbFunctions.readContacts(tx, table.model) })
            } catch (err) {
                console.log("Error creating or updating table in database: " + err)
            }
        }
    }
    Button {
        id: button
        text: "Добавить человека"
        height: comboBox.height
        anchors.bottom: comboBox.bottom
        anchors.left: comboBox.right
        onClicked: dialog.open()
    }

    Dialog {
        id: dialog2
        anchors.centerIn: parent
        title: "Change data"
        standardButtons: Dialog.Ok | Dialog.Cancel
        Column {
            anchors.fill: parent
            spacing: 5
            TextField {
                id: contactID
                placeholderText: "ID"
            }
            TextField {
                id: firstName2
                placeholderText: "Имя"
            }
            TextField {
                id: lastName2
                placeholderText: "Фамилия"
            }
            TextField {
                id: email2
                placeholderText: "E-mail"
            }
            TextField {
                id: phone2
                placeholderText: "Номер телефона"
            }
        }
        onAccepted: {
            var db = LocalStorage.openDatabaseSync(comboBox.currentText, "1.0", "Пример локальной базы данных", 1000)
            try {
                db.transaction((tx) => {
                    var resObj = DbFunctions.changeContact(tx, contactID.text, firstName2.text, lastName2.text, email2.text, phone2.text);
                })
                tableModel.clear()
                db.transaction((tx) => { DbFunctions.readContacts(tx, table.model) })
            } catch (err) {
                console.log("Error creating or updating table in database: " + err)
            }
        }
    }
    Button {
        id: button2
        text: "Изменить запись по ID"
        height: button.height
        anchors.bottom: button.bottom
        anchors.left: button.right
        onClicked: dialog2.open()
    }
}
