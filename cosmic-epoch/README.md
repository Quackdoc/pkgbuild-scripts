None of these have been chroot tested, Any issues will be atempted to be resolved however. 

Currently reccomended install method is with paru

1. Add repo as a paru source

```
~/.config/paru/paru.conf
-------------------------------------

[quackpkg]
Url = https://github.com/Quackdoc/pkgbuild-scripts.git
Depth = 4
```

2. Install packages

```
paru -S --rebuild cosmic-applibrary-git cosmic-bg-git cosmic-comp-git cosmic-edit-git cosmic-files-git cosmic-greeter-git cosmic-icons-git cosmic-launcher-git cosmic-notifications-git cosmic-osd-git cosmic-panel-git cosmic-randr-git cosmic-screenshot-git cosmic-session-git cosmic-settings-daemon-git cosmic-settings-git cosmic-store-git cosmic-term-git cosmic-workspaces-epoch-git xdg-desktop-portal-cosmic-git
```
