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
import QtCore
import Qt.labs.settings 1.0
import Ak
import Multicam

Dialog {
    id: updatesDialog
    title: qsTr("New version available!")
    standardButtons: Dialog.Yes | Dialog.No
    width: AkUnit.create(420 * AkTheme.controlScale, "dp").pixels
    height: AkUnit.create(240 * AkTheme.controlScale, "dp").pixels
    modal: true

    property int multicamStatus: updates.status("multicam")
    property string multicamLatestVersion: updates.latestVersion("multicam")

    function notifyUpdate()
    {
        if (updates.isEnabled
            && updates.notifyNewVersion
            && showNextTime.checked
            && multicamStatus == Updates.ComponentOutdated) {
            open()
        }
    }

    Component.onCompleted: notifyUpdate()
    onMulticamLatestVersionChanged: notifyUpdate()
    onVisibleChanged: forceActiveFocus()

    Connections {
        target: updates

        function onNewVersionAvailable(component, latestVersion)
        {
            if (updates.isEnabled && component == "multicam") {
                updatesDialog.multicamStatus = updates.status("multicam");
                updatesDialog.multicamLatestVersion = latestVersion;
            }
        }
    }

    ScrollView {
        id: view
        anchors.fill: parent

        ColumnLayout {
            width: view.width
            clip: true

            Label {
                text: qsTr("Download %1 %2 NOW!")
                        .arg(mediaTools.applicationName)
                        .arg(updatesDialog.multicamLatestVersion)
                Layout.fillWidth: true
            }
            CheckBox {
                id: showNextTime
                text: qsTr("Show this dialog next time")
                checked: true
                Layout.fillWidth: true
            }
        }
    }

    onAccepted: Qt.openUrlExternally(mediaTools.projectDownloadsUrl)

    Settings {
        category: "Updates"

        property alias showDialog: showNextTime.checked
    }
}

