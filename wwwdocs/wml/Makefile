
HOSTNAME = $(shell hostname)

ifeq ($(HOSTNAME),vipe.technion.ac.il)
	VIPE = 1
endif

ifdef BERLIOS
	ifdef VIPE
		D = $(HOME)/progs/fcs/berlios-site
	else
		D = /var/www/html/seminars-static--berlios
	endif
	WML_FLAGS = -DBERLIOS=BERLIOS
else
	ifdef VIPE
		D = $(HOME)/public_html/freecell-solver/
	else
		D = /var/www/html/seminars-static
	endif
	WML_FLAGS = 
endif
#D = /home/httpd/html/ip-noise

IMAGES_PRE1 = $(shell cd src && (ls *.tar.gz *.zip *.patch *.css *.png))
IMAGES = $(addprefix $(D)/,$(IMAGES_PRE1))

# WML_FLAGS = -DBERLIOS=BERLIOS

WML_FLAGS += --passoption=2,-X

HTMLS = $(D)/index.html $(D)/download.html $(D)/links.html $(D)/don_woods.html $(D)/features.html $(D)/old-news.html $(D)/book.html

ARC_DOCS = $(D)/README $(D)/USAGE $(D)/ChangeLog $(D)/TODO $(D)/AUTHORS

INCLUDES_PROTO = std/logo.wml
INCLUDES = $(addprefix src/,$(INCLUDES_PROTO))

SUBDIRS = $(D)/docs $(D)/download

IMAGES += $(addprefix $(D)/win32_build/,bootstrap/build.bat)

all : $(SUBDIRS) $(HTMLS) $(IMAGES) $(RAW_SUBDIRS) $(ARC_DOCS)

$(SUBDIRS) :: % : 
	@if [ ! -e $@ ] ; then \
		mkdir $@ ; \
	fi

RECENT_STABLE_VERSION = $(shell ./get-recent-stable-version.sh)

$(ARC_DOCS) :: $(D)/% : src/freecell-solver-$(RECENT_STABLE_VERSION).tar.gz
	tar -xOzf $< freecell-solver-$(RECENT_STABLE_VERSION)/$(notdir $@) > $@

src/win32_build/dynamic/fcs.zip: src/freecell-solver-$(RECENT_STABLE_VERSION).tar.gz
	mkdir t    
	cd t && \
	tar -xzvf ../$<; \
	cd free* &&       \
	zip -r ../../$@ * ; \
	cd ../../ && \
	rm -fr t        

$(HTMLS) :: $(D)/% : src/%.wml src/.wmlrc template.wml $(INCLUDES)
	cd src && wml $(WML_FLAGS) -DFILENAME="$(notdir $@)" $(notdir $<) > $@

$(IMAGES) :: $(D)/% : src/%
	cp -f $< $@

$(RAW_SUBDIRS) :: $(D)/% : src/%
	rm -fr $@
	cp -r $< $@