/* Multicam, camera capture application.
 * Copyright (C) 2016  Gonzalo Exequiel Pedone
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
    Label {
        id: txtMask
        text: qsTr("Mask")
        font.bold: true
        Layout.fillWidth: true
    }
    TextField {
        text: "0x" + Shagadelic.mask.toString(16)
        placeholderText: qsTr("Mask")
        selectByMouse: true
        validator: RegularExpressionValidator {
            regularExpression: /(0x)?[0-9a-fA-F]{1,8}/
        }
        Layout.fillWidth: true
        Accessible.name: txtMask.text

        onTextChanged: Shagadelic.mask = hexToInt(text)
    }
}

