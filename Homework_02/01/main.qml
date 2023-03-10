import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.1

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Знакомства")

    function register() {
        console.log("\nПользователь:\nИмя: ", name.text,
                    "\nПол: ", rbMale1.checked ? "М" : rbMale2.checked ? "Ж" : "Не указан",
                    "\nВозраст: ", age.text,
                    "\nОбразование: ", education.currentValue,
                    "\nХобби: ", hobby.text,
                    "\nГород: ", sity.text,
                    "\nО себе:\n", about.text,
                    "\n\nПартнер:",
                    "\nВозраст: от ", ageFrom.value, "до ", ageTo.value,
                    "\nПол: ", rbFindMale1.checked ? "М" : rbFindMale2.checked ? "Ж" : "Не указан",
                    "\nОбразование: ", educationFind.currentValue)
    }

    Rectangle {
        anchors.fill: parent
        color: "lightgray"

        ColumnLayout {
            anchors.left: parent.horizontalCenter
            spacing: 5
            Rectangle {
                Layout.preferredWidth: 200
                Layout.preferredHeight: 20
                color: parent.parent.color
            }
            TextField {
                id: name
                Layout.alignment: Qt.AlignHCenter
                Layout.preferredWidth: 200
                Layout.preferredHeight: 20
            }
            RadioButton {
                Layout.topMargin: 5
                id: rbMale1
                text: "М"
                onClicked: rbMale2.checked = false
                RadioButton {
                    x: parent.width + 5
                    id: rbMale2
                    text: "Ж"
                    onClicked: rbMale1.checked = false
                }
            }
            TextField {
                id: age
                Layout.alignment: Qt.AlignHCenter
                Layout.preferredWidth: 200
                Layout.preferredHeight: 20
            }
            ComboBox {
                id: education
                Layout.alignment: Qt.AlignHCenter
                model: ["нет", "среднее", "среднеспециальное", "высшее"]
                Layout.preferredWidth: 200
                Layout.preferredHeight: 20
            }
            TextField {
                id: hobby
                Layout.alignment: Qt.AlignHCenter
                Layout.preferredWidth: 200
                Layout.preferredHeight: 20
            }
            TextField {
                id: sity
                Layout.alignment: Qt.AlignHCenter
                Layout.preferredWidth: 200
                Layout.preferredHeight: 20
            }
            ScrollView {
                Layout.preferredWidth: 200
                Layout.preferredHeight: 100
                TextArea {
                    id: about
                    Layout.preferredWidth: 200
                    Layout.preferredHeight: 100
                }
            }
            Rectangle {
                Layout.preferredWidth: 200
                Layout.preferredHeight: 45
                color: parent.parent.color
            }
            Text {
                Layout.preferredHeight: 20
                text: "От:"
                SpinBox {
                    id: ageFrom
                    width: 50
                    x: parent.width + 5
                    from: 18
                    to: 99
                    Text {
                        x: parent.width + 5
                        text: "До:"
                        SpinBox {
                            id: ageTo
                            width: 50
                            x: parent.width + 5
                            from: parent.parent.value
                            to: 99
                        }
                    }
                }
            }
            RadioButton {
                Layout.topMargin: 5
                id: rbFindMale1
                text: "М"
                onClicked: rbmale2.checked = false
                RadioButton {
                    x: parent.width + 5
                    id: rbFindMale2
                    text: "Ж"
                    onClicked: rbmale1.checked = false
                }
            }
            ComboBox {
                id: educationFind
                Layout.alignment: Qt.AlignHCenter
                model: ["нет", "среднее", "среднеспециальное", "высшее"]
                Layout.preferredWidth: 200
                Layout.preferredHeight: 20
            }
            Button {
                Layout.topMargin: 20
                text: "Регистрация"
                onClicked: register()
            }
        }
        ColumnLayout {
            anchors.right: parent.horizontalCenter
            spacing: 5
            Text {
                Layout.preferredWidth: 200
                Layout.preferredHeight: 20
                text: "Ваши данные:"
            }
            Text {
                Layout.preferredWidth: 200
                Layout.preferredHeight: 20
                text: "Имя:"
            }
            Text {
                Layout.preferredWidth: 200
                Layout.preferredHeight: 20
                text: "Пол:"
            }
            Text {
                Layout.preferredWidth: 200
                Layout.preferredHeight: 20
                text: "Возраст:"
            }
            Text {
                Layout.preferredWidth: 200
                Layout.preferredHeight: 20
                text: "Образование:"
            }
            Text {
                Layout.preferredWidth: 200
                Layout.preferredHeight: 20
                text: "Хобби:"
            }
            Text {
                Layout.preferredWidth: 200
                Layout.preferredHeight: 20
                text: "Город:"
            }
            Text {
                Layout.preferredWidth: 200
                Layout.preferredHeight: 100
                text: "О себе:"
            }

            Rectangle {
                Layout.preferredWidth: 200
                Layout.preferredHeight: 20
                color: parent.parent.color
            }
            Text {
                Layout.preferredWidth: 200
                Layout.preferredHeight: 20
                text: "Кого ищем:"
            }
            Text {
                Layout.preferredWidth: 200
                Layout.preferredHeight: 20
                text: "Возрастные границы:"
            }
            Text {
                Layout.preferredWidth: 200
                Layout.preferredHeight: 20
                text: "Пол:"
            }
            Text {
                Layout.preferredWidth: 200
                Layout.preferredHeight: 20
                text: "Образование:"
            }
        }
    }
}
