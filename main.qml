import QtQuick
import QtQuick.Controls
import org.qfield
import org.qgis
import QtQuick.Layouts
import QtCore
import Theme

import "qrc:/qml" as QFieldItems



Item {
    id: trackerWriter

    Component.onCompleted: {
        connectToAllTrackers();
    }

    Connections {
        target: trackingModel

        function onLayerInTrackingChanged(layer, tracking) {
            if (!layer) return;

            if (tracking) {
                iface.logMessage("Started tracking layer: " + layer.name);
                // Connect to this specific tracker
                connectToAllTrackers();
            } else {
                iface.logMessage("Stopped tracking layer: " + layer.name);
            }
        }
    }



    function connectToAllTrackers() {
        let rows = trackingModel.rowCount();

        for (let row = 0; row < rows; row++) {
            let idx = trackingModel.index(row, 0);
            let tracker = trackingModel.data(idx, Qt.UserRole + 1);

            //iface.logMessage(tracker.feature)

            tracker.featureCreated.connect(function() {
                //iface.logMessage("Feature created: " + tracker.feature);
                // Handle the feature change

                //iface.logMessage("id: " + tracker.feature.id)
                try {
                    tracker.feature.setAttribute ('tracked', true)
                    iface.logMessage("Set 'tracked' attribute to TRUE")
                } catch(e) {
                    iface.logMessage(e)
                }
            });
        }
    }
}


