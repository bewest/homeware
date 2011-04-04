

all:

lint: lintian

lintian:
	lintian -i build/*.changes

build/debian:
	# Set up build directory
	ln -s -t build/ ../debian 

build: build/debian
	( cd build;  \
    ../equivs-build --source ./debian/control; \
    cd .. )

clean:
	rm -Rf build/*

.PHONY: build lint lintian clean

#####
# EOF
