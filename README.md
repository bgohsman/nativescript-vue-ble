# NativeScript Vue with BLE

## Development Environment Requirements
- XCode
- Android Studio
- Follow the [NativeScript setup instructions](https://docs.nativescript.org/angular/start/quick-setup) for your specific platform

## Running Locally

### Vue Devtools
- Runs an instance of the standalone Vue Devtools
- Locally run app should connect automatically
```
make devtools
```

### Build Dependencies:
- Calls `tns install`, if needed
- Adds android/iOS platforms, if missing
- Installs project dependencies
```
make depends
```

### Android - Run:
- Builds dependencies
- Builds/runs on Android device
- Starts a project watcher
```
make run-android
```

### iOS - Run:
- Builds dependencies
- Builds/runs on iOS device
- Starts a project watcher
```
make run-ios
```

### Android - Debug:
- Builds dependencies
- Builds/runs on Android device in debug mode
- Starts a project watcher
- Starts a debug server
```
make debug-android
```

### iOS - Debug:
- Builds dependencies
- Builds/runs on iOS device in debug mode
- Starts a project watcher
- Starts a debug server
```
make debug-ios
```

### Clean up `node_modules`
- Remove downloaded dependencies
```
make clean
```

### Full project clean
- Everything in `make clean`
- Remove temporary files
- Clean android/ios platforms
```
make clean-all
```
## Unit Tests
The testing framework for unit tests is [Mocha/Chai](https://mochajs.org/). 

### Android
```
make unit-android
```

### iOS
```
make unit-ios
```

## End-to-End Tests
The testing framework for e2e tests is [Appium](http://appium.io/). Requires local environment be setup for Appium. [Environment Setup Guide](https://docs.nativescript.org/tooling/testing/end-to-end-testing/overview)

### Android
```
make e2e-android
```

### iOS
```
make e2e-ios
```

## Toolchain/Dependencies Notes
- [Vuex](https://vuex.vuejs.org/)
- [nativescript-bluetooth](https://github.com/EddyVerbruggen/nativescript-bluetooth)
