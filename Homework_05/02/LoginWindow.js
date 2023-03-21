function createSpriteObjectLogin(parent) {
    var component = Qt.createComponent("LoginA.qml");
    var sprite = component.createObject(parent);
    if (sprite == null) {
        // Error Handling
        console.log("Error creating object LoginA.qml");
    }
}

