TEMPLATE = lib
CONFIG -= qt
CONFIG += c++11
TARGET = uvccra

INCLUDEPATH += $$(GODOT_HOME)/godot_headers \
               $$(GODOT_HOME)/include \
			   $$(GODOT_HOME)/include/core \
			   $$(GODOT_HOME)/include/gen \
			   $$(UVC_HOME) \
			   $$(UVC_HOME)/libuvc/include \
			   $$(UVC_HOME)/libusb \
			   $$(ANDROID_NDK)/toolchains/llvm/prebuilt/linux-x86_64/sysroot/usr/include

DEPENDPATH += $$(GODOT_HOME)/godot_headers \
              $$(GODOT_HOME)/include \
			  $$(GODOT_HOME)/include/core \
			  $$(GODOT_HOME)/include/gen \
			  $$(UVC_HOME) \
			  $$(UVC_HOME)/libuvc/include \
			  $$(UVC_HOME)/libusb \
			  $$(ANDROID_NDK)/toolchains/llvm/prebuilt/linux-x86_64/sysroot/usr/include

SOURCES += \
    uvc-camera-reader_android.cpp \
	screen.cpp

HEADERS += \
    screen.h

LIBS += -luvc

unix:!macx: LIBS += -L$$(GODOT_HOME)/bin/ -lgodot-cpp.linux.release.64

unix:!macx: PRE_TARGETDEPS += $$(GODOT_HOME)/bin/libgodot-cpp.linux.release.64.a
