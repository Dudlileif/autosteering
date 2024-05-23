# Autosteering - Built with Flutter

## Implemented functionality

- Maps

  - Reorderable and mixable (transparency/opacity) layers
    - OpenStreetMap
    - Copernicus Sentinel, up-to-date insightful data
    - Custom layers per country, example:
      - Norway: High-res orthophoto, topological maps, DTM/DOM terrain

- Basic vehicle movement simulation, for conventional and articulated tractors and harvesters

- Basic path recording

- Pure pursuit and Stanley autosteering modes

- Basic AB lines and curves with autosteering, basic u-turn at the ends
  - Can be clipped to field/boundary or unlimited

- Basic equipment simulation
  - Front and rear fixed hitch (three point)
  - Rear towbar hitch
  - Equipment can be chained in any configuration
  - Decorative square for trailers etc..
  - Save and load presets/setups with multiple/chained equipment

- Map layer caching/offline

- Vehicle/equipment configurator/builder

- Saving/loading of vehicles, equipment

- IMU, WAS and GNSS comms with hardware
  - USB/Serial or network UDP
  - WAS and IMU configurator

- Autosteering comms with hardware

- NTRIP client for forwarding RTCM to GNSS hardware.

- Basic logging

- Custom vehicle painter, dynamically changes color
  to fit the theme/manufacturer, basic rotating tyres

- Basic remote control support over UDP.

- Audio alerts

- Nudging to offset vehicle from tracking line

## To be implemented

- Improve tablet/phone UI

- Improved performance,
  - ~~Immutable/copyWith vehicle/equipment implementation is too taxing~~ improved with mutable vehicle/equipments
  - ~~Look into `canvas.drawVertices` for drawing the worked equipment paths~~ worked paths are now drawn correctly with overlap
  - Maybe reduce conversion steps with latlng/xy-coordinates (change algorithms to xy-coords)

- Improved vehicle simulation, though good enough for testing features now

- Improved equipment simulation

- Improved equipment recording/coverage

- Automatic section control

- Countour/adaptive curve mode

- Proper headland implementation, u-turns following same outer path

- Improve autosteering, look at more algorithms

- Debugging graphs/logs

- Hardware configuration

- Localization

- Improve work session saving of worked area, maybe timelog a la ISOXML

- Improved safety measures

- Import/export with AgOpenGps and ISOXML, maybe other formats

- Hotkeys

## Further ideas

- Use OSM to look for powerlines/obstacles in fields/polygons

- Restrict map layer to polygon extent, directly from wms?

- Google Drive / cloud shape files etc...

- Sim integration - gamepad/wheel

- Weather forecast
