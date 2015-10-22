#!/usr/bin/make -f

pos = $(wildcard ckan/i18n/*/*/*.po)
mos = $(pos:.po=.mo)

all: ckan/public/base/css/main.min.css ${mos}

ckan/public/base/css/%.css: \
		ckan/public/base/less/%.less \
		$(wildcard ckan/public/base/less/*.less)
	lessc $< $@

ckan/public/base/css/%.min.css: ckan/public/base/css/%.css
	cssmin <$< >$@

%.mo: %.po
	msgfmt -o $@ $<

# EOF
