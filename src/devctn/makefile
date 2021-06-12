.SILENT .PHONY: devctn
devctn:
	. src/devctn/build.sh

.SILENT .PHONY: devctn.run
devctn.run:
	. src/devctn/run.sh

.SILENT .PHONY: devctn.sh
devctn.sh:
	podman exec -it "$(PROJECT_NAME)/devctn" /bin/bash