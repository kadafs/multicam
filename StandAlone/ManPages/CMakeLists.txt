# Multicam, camera capture application.
# Copyright (C) 2021  Gonzalo Exequiel Pedone
#
# Multicam is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Multicam is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Multicam. If not, see <http://www.gnu.org/licenses/>.
#
# Web-Site: http://Multicam.github.io/

cmake_minimum_required(VERSION 3.16)

project(ManPages)

include(../../libAvKys/cmake/ProjectCommons.cmake)

set(MANPAGE StandAlone/share/man/Multicam.1)
string(TIMESTAMP RELEASE_DATE "%d %b %Y")
configure_file(src/Multicam.1.in src/Multicam.1)
find_program(GZIP_TOOL gzip)

if (GZIP_TOOL)
    add_custom_target(manpages ALL
                      ${GZIP_TOOL} -n -c9 Multicam.1 > Multicam.1.gz
                      DEPENDS src/Multicam.1
                      WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/src
                      BYPRODUCTS src/Multicam.1.gz
                      VERBATIM
                      SOURCES src/Multicam.1.in)

    install(FILES ${CMAKE_CURRENT_BINARY_DIR}/src/Multicam.1.gz DESTINATION ${CMAKE_INSTALL_MANDIR}/man1)
endif ()

