from pyOpenDRIVE.OpenDriveMap import PyOpenDriveMap
from pyOpenDRIVE.Lane import PyLane
from pyOpenDRIVE.LaneSection import PyLaneSection
from pyOpenDRIVE.Mesh import PyMesh
from pyOpenDRIVE.Road import PyRoad

import sys

if (len(sys.argv) < 2):
    print("ERROR: too few arguments\n")
    exit(-1)

odr_map = PyOpenDriveMap(sys.argv[1].encode())
eps: float = 0.1

lane_pts = []
roadmark_pts = []
road_object_pts = []
road_signal_pts = []

for road in odr_map.get_roads():
    print(f"road: {road.id}, length: {road.length}\n")
    for lanesection in road.get_lanesections():
        s_start: float = lanesection.s0
        s_end: float = road.get_lanesection_end(lanesection)

        for lane in lanesection.get_lanes():
            lane_mesh = road.get_lane_mesh(lane, eps)
            lane_pts.extend(lane_mesh.vertices)

            roadmarks = lane.get_roadmarks(s_start, s_end)
            for roadmark in roadmarks:
                roadmark_mesh = road.get_roadmark_mesh(lane, roadmark, eps)
                roadmark_pts.extend(roadmark_mesh.vertices)

    for road_object in road.get_road_objects():
        road_object_mesh = road.get_road_object_mesh(road_object, eps)
        road_object_pts.extend(road_object_mesh.vertices)

    for road_signal in road.get_road_signals():
        road_signal_mesh = road.get_road_signal_mesh(road_signal)
        road_signal_pts.extend(road_signal_mesh.vertices)

print(f"Finished, got {len(lane_pts)} lane points, {len(roadmark_pts)} roadmark points, {len(road_object_pts)} road object points, {len(road_signal_pts)} road signal points\n")

road_network_mesh = odr_map.get_road_network_mesh(eps)
print("Got road network mesh\n")