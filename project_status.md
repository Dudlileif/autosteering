# AgOpenGps - Flutter port

## Implemented functionality

-   Maps
    -   Reorderable and mixable (transparency/opacity) layers
        -   OpenStreetMap
        -   Copernicus Sentinel, up-to-date insightful data
        -   Custom layers per country, example:
            -   Norway: High-res orthophoto, topological maps, DTM/DOM terrain
-   Basic proof of concept vehicle movement simulation

## To be implemented functionality

-   Correct vehicle simulation, independent steering wheels turning angle and radii etc..., support for harvester, articulated vehicles
-   Equipment simulation
-   Fields, paths, recording etc...
-   Hardware communication
-   Import/export to the original AgOpenGps

## Further ideas

-   Restrict map layer to polygon extent, directly from wms?

-   Google Drive / cloud shape files etc...

-   Sim integration - gamepad/wheel

-   Custom vehicle painter, moving tires etc...
    -   Custom equipment painter
