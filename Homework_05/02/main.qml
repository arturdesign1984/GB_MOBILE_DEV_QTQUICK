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
        LoginA {
            onLogedInSignal: { Js.createSpriteObjectPageOne(parentWindow);
            }
        }
        PageOneA {
            onNextPageSignal: { Js.createSpriteObjectPageTwo(parentWindow);
            }
        }
        PageTwoA {
            onPrevPageSignal: { Js.createSpriteObjectPageOne(parentWindow);
            }
        }

}
