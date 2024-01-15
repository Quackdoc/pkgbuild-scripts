# Simple Conf

# Bcachefs config options
export CONFIG_BCACHEFS_FS := m
export CONFIG_BCACHEFS_QUOTA := y
#export CONFIG_BCACHEFS_ERASURE_CODING is not set
export CONFIG_BCACHEFS_POSIX_ACL := y
export CONFIG_BCACHEFS_DEBUG_TRANSACTIONS := y
#export CONFIG_BCACHEFS_DEBUG is not set
#export CONFIG_BCACHEFS_TESTS is not set
export CONFIG_BCACHEFS_LOCK_TIME_STATS := y
#export CONFIG_BCACHEFS_NO_LATENCY_ACCT is not set

SRC_DIRS := fs/bcachefs

modules: $(SRC_DIRS)

$(SRC_DIRS):
	$(MAKE) -C /lib/modules/$(V)/build M="$(M)"

.PHONY: $(SRC_DIRS) modules

clean:
	$(MAKE) -C /lib/modules/$(V)/build M=$$PWD clean
