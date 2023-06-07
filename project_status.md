# AgOpenGps - Flutter port

## Implemented functionality

-   Maps

    -   Reorderable and mixable (transparency/opacity) layers
        -   OpenStreetMap
        -   Copernicus Sentinel, up-to-date insightful data
        -   Custom layers per country, example:
            -   Norway: High-res orthophoto, topological maps, DTM/DOM terrain

-   Basic vehicle movement simulation, for conventional and articulated tractors and harvesters

-   Basic path recording

-   Basic pure pursuit autosteering with PID or look ahead modes

## To be implemented

-   Improved vehicle simulation, though good enough for testing features now

-   Equipment simulation

-   Fields, AB lines/curves etc.

-   Improve autosteering, look at more algorithms

-   Hardware communication, probably UDP first

-   Import/export to the original AgOpenGps

-   Map layer caching/offline

## Further ideas

-   Use OSM to look for powerlines/obstacles in fields/polygons

-   Restrict map layer to polygon extent, directly from wms?

-   Google Drive / cloud shape files etc...

-   Sim integration - gamepad/wheel

-   Custom vehicle painter, moving tires etc...

    -   Custom equipment painter

-   Weather forecast
