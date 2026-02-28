/* Multicam, camera capture application.
 * Copyright (C) 2020  Gonzalo Exequiel Pedone
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
import QtQuick.Controls
import QtQuick.Layouts

ColumnLayout {
    TabBar {
        id: tabBar
        Layout.fillWidth: true

        TabButton {
            text: qsTr("Outputs")
        }
        TabButton {
            text: qsTr("Sources")
        }
    }
    StackLayout {
        id: stack
        Layout.fillWidth: true
        Layout.fillHeight: true
        currentIndex: tabBar.currentIndex
        clip: true

        AudioOutputs {
        }
        AudioInputs {
        }
    }
}

