/****************************************************************************
**
** Copyright (C) 2010 Nokia Corporation and/or its subsidiary(-ies).
** All rights reserved.
** Contact: Nokia Corporation (qt-info@nokia.com)
**
** This file is part of the Qt Mobility Components.
**
** $QT_BEGIN_LICENSE:LGPL$
** GNU Lesser General Public License Usage
** This file may be used under the terms of the GNU Lesser General Public
** License version 2.1 as published by the Free Software Foundation and
** appearing in the file LICENSE.LGPL included in the packaging of this
** file. Please review the following information to ensure the GNU Lesser
** General Public License version 2.1 requirements will be met:
** http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
**
** In addition, as a special exception, Nokia gives you certain additional
** rights. These rights are described in the Nokia Qt LGPL Exception
** version 1.1, included in the file LGPL_EXCEPTION.txt in this package.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU General
** Public License version 3.0 as published by the Free Software Foundation
** and appearing in the file LICENSE.GPL included in the packaging of this
** file. Please review the following information to ensure the GNU General
** Public License version 3.0 requirements will be met:
** http://www.gnu.org/copyleft/gpl.html.
**
** Other Usage
** Alternatively, this file may be used in accordance with the terms and
** conditions contained in a signed written agreement between you and Nokia.
**
**
**
**
**
** $QT_END_LICENSE$
**
****************************************************************************/

#ifndef QGEOBOUNDINGCIRCLE_H
#define QGEOBOUNDINGCIRCLE_H

#include "qgeoboundingarea.h"

#include <QSharedDataPointer>

QT_BEGIN_HEADER

QT_BEGIN_NAMESPACE

class QGeoCoordinate;
class QGeoBoundingCirclePrivate;

class Q_LOCATION_EXPORT QGeoBoundingCircle : public QGeoBoundingArea
{
public:
    QGeoBoundingCircle();
    QGeoBoundingCircle(const QGeoCoordinate &center, qreal radius);

    QGeoBoundingCircle(const QGeoBoundingCircle &other);
    ~QGeoBoundingCircle();

    QGeoBoundingCircle& operator = (const QGeoBoundingCircle &other);

    bool operator == (const QGeoBoundingCircle &other) const;
    bool operator != (const QGeoBoundingCircle &other) const;

    QGeoBoundingArea::AreaType type() const;

    bool isValid() const;
    bool isEmpty() const;

    void setCenter(const QGeoCoordinate &center);
    QGeoCoordinate center() const;

    void setRadius(qreal radius);
    qreal radius() const;

    bool contains(const QGeoCoordinate &coordinate) const;

    void translate(double degreesLatitude, double degreesLongitude);
    QGeoBoundingCircle translated(double degreesLatitude, double degreesLongitude) const;
private:
    QSharedDataPointer<QGeoBoundingCirclePrivate> d_ptr;
};

QT_END_NAMESPACE

QT_END_HEADER

#endif

