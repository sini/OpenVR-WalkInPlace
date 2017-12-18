import QtQuick 2.7
import QtQuick.Controls 2.0
import "." // QTBUG-34418, singletons require explicit import to load qmldir file

Button {
    property bool activationSoundEnabled: true
	hoverEnabled: true
	contentItem: MyText {
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        text: parent.text
        color: parent.enabled ? "#ffffff" : "#909090"
	}
	background: Rectangle {
        color: parent.down ? "#265832" : (parent.activeFocus ? "#265432" : "#265a32")
    }

    onHoveredChanged: {
        if (hovered) {
            forceActiveFocus()
        } else {
            focus = false
        }
    }

    onClicked: {
        if (activationSoundEnabled) {
			MyResources.playActivationSound()
        }
    }
}
