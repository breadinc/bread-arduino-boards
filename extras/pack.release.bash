#!/bin/bash -ex

#  pack.*.bash - Bash script to help packaging atsamd21e18a core releases.
#  Copyright (c) 2015 Arduino LLC.  All right reserved.
#
#  This library is free software; you can redistribute it and/or
#  modify it under the terms of the GNU Lesser General Public
#  License as published by the Free Software Foundation; either
#  version 2.1 of the License, or (at your option) any later version.
#
#  This library is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
#  Lesser General Public License for more details.
#
#  You should have received a copy of the GNU Lesser General Public
#  License along with this library; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

VERSION=`grep version= platform.txt | sed 's/version=//g'`

PWD=`pwd`
FOLDERNAME=`basename $PWD`
THIS_SCRIPT_NAME=`basename $0`
ARCHIVE_PREFIX='bread-arduino-boards'

ARCHIVE_NAME="$ARCHIVE_PREFIX-$VERSION.tar.bz2"

rm -f $ARCHIVE_NAME || echo "No archive to delete at $ARCHIVE_NAME; Skipping..."

cd ..
tar --transform "s|$FOLDERNAME|$FOLDERNAME-$VERSION|g"  --exclude=extras/** --exclude=.git* --exclude=.idea -cjf $ARCHIVE_NAME $FOLDERNAME
cd -

