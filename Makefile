SHELL := /bin/bash
RELEASE := v0.6.0
VERSION := $(shell sed 's/^v//' <<< "$(RELEASE)")

.PHONY: all
all: bin/mesos-dns

.PHONY: builddeb
builddeb: debian/changelog dist
	debuild -us -uc -b
	mv ../mesos-dns_$(VERSION)_amd64.deb dist/

bin dist:
	mkdir -p "$@"

bin/mesos-dns: bin Makefile
	wget -O '$@' 'https://github.com/mesosphere/mesos-dns/releases/download/$(RELEASE)/mesos-dns-$(RELEASE)-linux-amd64'

debian/changelog: Makefile
	rm -f '$@'
	DEBFULLNAME="Chris Kuehl" \
		DEBEMAIL="ckuehl@ocf.berkeley.edu" \
		VISUAL=true \
		dch -v '$(VERSION)' -D stable --no-force-save-on-release \
			--create --package mesos-dns 'Package for Debian.'
