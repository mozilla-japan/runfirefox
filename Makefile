# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this file,
# You can obtain one at http://mozilla.org/MPL/2.0/.  -->

# Makefile for Run Firefox application

# Source directories
srcdir = lib

# Output directory
builddir = public/js

# Modules (these are combined into the library)
modules =	$(srcdir)/rsvp.js/browser/rsvp.js \
          $(srcdir)/utils.js \
          $(srcdir)/tracker.js \
					$(srcdir)/activityStore.js \
					$(srcdir)/slidebox/x-tag-components.js \
					$(srcdir)/slidebox/slidebox.js \
					$(srcdir)/setting.js \
					$(srcdir)/home.js \
					$(srcdir)/audio.js \
					$(srcdir)/mapView.js \
					$(srcdir)/controllers.js

# File list
files = $(modules) $(deps)

# Output list
runfirefox = $(builddir)/runfirefox.js
runfirefox-dev = $(builddir)/runfirefox-dev.js

# Default target
all: lib

# Compressed version
$(runfirefox): $(files)
	tools/UglifyJS2/bin/uglifyjs $^ -o $@ -c

# Debug version
$(runfirefox-dev): $(files)
	cat $^ > $@ 

lib: $(runfirefox) $(runfirefox-dev)

.PHONY: clean

clean:
	rm -f $(runfirefox) $(runfirefox-dev)
