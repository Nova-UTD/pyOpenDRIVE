from pyOpenDRIVE.OpenDriveMap import PyOpenDriveMap

odr_map = PyOpenDriveMap(b"./test.xodr")

roads = odr_map.get_roads()
junctions = odr_map.get_junctions()

print("ROADS:")
for road in roads:
    print(road.id)
print("\nJUNCTIONS:")
for junction in junctions:
    print(junction.id)
    
#roads2 = odr_map.get_roads()