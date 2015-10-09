#!/usr/bin/make -f

all: ckan/public/base/css/main.min.css

ckan/public/base/css/%.css: \
		ckan/public/base/less/%.less \
		$(wildcard ckan/public/base/less/*.less)
	lessc $< $@

ckan/public/base/css/%.min.css: ckan/public/base/css/%.css
	cssmin <$< >$@

# EOF
