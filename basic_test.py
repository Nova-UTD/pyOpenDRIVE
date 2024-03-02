from pyOpenDRIVE.OpenDriveMap import PyOpenDriveMap

odr_map = PyOpenDriveMap(b"./test.xodr")

roads = odr_map.get_roads()
for road in roads:
    print(road.id)