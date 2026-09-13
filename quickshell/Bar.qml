import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import Quickshell.Io
import Quickshell.Wayland

Scope {
    id: root
    property string time: ""

    Variants {
        model: Quickshell.screens

        PanelWindow {
            required property var modelData
            screen: modelData

            anchors {
                top: true
                left: true
                right: true
            }

            implicitHeight: 30
            color: "#cc1e1e2e"

            RowLayout {
                anchors.fill: parent
                anchors.leftMargin: 8
                anchors.rightMargin: 8
                spacing: 12

                Row {
                    spacing: 6
                    Repeater {
                        model: 10
                        delegate: Rectangle {
                            required property int index
                            property int wsId: index + 1
                            property bool focused: Hyprland.focusedWorkspace && Hyprland.focusedWorkspace.id === wsId

                            width: 22
                            height: 18
                            radius: 4
                            color: focused ? "#89b4fa" : "#313244"

                            Text {
                                anchors.centerIn: parent
                                text: wsId
                                color: focused ? "#1e1e2e" : "#cdd6f4"
                                font.pixelSize: 11
                                font.family: "JetBrainsMono Nerd Font"
                            }

                            MouseArea {
                                anchors.fill: parent
                                onClicked: Hyprland.dispatch("workspace " + wsId)
                            }
                        }
                    }
                }

                Text {
                    Layout.fillWidth: true
                    elide: Text.ElideRight
                    color: "#cdd6f4"
                    font.pixelSize: 12
                    font.family: "JetBrainsMono Nerd Font"
                    text: {
                        const w = Hyprland.focusedWindow
                        return w && w.title ? w.title : ""
                    }
                }

                Text {
                    color: "#cdd6f4"
                    font.pixelSize: 12
                    font.family: "JetBrainsMono Nerd Font"
                    text: root.time
                }
            }
        }
    }

    Process {
        id: dateProc
        command: ["date", "+%a %d %b  %H:%M"]
        running: true
        stdout: StdioCollector {
            onStreamFinished: root.time = text.trim()
        }
    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: dateProc.running = true
    }
}
