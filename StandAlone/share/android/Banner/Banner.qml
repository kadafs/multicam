/* Multicam, camera capture application.
 * Copyright (C) 2025  Gonzalo Exequiel Pedone
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
    width: 320
    height: 180
    color: "#3f2a7e"
    visible: true

    ColumnLayout {
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter

        GridLayout {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            columns: 2

            // Info
            Image {
                id: icon
                width: 96
                height: width
                sourceSize.width: width
                sourceSize.height: height
                source: "../../themes/MulticamTheme/icons/hicolor/128x128/multicam.png"
            }

            ColumnLayout {
                Text {
                    id: programName
                    color: "#ffffff"
                    text: "Multicam"
                    font.weight: Font.Bold
                    font.pixelSize: 24
                }

                Text {
                    color: "#ffffff"
                    text: "The ultimate video capture suite!"
                    leftPadding: 12
                    font.weight: Font.Bold
                    font.pixelSize: 0.5 * programName.font.pixelSize
                    font.italic: true
                }
            }
        }
    }
}

