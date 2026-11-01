# meta-agl-ros2

ROS 2 recipes for AGL, layered on top of meta-ros, together with the LiDAR
perception demo.

## LiDAR perception demo

A reproducible demo that turns a recorded CARLA LiDAR clip into 3D object
detections on the target and draws them in the Flutter HMI. It runs fully
offline, with no live simulator, no GPU, and no network.

```
recorded CARLA clip (ros2 bag)
  -> /carla/lidar            sensor_msgs/PointCloud2
  -> lidar_detector (PCL)    voxel downsample, passthrough crop,
                             RANSAC ground removal, Euclidean clustering
  -> /carla/detections       vision_msgs/Detection3DArray  (~30 Hz)
  -> rosbridge :9090         WebSocket / JSON
  -> Flutter HMI (agl_lidar_demo)
```

Recipes:

* `recipes-ros2/lidar-detector/`: the PCL perception node.
* `recipes-ros2/agl_lidar_demo/`: the Flutter HMI, the recorded clip, and the
  `agl-lidar-demo.service` launcher.

## Build

Enable the feature on top of the Flutter IVI demo and build the image:

```sh
source meta-agl/scripts/aglsetup.sh \
    -m jetson-orin-nano-devkit-nvme -b build-jetson-ivi \
    agl-demo agl-flutter agl-ros2
bitbake agl-ivi-demo-flutter
```

## Run

The backend starts itself on boot under `agl-lidar-demo.service`: a local
rosbridge on port 9090, the `lidar_detector` node, and the bag replay. Open the
"AGL LiDAR Demo" tile, or launch it from a shell:

```sh
agl-shell-activator -a activate -p agl_lidar_demo -o DP-1
```

Check the pipeline is live on the board:

```sh
ros2 topic hz /carla/detections     # expect ~30 Hz
```

## More

* Complete reproduction guide (prerequisites, build, flash, run, troubleshooting):
  <https://github.com/shauryarane05/agl-lidar-hmi-app/blob/main/REPRODUCE.md>
* The HMI application, the recorded clip, and the offline demo helper:
  <https://github.com/shauryarane05/agl-lidar-hmi-app>

## Maintainers

Shaurya Rane <ssranevjti@gmail.com>
