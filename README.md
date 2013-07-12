sublimetext-installer
=====================

Installs SublimeText on Ubuntu, with Unity integration.

Inspired by http://www.technoreply.com/how-to-install-sublime-text-2-on-ubuntu-12-04-unity/


Usage, Features
---------------

Run this in the shell:

    wget https://github.com/khink/sublimetext-installer/raw/master/sublime-install.sh
    . sublime-install.sh

Now you should be able to run ``sublime_text`` from anywhere, including the Unity dash.

SublimeText replaces Gedit as the default editor.


More options
------------

After downloading the script, you can change the variables:
- DOWNLOAD_DIR
- TARGET_DIRECTORY (where the tarball is unpackes)
- BINARY_DIRECTORY (where the symlink is created)
- SYMLINK_NAME (what you use to run SublimeText)


SublimeText Versions
--------------------

This script targets SublimeText 2, for which no easier install method is available.
It should also work on the tarball for SublimeText 3, but i'd use the ``.deb`` for that.

Default text editor on SublimeText 3
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

If the `.deb` for SublimeText 3 doesn't update the default editor, 
you can run:

	make replace-default-editor

