import QtQuick
import QtQuick.Controls
import Qt.labs.settings

Window {
    width: 800
    height: 480
    visible: true
    title: qsTr("Project")
    SplitView {
        anchors.fill: parent
        orientation: Qt.Horizontal

        Rectangle {
            id:infoPanel

            implicitWidth: 200
            SplitView.maximumWidth: 200
            height: parent.height
            color: "white"
            Text {
                id: text1
                text: qsTr("InfoName: ")
            }

        }

        Rectangle {
            id: viewport
            SplitView.maximumWidth: 600
            SplitView.fillWidth: true
            color: "green"
            height:parent.height

            Loader {
               id: viewLoader
                anchors.fill: parent
                source:"qrc:///View.qml"
                onLoaded: {
                console.log("Hey");
               }
               Connections{
               target: viewLoader.item
               onRectangleChanged : {
               text1.text = qsTr(x +", " + y);

               }

               }
            }

        }


    }
}
