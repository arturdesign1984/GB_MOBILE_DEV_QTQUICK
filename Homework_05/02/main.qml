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
    Component.onCompleted: {
        loader.sourceComponent = pageOneRectangle;
        Js.createSpriteObjectLogin(parentWindow);
    }
    function pageChange() {
        if (loader.sourceComponent === pageOneRectangle)
        {
            loader.sourceComponent = pageTwoRectangle
            pages.text = "Первая страница"
        } else {
            loader.sourceComponent = pageOneRectangle
            pages.text = "Вторая страница"
        }
    }
    Component {
        id: pageOneRectangle
        Rectangle {
            width: parentWindow.width
            height: parentWindow.height - 30
            color: "red"
            Component.onCompleted:print("First page window loaded")
            Component.onDestruction:print("First page window destroyed")

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                text: "Первая страница"
                color: "white"
            }
        }
    }
    Component {
        id: pageTwoRectangle
        Rectangle {
            width: parentWindow.width
            height: parentWindow.height - 30
            color: "blue"
            Component.onCompleted:print("Second page window loaded")
            Component.onDestruction:print("Second page window destroyed")

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                color: "white"
                text: "Вторая страница"
            }
        }
    }
    Loader {
        id: loader
    }
    Button {
        id: pages
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        text: qsTr("Вторая страница")
        onClicked: {
            pageChange()
        }
    }
}
