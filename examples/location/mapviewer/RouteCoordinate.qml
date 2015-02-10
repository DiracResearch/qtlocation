/****************************************************************************
**
** Copyright (C) 2015 The Qt Company Ltd.
** Contact: http://www.qt.io/licensing/
**
** This file is part of the examples of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** You may use this file under the terms of the BSD license as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of The Qt Company Ltd nor the names of its
**     contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.4
import QtPositioning 5.2
import "forms"

//Route Dialog
//! [routedialog0]
RouteCoordinateForm {
    property variant toCoordinate
    property variant fromCoordinate
    signal showRoute(variant startCoordinate,variant endCoordinate)
    signal closeForm()

    //! [routedialog0]
    goButton.onClicked: {
        var startCoordinate = QtPositioning.coordinate(parseFloat(fromLatitude.text),
                                                       parseFloat(fromLongitude.text));
        var endCoordinate = QtPositioning.coordinate(parseFloat(toLatitude.text),
                                                     parseFloat(toLongitude.text));
        if (startCoordinate.isValid && endCoordinate.isValid) {
           goButton.enabled = false;
           showRoute(startCoordinate,endCoordinate)
        }
    }

    clearButton.onClicked: {
        fromLatitude.text = ""
        fromLongitude.text = ""
        toLatitude.text = ""
        toLongitude.text  = ""
    }

    cancelButton.onClicked: {
        closeForm()
    }

    Component.onCompleted: {
        fromLatitude.text = "" + fromCoordinate.latitude
        fromLongitude.text = "" + fromCoordinate.longitude
        toLatitude.text = "" + toCoordinate.latitude
        toLongitude.text = "" + toCoordinate.longitude
    }
    //! [routedialog1]
}
//! [routedialog1]
