

all:

test: link

link: build/debian
	ln -s debian/ build/debian
	#test -d build/debian && echo "proceed to build" \
	#|| ln -s debian/ build/debian

build:
	( cd build;  \
    ../equivs-build --source ./debian/control; \
    cd .. )

clean:
	rm -Rf build/*

.PHONY: build

#####
# EOF
