#
# Simple cmake wrapper. Make sure you run ./configure before running make
# targets.
#

BUILD=build
SUBDIRS := $(wildcard $(BUILD)/*)
all: configured
		@for d in $(SUBDIRS); do \
				if [ -d $$d ]; then \
						echo "Processing folder $$d"; \
						$(MAKE) $@ -C $$d; \
				fi; \
		done;
		@echo "Done!"
install: configured all
		@for d in $(SUBDIRS); do \
				if [ -d $$d ]; then \
						echo "Processing folder $$d"; \
						$(MAKE) $@ -C $$d; \
				fi; \
		done;
		@echo "Done!"

clean: configured
		@for d in $(SUBDIRS); do \
				if [ -d $$d ]; then \
						echo "Processing folder $$d"; \
						$(MAKE) $@ -C $$d; \
				fi; \
		done;
		@echo "Done!"

dist: configured
		@for d in $(SUBDIRS); do \
				if [ -d $$d ]; then \
            tput setaf 3; \
						echo "Processing folder $$d"; \
            tput setaf 7; \
						$(MAKE) package_source -C $$d; \
            tput setaf 2; \
						echo "Copying .tar.gz files to $(BUILD) directory"; \
            tput setaf 7; \
						cp $$d/*.tar.gz $$d/..; \
				fi; \
		done;
		@echo "Done!"

bindist: configured
		@for d in $(SUBDIRS); do \
				if [ -d $$d ]; then \
            tput setaf 3; \
						echo "Processing folder $$d"; \
            tput setaf 7; \
						$(MAKE) package -C $$d; \
            tput setaf 2; \
						echo "$$(tput setaf 2)Copying .deb files to $(BUILD) directory"; \
            tput setaf 7; \
						cp $$d/*.deb $$d/..; \
				fi; \
		done;
		@echo "Done!"

distclean: configured
	rm -rf $(BUILD)

configured:
	@test -d $(BUILD) || ( echo "Error: No build/ directory found. Did you run configure?" && exit 1 )

.PHONY : all install clean dist bindist distclean configured
