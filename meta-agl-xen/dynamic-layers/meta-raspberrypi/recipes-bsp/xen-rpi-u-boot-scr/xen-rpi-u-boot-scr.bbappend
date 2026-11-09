FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

# Hopefully temporary workaround for upstream bug
UNPACKDIR:forcevariable = "${WORKDIR}/sources"
S = "${UNPACKDIR}"

COMPATIBLE_MACHINE:raspberrypi5 = "^raspberrypi5$"

RPI_DOM0_MEM = "1024M"

#RPI_DEBUG_XEN_ARGS:append = " loglvl=all guest_loglvl=all"
