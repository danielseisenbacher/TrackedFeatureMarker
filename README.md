# TrackedFeatureMarker - QField Plugin

The **TrackedFeatureMarker** QField Plugin automatically marks features created during tracking sessions by setting a 'tracked' attribute to true.

This plugin enables distinguishing between manually created features and GPS-tracked features in your data collection workflows.

## Installation

1. **Download QField:**
   - Install [QField on your device](https://qfield.org/get).

2. **Install Plugin:**
   - See https://docs.qfield.org/ro/how-to/advanced-how-tos/plugins/
   - Using url method:<br>https://github.com/danielseisenbacher/TrackedFeatureMarker/releases/download/latest/TrackedFeatureMarker.zip

## Usage

1. **Add a 'tracked' field** to your layer(s):
   - Field name: `tracked`
   - Field type: Boolean
   
2. **Activate the Plugin**
   - The plugin works automatically in the background

3. **Start tracking**
   - Features created during tracking will have `tracked = true`
   - Manually created features will have `tracked = NULL`

4. **Use the tracked attribute** for filtering, styling, or analysis

## How It Works

The plugin monitors active tracking sessions and automatically sets the 'tracked' attribute when features are created by the tracker.
It utilzes the 'featureCreated' signal of the 'Tracker' class.

## Limitations

**This Plugin is still a work in progress** - so some issues may occur, including:
- For Features with exactly 2 vertices (lines) or 3 vertices (polygons) the signal doesn't fire - so no features are not marked as 'tracked'
- The plugin requires layers to have a 'tracked' field (boolean) configured before tracking starts

## Contributing

Contributions are welcome!

**Possible improvements:**
- Configurable field name (instead of hardcoded 'tracked')
- UI for managing tracked field per layer

## Contact

Contact me via Github Issues...<br>
[GitHub repository](https://github.com/danielseisenbacher/TrackedFeatureMarker).