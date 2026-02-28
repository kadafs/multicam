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

#ifndef SHAGADELICELEMENT_H
#define SHAGADELICELEMENT_H

#include <iak/akelement.h>

class ShagadelicElementPrivate;

class ShagadelicElement: public AkElement
{
    Q_OBJECT
    Q_PROPERTY(quint32 mask
               READ mask
               WRITE setMask
               RESET resetMask
               NOTIFY maskChanged)

    public:
        ShagadelicElement();
        ~ShagadelicElement();

        Q_INVOKABLE quint32 mask() const;

    private:
        ShagadelicElementPrivate *d;

    protected:
        QString controlInterfaceProvide(const QString &controlId) const override;
        void controlInterfaceConfigure(QQmlContext *context,
                                       const QString &controlId) const override;
        AkPacket iVideoStream(const AkVideoPacket &packet) override;

    signals:
        void maskChanged(quint32 mask);

    public slots:
        void setMask(quint32 mask);
        void resetMask();
};

#endif // SHAGADELICELEMENT_H

