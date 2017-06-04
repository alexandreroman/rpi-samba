#!/bin/sh

# Copyright (c) 2017 Alexandre Roman <alexandre.roman@gmail.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

cat > /etc/samba/smb.conf <<EOF
[global]
socket options = TCP_NODELAY IPTOS_LOWDELAY SO_RCVBUF=65536 SO_SNDBUF=65536
smb ports = 445
max protocol = SMB2
min receivefile size = 16384
deadtime = 30
os level = 20
map to guest = bad user
printer = bsd
printcap name = /dev/null
load printers = no
create mask = 0644
force create mode = 0644
directory mask = 0755
force directory mode = 0755
browsable = yes
writable = yes
guest account = root
force user = root
force group = root
[Public]
path = /data/share
guest ok = yes
read only = no
EOF
ionice -c 3 nmbd -D
exec ionice -c 3 smbd -FS --configfile=/etc/samba/smb.conf </dev/null
