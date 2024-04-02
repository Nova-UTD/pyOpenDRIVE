from pyOpenDRIVE.OpenDriveMap import PyOpenDriveMap
from pyOpenDRIVE.Junction import PyJunction
from pyOpenDRIVE.Road import PyRoad
from pyOpenDRIVE.LaneSection import PyLaneSection

odr_map = PyOpenDriveMap(b"./test.xodr")

roads: list[PyRoad] = odr_map.get_roads()
junctions: list[PyJunction] = odr_map.get_junctions()

print("\nROADS: [")
for road in roads:
    lanesections: list[PyLaneSection] = road.get_lanesections()
    print("\tRoad {")
    print(f"\t\tRoad ID: {road.id}")
    print(f"\t\tRoad XYZ: {road.get_xyz(0, 0, 0).array}")
    print("\t\tLaneSections {")
    for lanesec in lanesections:
        print(f"\t\t\tAssoc. Road ID: {lanesec.road_id}; S0: {lanesec.s0}; # Lanes: {len(lanesec.id_to_lane.keys())}")
    print("\t\t}")
    print("\t}\n")
print("]")

print("\nJUNCTIONS: [")
for junction in junctions:
    print("\tJunction {")
    print(f"\t\tJunction ID: {junction.id}")
    print("\t}\n")
print("]")
    
#roads2 = odr_map.get_roads()