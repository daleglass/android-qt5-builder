#!/bin/bash

podman run -v .:/data:Z -it vircadia-android-qt-builder:$1
