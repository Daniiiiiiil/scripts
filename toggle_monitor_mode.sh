# /bin/bash

# ! Root required !

set_mode_monitor(){
    service NetworkManager stop && \
    ip link set wlp7s0 down && \
    iw dev wlp7s0 set type monitor && \
    ip link set wlp7s0 up
}


set_mode_managed(){
    ip link set wlp7s0 down && \
    iw dev wlp7s0 set type managed && \
    ip link set wlp7s0 up && \
    service NetworkManager start
}


if [ $(iw dev | grep -c managed) == 1 ]; then
   set_mode_monitor && \
   echo "Monitor mode Enabled"
else
    set_mode_managed && \
    echo "Monitor mode Disabled"
fi

