import QtQuick 2.0
import QtQuick.Controls 2.15

Rectangle {
    id: pageTwoRectangle
    anchors.fill: parent
    Component.onCompleted:print("Second page window loaded")
    Component.onDestruction:print("Second page window destroyed")

    signal prevPageSignal()

    function prevPage() {
        pageTwoRectangle.prevPageSignal()
        this.destroy()
    }

    Button {
        id: prevButton
        text: "Предыдущая страница"
        onClicked: prevPage()
    }
}
