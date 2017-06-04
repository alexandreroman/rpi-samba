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

FROM sdhibit/rpi-raspbian:jessie
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y --no-install-recommends samba-common-bin samba

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/*

EXPOSE 137/udp 138/udp 139 445

ADD smb.sh .
RUN chmod +x smb.sh
CMD /smb.sh
