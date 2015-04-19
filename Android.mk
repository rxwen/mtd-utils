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

MTD_SRC := lib/libcrc32.c \
      lib/libfec.c \
      lib/libmtd.c \
      lib/libmtd_legacy.c
UBIFS_SRC := ubi-utils/dictionary.c \
      ubi-utils/libiniparser.c \
      ubi-utils/libscan.c \
      ubi-utils/libubi.c \
      ubi-utils/libubigen.c \
      ubi-utils/ubiutils-common.c

include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(UBIFS_SRC) \
	$(MTD_SRC) \
	ubi-utils/ubiformat.c 
LOCAL_MODULE := ubiformat
LOCAL_CFLAGS += -D_GNU_SOURCE
LOCAL_C_INCLUDES := $(LOCAL_PATH)/include \
	$(LOCAL_PATH)/ubi-utils/include/
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(UBIFS_SRC) \
	$(MTD_SRC) \
	ubi-utils/mtdinfo.c
LOCAL_MODULE := mtdinfo
LOCAL_CFLAGS += -D_GNU_SOURCE
LOCAL_C_INCLUDES := $(LOCAL_PATH)/include \
	$(LOCAL_PATH)/ubi-utils/include/
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(UBIFS_SRC) \
	$(MTD_SRC) \
	ubi-utils/ubiattach.c
LOCAL_MODULE := ubiattach
LOCAL_CFLAGS += -D_GNU_SOURCE
LOCAL_C_INCLUDES := $(LOCAL_PATH)/include \
	$(LOCAL_PATH)/ubi-utils/include/
include $(BUILD_EXECUTABLE)
