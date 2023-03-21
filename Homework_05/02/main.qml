import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.1
import "LoginWindow.js" as Js

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("dynamic")
    id: parentWindow

    Rectangle {
        anchors.fill: parent

        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            text: qsTr("Логин")
            onClicked: { Js.createSpriteObjectLogin(parentWindow);
            }
        }
    }
    // я зашел в тупик. если я создаю объекты так, то неполучается динамической загрузки
    // но проходят сигналы, а если так не делать, то никак не пойму как сигнал сюда послать
    // Можно сделать кнопок конечно и возвращаться на начальный экран при удалении объекта
    // но главная проблема в форме с логином и паролем. Ни как не соображу как подгрузить
    // следующую страницу при верной идентификации. Если я загружаю объект из самой формы,
    // то объект сразу удаляется при удалении формы.
//        LoginA {
//            onLogedInSignal: { Js.createSpriteObjectPageOne(parentWindow);
//            }
//        }
//        PageOneA {
//            onNextPageSignal: { Js.createSpriteObjectPageTwo(parentWindow);
//            }
//        }
//        PageTwoA {
//            onPrevPageSignal: { Js.createSpriteObjectPageOne(parentWindow);
//            }
//        }

}
