function createSpriteObjectLogin(parent) {
    var component1 = Qt.createComponent("LoginA.qml");
    var sprite1 = component1.createObject(parent, {x: 100, y: 100});
    if (sprite1 == null) {
        // Error Handling
        console.log("Error creating object");
    }
}
function createSpriteObjectPageOne(parent) {
    var component2 = Qt.createComponent("PageOneA.qml");
    var sprite2 = component2.createObject(parent, {x: 100, y: 100});
    if (sprite2 == null) {
        // Error Handling
        console.log("login correct");
    }
}
function createSpriteObjectPageTwo(parent) {
    var component3 = Qt.createComponent("PageTwoA.qml");
    var sprite3 = component3.createObject(parent, {x: 100, y: 100});
    if (sprite3 == null) {
        // Error Handling
        console.log("login correct");
    }
}
