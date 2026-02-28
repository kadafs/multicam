/* Multicam, camera capture application.
 * Copyright (C) 2017  Gonzalo Exequiel Pedone
 *
 * Multicam is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Multicam is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Multicam. If not, see <http://www.gnu.org/licenses/>.
 *
 * Web-Site: http://Multicam.github.io/
 */

import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    width: 640
    height: 480
    color: "#3f2a7e"
    visible: true

    property int patternSize: 24

    ColumnLayout {
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter

        GridLayout {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            columns: 2

            // Info
            Image {
                id: icon
                width: 128
                height: width
                sourceSize.width: width
                sourceSize.height: height
                source: "../../../../../../StandAlone/share/themes/MulticamTheme/icons/hicolor/128x128/multicam.png"
            }

            ColumnLayout {
                Text {
                    id: programName
                    color: "#ffffff"
                    text: "multicam"
                    font.weight: Font.Bold
                    font.pixelSize: 40
                }

                Text {
                    color: "#ffffff"
                    text: "The ultimate video capture suite!"
                    leftPadding: 24
                    font.weight: Font.Bold
                    font.pixelSize: 0.5 * programName.font.pixelSize
                }
            }

            // Color pattern
            GridLayout {
                columns: 8
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Layout.columnSpan: 2

                Text {
                    text: "R"
                    color: "#ffffff"
                    font.pixelSize: 0.3 * programName.font.pixelSize
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                }
                Text {
                    text: "G"
                    color: "#ffffff"
                    font.pixelSize: 0.3 * programName.font.pixelSize
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                }
                Text {
                    text: "B"
                    color: "#ffffff"
                    font.pixelSize: 0.3 * programName.font.pixelSize
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                }

                Text {
                    text: "C"
                    color: "#ffffff"
                    font.pixelSize: 0.3 * programName.font.pixelSize
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                }
                Text {
                    text: "M"
                    color: "#ffffff"
                    font.pixelSize: 0.3 * programName.font.pixelSize
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                }
                Text {
                    text: "Y"
                    color: "#ffffff"
                    font.pixelSize: 0.3 * programName.font.pixelSize
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                }

                Text {
                    text: "K"
                    color: "#ffffff"
                    font.pixelSize: 0.3 * programName.font.pixelSize
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                }
                Text {
                    text: "W"
                    color: "#ffffff"
                    font.pixelSize: 0.3 * programName.font.pixelSize
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                }

                // RGB
                Rectangle {
                    color: "#ff0000"
                    width: patternSize
                    height: patternSize
                }
                Rectangle {
                    color: "#00ff00"
                    width: patternSize
                    height: patternSize
                }
                Rectangle {
                    color: "#0000ff"
                    width: patternSize
                    height: patternSize
                }

                // CMY
                Rectangle {
                    color: "#00ffff"
                    width: patternSize
                    height: patternSize
                }
                Rectangle {
                    color: "#ff00ff"
                    width: patternSize
                    height: patternSize
                }
                Rectangle {
                    color: "#ffff00"
                    width: patternSize
                    height: patternSize
                }

                // BW
                Rectangle {
                    color: "#000000"
                    width: patternSize
                    height: patternSize
                }
                Rectangle {
                    color: "#ffffff"
                    width: patternSize
                    height: patternSize
                }
            }
        }

        // Usage
        Rectangle {
            width: 500
            height: 125
            color: "#00000000"

            Text {
                id: usage
                color: "#ffffff"
                text: "This is a multicam's virtual camera device.\n"
                    + "Go to multicam, enable virtual camera output, select "
                    + "this device and play some webcam, desktop or video."
                wrapMode: Text.WordWrap
                anchors.fill: parent
                topPadding: 8
                Layout.columnSpan: 2
                font.pixelSize: 0.45 * programName.font.pixelSize
            }
        }
    }
}

