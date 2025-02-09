all: extract_results

BUILD_DIR=build

.PHONY:	extract_results

MODEL=sky130_fd_pr__nfet_01v8

PARAMS=tt_0.15_1.0 tt_0.15_5.0 tt_0.15_10.0 tt_1.0_1.0 tt_1.0_5.0 tt_1.0_10.0
RAW_FILES=$(addprefix $(BUILD_DIR)/,$(addsuffix .raw, $(PARAMS)))

$(info $(RAW_FILES))

$(BUILD_DIR)/%.raw: nmos-sweep.spice
	@mkdir -p $(BUILD_DIR)
	$(eval PARAM := $(notdir $(basename $@)))
	$(eval CORNER := $(word 1, $(subst _, ,$(PARAM))))
	$(eval LENGTH := $(word 2, $(subst _, ,$(PARAM))))
	$(eval WIDTH  := $(word 3, $(subst _, ,$(PARAM))))

	@echo "Building for corner $(CORNER), L=$(LENGTH) um, W=$(WIDTH) um"
	@# Substitute parameters
	cat nmos-sweep.spice | sed s/\$$\{FILE\}/$(BUILD_DIR)\\/$(PARAM).raw/g | sed s/\$$\{CORNER\}/$(CORNER)/g | sed s/\$$\{LENGTH\}/$(LENGTH)/g | sed s/\$$\{WIDTH\}/$(WIDTH)/g | \
	       	sed s/\$$\{MODEL\}/$(MODEL)/g	> $(BUILD_DIR)/top_$(PARAM).spice
	@ngspice $(BUILD_DIR)/top_$(PARAM).spice

extract_results: $(RAW_FILES)
	@mkdir -p results
	python3 extract_results.py | tee results/results.txt

clean:
	rm -rf $(BUILD_DIR)
