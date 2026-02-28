/* Multicam, camera capture application.
 * Copyright (C) 2023  Gonzalo Exequiel Pedone
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

#ifndef NDKERRORMSG_H
#define NDKERRORMSG_H

#include <media/NdkMediaError.h>

class QString;

QString mediaStatusToStr(media_status_t status, const QString &defaultValue);

#endif // NDKERRORMSG_H

