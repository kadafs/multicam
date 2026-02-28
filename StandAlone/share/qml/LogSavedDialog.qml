/* Multicam, camera capture application.
 * Copyright (C) 2024  Gonzalo Exequiel Pedone
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
import Ak

Dialog {
    standardButtons: Dialog.Ok
    width: AkUnit.create(450 * AkTheme.controlScale, "dp").pixels
    height: AkUnit.create(350 * AkTheme.controlScale, "dp").pixels
    modal: true
    title: qsTr("Done")

    property real physicalWidth: wdgMainWidget.width / Screen.pixelDensity
    property real physicalHeight: wdgMainWidget.height / Screen.pixelDensity

    ScrollView {
        id: view
        anchors.fill: parent

        Label {
            text: qsTr("Log file saved")
            Layout.fillWidth: true
        }
    }
}

