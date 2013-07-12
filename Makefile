DESKTOP_LINK_NAME := sublime_text
DEFAULT_APPLICATIONS := /usr/share/applications/defaults.list
OLD_TEXT_EDITOR := gedit

replace-default-editor:
	sudo sed -i.bak s/$(OLD_TEXT_EDITOR)/$(DESKTOP_LINK_NAME)/g $(DEFAULT_APPLICATIONS)