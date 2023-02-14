# Copyright (C) 2018 The LineageOS Project
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

ifeq ($(TARGET_DEVICE),gracelte)

include $(CLEAR_VARS)

LIFEVIBES_LIBS := libLifevibes_lvverx.so libLifevibes_lvvetx.so

LIFEVIBES_SYMLINKS := $(addprefix $(TARGET_OUT_VENDOR)/lib/,$(notdir $(LIFEVIBES_LIBS)))
$(LIFEVIBES_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "LifeVibes lib link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /vendor/lib/soundfx/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(LIFEVIBES_SYMLINKS)

endif
