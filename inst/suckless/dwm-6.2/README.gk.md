patch -p1 < dwm-fullgaps-6.2.diff
echo "config.h: see uselessgap for gappx"
patch  -p1 < dwm-gridmode-20170909-ceac8c9.diff
echo "gridmode enabled only in config.def.h"

