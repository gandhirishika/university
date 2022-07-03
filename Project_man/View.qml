import QtQuick 2.0

Rectangle {
    id: view
    anchors.fill: parent
    color: "purple"
    signal rectangleChanged(int x , int y)
    MouseArea {
        id:mouseArea
        anchors.fill: parent
        onPositionChanged: {
            console.log("x,y" + mouse.x  + " "+ " " +  mouse.y );
            mouseText.x=mouse.x;
            mouseText.y=mouse.y;
            mouseName.text=qsTr(mouse.x +" "+ mouse.y);
        }


    }


    Rectangle {
        id: mouseText
        width: mouseName.width
        height: 40
        color: "white"
        border.color: "black"
        border.width: 1

        Text {
            id: mouseName
            anchors.centerIn: parent
            //                text: qsTr(mouse.x +" "+ mouse.y)
            //onTextChanged: {//change to signifactfigure}
        }



    }
    Rectangle {
        id: microcontroller1
        anchors.left: parent.left
        anchors.top: parent.top
        width: 40
        height: 40
        color: "orange"

    }
    Rectangle {
        id: microcontroller2
        anchors.right: parent.right
        anchors.top: parent.top
        width: 40
        height: 40
        color: "pink"

    }
    Rectangle {
        id: microcontroller3
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        width: 40
        height: 40
        color: "yellow"

    }

    Rectangle {
        id: microcontroller4
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        width: 40
        height: 40
        color: "red"

    }

    Rectangle {
        id:microcontroller5
        x: 100
        y: 100
        width: 40
        height: 40
        color:"blue"
        MouseArea {
            id:mouseArea2
            anchors.fill: parent
            onClicked: {
                //                parent.x = mouse.x;
                //                parent.y = mouse.y;

            }

            onPositionChanged: {
                console.log("x,y" + mouse.x  + " "+ " " +  mouse.y );
                var p = mapToItem(view, mouse.x, mouse.y);
                parent.x=p.x;
                parent.y=p.y;
                view.rectangleChanged(p.x,p.y);
            }
            onExited: {
                console.log("exit");
            }
        }
    }

}




