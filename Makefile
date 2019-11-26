PROJECTNAME = my-app
NPM := npm
NPX := npx
TNS := tns
VDT := vue-devtools

############## FUNCTION DEFINES ##############

define dependency_install
	$(NPM) install
endef

define vue_devtools
	$(NPX) vue-devtools
endef

define tns_install
	$(TNS) install
endef

define add_platforms
	if test -d ./platforms; then echo platforms exists; else $(call tns_install); fi
	if test -d ./platforms/android; then echo android exists; else $(call add_android); fi
	if test -d ./platforms/ios; then echo ios exists; else $(call add_ios); fi
endef

define add_android
	$(TNS) platform add android
endef

define add_ios
	$(TNS) platform add ios
endef

define dev_start_ios
	$(TNS) run ios
endef

define dev_start_android
  $(TNS) run android --emulator
endef

define debug_ios
	$(TNS) debug ios --emulator
endef

define debug_android
  $(TNS) debug android --emulator
endef

define prepare_ios
	$(TNS) prepare ios
endef

define prepare_android
  $(TNS) prepare android
endef

define build_ios
	$(TNS) build ios
endef

define build_android
  $(TNS) build android
endef

define unit_tests_ios
	$(TNS) test ios --emulator
endef

define e2e_tests_ios
	$(NPM) run e2e -- --runType sim.iPhone8
endef

define e2e_tests_android
	$(NPM) run e2e -- --runType android28
endef

define unit_tests_android
	$(TNS) test android --emulator
endef

define clean
	rm -rf node_modules
endef

define clean_all
	rm -rf .idea
	rm -rf mochawesome-report
	$(call clean_platform)
	$(TNS) doctor
endef

define clean_android
	$(TNS) platform clean android
endef

define clean_ios
	$(TNS) platform clean ios
endef

define clean_platform
	if test -d ./platforms/android; then \
		$(call clean_android); else \
		$(call add_android); \
	fi
	if test -d ./platforms/ios; then \
		$(call clean_ios); else \
		$(call add_ios); \
	fi
endef

############## MAKE COMMANDS ##############

PHONY: all
all: depends

PHONY: depends
depends:
	$(call add_platforms)
	$(call dependency_install)

devtools:
	$(call vue_devtools)

prep-ios: 
	$(call prepare_ios)

prep-android: 
	$(call prepare_android)

run-ios: depends
	$(call dev_start_ios)

run-android: depends
	$(call dev_start_android)

debug-ios: depends
	$(call debug_ios)

debug-android: depends
	$(call debug_android)

unit-ios: depends
	$(call unit_tests_ios)

unit-android: depends
	$(call unit_tests_android)

# Usage: https://github.com/NativeScript/nativescript-dev-appium#usage
e2e-ios: build-ios
	$(call e2e_tests_ios)

e2e-android: build-android
	$(call e2e_tests_android)

build-ios:
	$(call build_ios)

build-android:
	$(call build_android)

PHONY: clean
clean:
	$(call clean)

clean-all: clean
	$(call clean_all)

clean-platform:
	$(call clean_platform)
