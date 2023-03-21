import QtQuick 2.0
import QtQuick.Controls 2.15

Rectangle {
    anchors.fill: parent
    function loginIsCorect() {
        if(name.text == "login" && password.text == "password"){
            this.destroy()
        } else {
            console.log("Wrong name or password")
        }
    }
    Rectangle {
        id: loginRectangle
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        width:200
        height:150
        radius: 20
        color:"lightgray"

        Component.onCompleted: print("Login window loaded")
        Component.onDestruction: print("Login window destroyed")

        TextField {
            id: name
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.verticalCenter
            anchors.bottomMargin: 20
            text: "login"
        }
        TextField{
            id: password
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: name.bottom
            anchors.topMargin: 3
            text: "password"
        }
        Button {
            id: loginButton
            width: 50
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: password.bottom
            anchors.topMargin: 3
            text: "Войти"
            onClicked: loginIsCorect()
        }
    }
}
