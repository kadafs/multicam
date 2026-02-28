/* Multicam, camera capture application.
 * Copyright (C) 2022  Gonzalo Exequiel Pedone
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

#ifndef AKSUBTITLECAPS_H
#define AKSUBTITLECAPS_H

#include <QObject>
#include <QVariant>
#include <QDebug>
#include <QRect>

#include "akcommons.h"

class AkSubtitleCapsPrivate;
class AkCaps;

class AKCOMMONS_EXPORT AkSubtitleCaps: public QObject
{
    Q_OBJECT
    public:
        enum SubtitleFormat
        {
            SubtitleFormat_none = -1,
            SubtitleFormat_text,
            SubtitleFormat_ass,
            SubtitleFormat_bitmap,
        };
        Q_ENUM(SubtitleFormat)

    Q_PROPERTY(SubtitleFormat format
               READ format
               WRITE setFormat
               RESET resetFormat
               NOTIFY formatChanged)
    Q_PROPERTY(QRect rect
               READ rect
               WRITE setRect
               RESET resetRect
               NOTIFY rectChanged)

        AkSubtitleCaps(QObject *parent=nullptr);
        AkSubtitleCaps(SubtitleFormat format);
        AkSubtitleCaps(SubtitleFormat format, const QRect &rect);
        AkSubtitleCaps(const AkCaps &other);
        AkSubtitleCaps(const AkSubtitleCaps &other);
        ~AkSubtitleCaps();
        AkSubtitleCaps &operator =(const AkCaps &other);
        AkSubtitleCaps &operator =(const AkSubtitleCaps &other);
        bool operator ==(const AkSubtitleCaps &other) const;
        bool operator !=(const AkSubtitleCaps &other) const;
        operator bool() const;
        operator AkCaps() const;

        Q_INVOKABLE static QObject *create();
        Q_INVOKABLE static QObject *create(const AkSubtitleCaps &caps);
        Q_INVOKABLE static QObject *create(SubtitleFormat format);
        Q_INVOKABLE static QObject *create(SubtitleFormat format,
                                           const QRect &rect);
        Q_INVOKABLE QVariant toVariant() const;

        Q_INVOKABLE SubtitleFormat format() const;
        Q_INVOKABLE QRect rect() const;

        Q_INVOKABLE static QString formatToString(SubtitleFormat format);
        Q_INVOKABLE static SubtitleFormat formatFromString(const QString &format);

    private:
        AkSubtitleCapsPrivate *d;

    Q_SIGNALS:
        void formatChanged(SubtitleFormat format);
        void rectChanged(const QRect &rect);

    public Q_SLOTS:
        void setFormat(SubtitleFormat format);
        void setRect(const QRect &rect);
        void resetFormat();
        void resetRect();
        static void registerTypes();

    friend AKCOMMONS_EXPORT QDataStream &operator >>(QDataStream &istream, AkSubtitleCaps &caps);
    friend AKCOMMONS_EXPORT QDataStream &operator <<(QDataStream &ostream, const AkSubtitleCaps &caps);
};

AKCOMMONS_EXPORT QDebug operator <<(QDebug debug, const AkSubtitleCaps &caps);
AKCOMMONS_EXPORT QDebug operator <<(QDebug debug, AkSubtitleCaps::SubtitleFormat format);
AKCOMMONS_EXPORT QDataStream &operator >>(QDataStream &istream, AkSubtitleCaps &caps);
AKCOMMONS_EXPORT QDataStream &operator <<(QDataStream &ostream, const AkSubtitleCaps &caps);

// Q_DECLARE_METATYPE(AkSubtitleCaps)
// Q_DECLARE_METATYPE(AkSubtitleCaps::SubtitleFormat)

#endif // AKSUBTITLECAPS_H

