# Copyright (C) 2008 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
MTD_SRC := lib/libcrc32.c \
      lib/libfec.c \
      lib/libmtd.c \
      lib/platform.c \
      lib/libmtd_legacy.c
UBIFS_SRC := ubi-utils/dictionary.c \
      ubi-utils/libiniparser.c \
      ubi-utils/libscan.c \
      ubi-utils/libubi.c \
      ubi-utils/libubigen.c \
      ubi-utils/ubiutils-common.c
INCLUDES := $(LOCAL_PATH)/include \
	$(LOCAL_PATH)/ubi-utils/include/
LOCAL_C_INCLUDES := $(LOCAL_PATH)/include \
	$(LOCAL_PATH)/ubi-utils/include/
LOCAL_CFLAGS += -D_GNU_SOURCE -DNO_GETLINE -DNO_RPMATCH
LOCAL_SRC_FILES := $(UBIFS_SRC) \
	$(MTD_SRC)
LOCAL_MODULE := libmtd-utils
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := ubi-utils/ubiformat.c 
LOCAL_MODULE := ubiformat
LOCAL_SHARED_LIBRARIES := libmtd-utils
LOCAL_C_INCLUDES := $(INCLUDES)
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := ubi-utils/ubiattach.c 
LOCAL_MODULE := ubiattach
LOCAL_SHARED_LIBRARIES := libmtd-utils
LOCAL_C_INCLUDES := $(INCLUDES)
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := ubi-utils/mtdinfo.c
LOCAL_MODULE := mtdinfo
LOCAL_SHARED_LIBRARIES := libmtd-utils
LOCAL_C_INCLUDES := $(INCLUDES)
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := ubi-utils/ubiblock.c
LOCAL_MODULE := ubiblock
LOCAL_SHARED_LIBRARIES := libmtd-utils
LOCAL_C_INCLUDES := $(INCLUDES)
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := ubi-utils/ubidetach.c
LOCAL_MODULE := ubidetach
LOCAL_SHARED_LIBRARIES := libmtd-utils
LOCAL_C_INCLUDES := $(INCLUDES)
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := ubi-utils/ubimkvol.c
LOCAL_MODULE := ubimkvol
LOCAL_SHARED_LIBRARIES := libmtd-utils
LOCAL_C_INCLUDES := $(INCLUDES)
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := ubi-utils/ubirmvol.c
LOCAL_MODULE := ubirmvol
LOCAL_SHARED_LIBRARIES := libmtd-utils
LOCAL_C_INCLUDES := $(INCLUDES)
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := ubi-utils/ubiupdatevol.c
LOCAL_MODULE := ubiupdatevol
LOCAL_SHARED_LIBRARIES := libmtd-utils
LOCAL_C_INCLUDES := $(INCLUDES)
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := ubi-utils/ubirsvol.c
LOCAL_MODULE := ubirsvol
LOCAL_SHARED_LIBRARIES := libmtd-utils
LOCAL_C_INCLUDES := $(INCLUDES)
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := ubi-utils/ubicrc32.c
LOCAL_MODULE := ubicrc32
LOCAL_SHARED_LIBRARIES := libmtd-utils
LOCAL_C_INCLUDES := $(INCLUDES)
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := ubi-utils/ubinfo.c
LOCAL_MODULE := ubinfo
LOCAL_SHARED_LIBRARIES := libmtd-utils
LOCAL_C_INCLUDES := $(INCLUDES)
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := flash_erase.c
LOCAL_MODULE := flash_erase
LOCAL_SHARED_LIBRARIES := libmtd-utils
LOCAL_C_INCLUDES := $(INCLUDES)
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := flash_lock.c
LOCAL_MODULE := flashlock
LOCAL_SHARED_LIBRARIES := libmtd-utils
LOCAL_C_INCLUDES := $(INCLUDES)
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := flash_unlock.c
LOCAL_MODULE := flash_unlock
LOCAL_SHARED_LIBRARIES := libmtd-utils
LOCAL_C_INCLUDES := $(INCLUDES)
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := flashcp.c
LOCAL_MODULE := flashcp
LOCAL_SHARED_LIBRARIES := libmtd-utils
LOCAL_C_INCLUDES := $(INCLUDES)
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := nanddump.c
LOCAL_MODULE := nanddump
LOCAL_SHARED_LIBRARIES := libmtd-utils
LOCAL_C_INCLUDES := $(INCLUDES)
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := nandwrite.c
LOCAL_MODULE := nandwrite
LOCAL_SHARED_LIBRARIES := libmtd-utils
LOCAL_C_INCLUDES := $(INCLUDES)
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := nandtest.c
LOCAL_MODULE := nandtest
LOCAL_SHARED_LIBRARIES := libmtd-utils
LOCAL_C_INCLUDES := $(INCLUDES)
include $(BUILD_EXECUTABLE)
