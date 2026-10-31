AGL_META_PYTHON = "${METADIR}/external/meta-openembedded/meta-python"
BBLAYERS =+ " \
   ${METADIR}/meta-agl-devel/meta-agl-ros2 \
   ${METADIR}/external/meta-ros/meta-ros-common \
   ${METADIR}/external/meta-ros/meta-ros2 \
   ${METADIR}/external/meta-ros/meta-ros2-humble \
"
