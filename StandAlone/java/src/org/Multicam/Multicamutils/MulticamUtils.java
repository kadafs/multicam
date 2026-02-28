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

package org.Multicam.Multicamutils;

import java.lang.String;
import android.media.MediaScannerConnection;
import android.net.Uri;

public class MulticamUtils implements MediaScannerConnection.OnScanCompletedListener
{
    private long m_userPtr = 0;

    public MulticamUtils(long userPtr)
    {
        m_userPtr = userPtr;
    }

    // MediaScannerConnection.OnScanCompletedListener

    @Override
    public void onScanCompleted(String path, Uri uri)
    {
        scanCompleted(m_userPtr, path, uri);
    }

    private static native void scanCompleted(long userPtr, String path, Uri uri);
}

