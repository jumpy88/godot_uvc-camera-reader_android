CC             = $(ANDROID_NDK)/toolchains/llvm/prebuilt/linux-x86_64/bin/clang++
TARGET         = --target=aarch64-linux-android21
ARCH           = -march=armv8-a
DIR            = ../uvc-camera-reader_android/bin/lib
GODOT_INCLUDE  = -I$(GODOT_HOME)/godot_headers -I$(GODOT_HOME)/include -I$(GODOT_HOME)/include/core -I$(GODOT_HOME)/include/gen
GODOT_LINK     = -L$(GODOT_HOME)/bin/ -lgodot-cpp.android.release.arm64v8
UVC_INCLUDE    = -I$(UVC_HOME)/libuvc/include -I$(UVC_HOME)/libusb -I$(UVC_HOME)
UVC_LINK       = -L../uvc-camera-reader_android/bin/dependencies -luvc

$(DIR)/libuvccra.so: $(DIR)/screen.o $(DIR)/uvc-camera-reader_android.o
	$(CC) $(TARGET) $(ARCH) -shared -o $(DIR)/libuvccra.so $(DIR)/screen.o $(DIR)/uvc-camera-reader_android.o $(GODOT_LINK) $(UVC_LINK)

$(DIR)/screen.o: screen.cpp screen.h
	$(CC) $(TARGET) $(ARCH) -c -fPIC -o $(DIR)/screen.o screen.cpp $(GODOT_INCLUDE) $(UVC_INCLUDE)

$(DIR)/uvc-camera-reader_android.o: uvc-camera-reader_android.cpp screen.h
	$(CC) $(TARGET) $(ARCH) -c -fPIC -o $(DIR)/uvc-camera-reader_android.o uvc-camera-reader_android.cpp $(GODOT_INCLUDE) $(UVC_INCLUDE)

clean:
	rm -f $(DIR)/screen.o
	rm -f $(DIR)/uvc-camera-reader_android.o
