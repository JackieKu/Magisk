LOCAL_PATH := $(call my-dir)

# Some handy paths
EXT_PATH := jni/external
SE_PATH := $(EXT_PATH)/selinux
LIBSELINUX := $(SE_PATH)/libselinux/include
LIBSEPOL := $(SE_PATH)/libsepol/include $(SE_PATH)/libsepol/cil/include

########################
# Binaries
########################

# sepolicy-inject
include $(CLEAR_VARS)
LOCAL_MODULE := sepolicy-inject
LOCAL_STATIC_LIBRARIES := libsepol
LOCAL_C_INCLUDES := \
	jni/include \
	jni/magiskpolicy \
	../out/$(TARGET_ARCH_ABI) \
	$(LIBSEPOL)

LOCAL_SRC_FILES := \
	magiskpolicy/api.c \
	magiskpolicy/magiskpolicy.c \
	magiskpolicy/rules.c \
	magiskpolicy/sepolicy.c \
	utils/vector.c

LOCAL_CFLAGS := -Dmagiskpolicy_main=main
include $(BUILD_EXECUTABLE)

########################
# Externals
########################
include jni/external/Android.mk
