include theos/makefiles/common.mk

TWEAK_NAME = tweakMLY
tweakMLY_FILES = Tweak.xm
tweakMLY_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 com.jjdd.meiliyue"
