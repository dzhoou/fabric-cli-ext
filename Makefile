#
# Copyright SecureKey Technologies Inc. All Rights Reserved.
#
# SPDX-License-Identifier: Apache-2.0
#

#
# Supported Targets:
#
# unit-test:                  runs unit tests
# lint:                       runs linters
# checks:                     runs code checks
#

# Local variables used by makefile
PROJECT_NAME            = fabric-cli-ext
export GO111MODULE      = on

checks: version license lint

lint:
	@scripts/check_lint.sh

license: version
	@scripts/check_license.sh

all: clean checks plugins unit-test

unit-test:
	@scripts/unit.sh

version:
	@scripts/check_version.sh

plugins:
	@scripts/build_plugins.sh

clean:
	rm -rf ./.build

.PHONY: all version unit-test license plugins clean
