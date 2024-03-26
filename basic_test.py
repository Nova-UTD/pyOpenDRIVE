from pyOpenDRIVE.OpenDriveMap import PyOpenDriveMap
from pyOpenDRIVE.Junction import PyJunction
from pyOpenDRIVE.Road import PyRoad, PyRoadLink

odr_map = PyOpenDriveMap(b"./test.xodr")

print(f"odr_map doc name: {odr_map.xml_doc.name()}")

roads: list[PyRoad] = odr_map.get_roads()
junctions: list[PyJunction] = odr_map.get_junctions()

print("\nROADS:")
for road in roads:
    print(road.id)
    link: PyRoadLink = road.predecessor
    print(link.id, link.type, link.contact_point)

print("\nJUNCTIONS:")
for junction in junctions:
    print(junction.id)
    
#roads2 = odr_map.get_roads()