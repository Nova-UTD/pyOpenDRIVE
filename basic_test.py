from pyOpenDRIVE.OpenDriveMap import PyOpenDriveMap
from pyOpenDRIVE.Junction import PyJunction
from pyOpenDRIVE.Road import PyRoad
from pyOpenDRIVE.LaneSection import PyLaneSection

odr_map = PyOpenDriveMap(b"./test.xodr")

roads: list[PyRoad] = odr_map.get_roads()
junctions: list[PyJunction] = odr_map.get_junctions()

print("\nROADS:")
for road in roads:
    lanesections: list[PyLaneSection] = road.get_lanesections()
    print("---BEGIN ROAD---")
    print(f"Road ID: {road.id}")
    print("---BEGIN LANESECTIONS---")
    for lanesec in lanesections:
        print(f"Assoc. Road ID: {lanesec.road_id}; S0: {lanesec.s0}; # Lanes: {len(lanesec.id_to_lane.keys())}")
    print("---END LANESECTIONS--")
    print("---END ROAD---\n")

print("\nJUNCTIONS:")
for junction in junctions:
    print(junction.id)
    
#roads2 = odr_map.get_roads()