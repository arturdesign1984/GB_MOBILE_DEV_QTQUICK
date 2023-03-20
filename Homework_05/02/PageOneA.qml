import QtQuick 2.0
import QtQuick.Controls 2.15

Rectangle {
    id: pageOneRectangle
    anchors.fill: parent
    color: "red"
    Component.onCompleted:print("First page window loaded")
    Component.onDestruction:print("First page window destroyed")

    signal nextPageSignal()

    function nextPage() {
        pageOneRectangle.nextPageSignal()
        this.destroy()
    }

    Button {
        id: nextButton
        text: "Следующая страница"
        onClicked: nextPage()
    }
}
