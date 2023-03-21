function createSpriteObjectLogin(parent) {
    var component1 = Qt.createComponent("LoginA.qml");
    var sprite1 = component1.createObject(parent);
    if (sprite1 == null) {
        // Error Handling
        console.log("Error creating object LoginA.qml");
    }
}
function createSpriteObjectPageOne(parent) {
    var component2 = Qt.createComponent("PageOneA.qml");
    var sprite2 = component2.createObject(parent);
    if (sprite2 == null) {
        // Error Handling
        console.log("Error creating object PageOneA.qml");
    }
}
function createSpriteObjectPageTwo(parent) {
    var component3 = Qt.createComponent("PageTwoA.qml");
    var sprite3 = component3.createObject(parent);
    if (sprite3 == null) {
        // Error Handling
        console.log("Error creating object PageTwoA.qml");
    }
}

