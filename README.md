# Vircadia Qt5 Android builder
This is a quick and dirty set of tools for building a Qt suitable for Android versions of Vircadia.

**Note:** This was done on Fedora using Podman. Other distros may need to replace calls to `podman` with `docker`.

## Instructions
1. Install Android Studio
2. Copy the Android folder to the `files/` directory. It must contain SDK 28, and NDK 22.1.7171670.
3. Generate the container with `./build_container`.
4. Enter the container with `./run`
5. Run `/data/build_qt`

Hopefully that'll work and produce a working Qt in the `out/` directory after a while.

## Problems that needed solving
A bit of information for people interested in what troubleshooting needed to be done:

### Obtain OpenSSL for Android
Vircadia definitely wants to have SSL support.

The library was obtained from the helpful android_openssl repository, which is suggested by the Qt docs. It's automatically checked out during the build. The script creates a `libs/` directory, and copies there the libraries specific to each architecture, and gives them the right names.

### Build GL ES 3.2
Vircadia **requires** OpenGL ES 3.2 as the minimum. This requires the following steps:

* Edit the Qt android spec to link against libGLESv3 rather than libGLESv.2. This gets at least GL ES 3.1 support.
* Call `configure` with `-android-ndk-platform android-28`. Turns out the GL libraries are present per SDK version, and by default Qt goes with "android-21", which doesn't support GL ES 3.2. 

