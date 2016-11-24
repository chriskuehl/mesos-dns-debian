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

# both of these are PHONY in case the version changes...
.PHONY: bin/mesos-dns
bin/mesos-dns: bin
	wget -O '$@' 'https://github.com/mesosphere/mesos-dns/releases/download/$(RELEASE)/mesos-dns-$(RELEASE)-linux-amd64'

.PHONY: debian/changelog
debian/changelog:
	rm -rf '$@'
	DEBFULLNAME="Chris Kuehl" \
		DEBEMAIL="ckuehl@ocf.berkeley.edu" \
		VISUAL=true \
		dch -v '$(VERSION)' -D stable --no-force-save-on-release \
			--create --package mesos-dns 'Package for Debian.'
