FROM debian:latest

# Packages
RUN apt-get update && apt-get install -y curl git unzip xz-utils zip libglu1-mesa openjdk-11-jdk wget

# User
RUN useradd -ms /bin/bash dbruno
USER dbruno
WORKDIR /home/dbruno

# Android Directories
RUN mkdir -p android/cmdline-tools
ENV ANDROID_SDK_ROOT /home/dbruno/android/cmdline-tools
RUN mkdir -p .android && touch .android/repositories.cfg

# Android SDK
RUN wget -O commandlinetools.zip https://dl.google.com/android/repository/commandlinetools-linux-8512546_latest.zip
RUN unzip commandlinetools.zip && rm commandlinetools.zip
RUN mv cmdline-tools/ tools/ && mv tools/ android/cmdline-tools/
RUN cd android/cmdline-tools/tools/bin && yes | ./sdkmanager --licenses
RUN cd android/cmdline-tools/tools/bin && ./sdkmanager "build-tools;31.0.0" "patcher;v4" "platform-tools" "platforms;android-31" "sources;android-31"
ENV PATH "$PATH:/home/dbruno/android/platform-tools"

# Flutter SDK
RUN git clone https://github.com/flutter/flutter.git -b stable
ENV PATH "$PATH:/home/dbruno/flutter/bin"

# Basic Check
RUN flutter doctor -v
