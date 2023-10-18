# AgOpenGps - Flutter port

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

- Basic AB lines and curves with autosteering, u-turn at the ends
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

- Receive IMU sensor data from hardware, UDP/WebSocket (http only, won't work from https hosted site)

## To be implemented

- Better performance, <s>the current immutable/copyWith implementation might be
    too taxing</s> improved with mutable vehicle/equipments, reduce conversion steps with latlng/xy-coordinates (change algorithms to xy-coords)

- Improved vehicle simulation, though good enough for testing features now

- Equipment simulation, maybe make sections a separate class

- Fields, AB lines/curves etc.

- Improve autosteering, look at more algorithms

- Two way hardware comms, send steering signals etc..

- Debugging graphs/logs

- Import/export to the original AgOpenGps

- Custom hotkeys, also from hardware

- Implement BL(E) communication with ESP32 etc...

## Further ideas

- Use OSM to look for powerlines/obstacles in fields/polygons

- Restrict map layer to polygon extent, directly from wms?

- Google Drive / cloud shape files etc...

- Sim integration - gamepad/wheel

- Custom vehicle painter, moving tires etc...

  - Custom equipment painter

- Weather forecast
