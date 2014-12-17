# the public portion of my dotfiles-managed personal boxen manifest
class people::rick::public {

  notice "loading public"

  git::config::global {
    'user.name':           value => 'Rick Bradley';
    'user.email':          value => 'rick@rickbradley.com';
    'push.default':        value => 'current';
    'color.ui':            value => 'auto';
    'help.autocorrect':    value => '1';
    'merge.conflictstyle': value => 'diff3';

    'alias.st':   value => 'status';
    'alias.ci':   value => 'commit';
    'alias.co':   value => 'checkout';
    'alias.di':   value => 'diff';
    'alias.dc':   value => 'diff --cached';
  }

  include osx::dock::2d
  include osx::dock::autohide
  include osx::finder::empty_trash_securely
  include osx::finder::show_all_on_desktop
  include osx::finder::show_external_hard_drives_on_desktop
  include osx::finder::show_mounted_servers_on_desktop
  include osx::finder::show_removable_media_on_desktop
  include osx::finder::unhide_library
  include osx::global::disable_remote_control_ir_receiver
  include osx::global::enable_keyboard_control_access       # enables the keyboard for navigating controls in dialogs
  include osx::global::expand_print_dialog                  # Show full print options by default
  include osx::global::expand_save_dialog                   # Show finder window when saving file instead of favorites
  include osx::keyboard::capslock_to_control
  include osx::no_network_dsstores
  include osx::software_update

  include atom
  include bash
  include bash::completion
  include brewcask
  include caffeine
  include chrome
  include clojure
  include emacs
  include erlang
  include ffmpeg
  include fitbit
  include flux
  include foreman
  include git
  include go
  include handbrake
  include homebrew
  include hub
  include imagemagick
  include nmap
  include onepassword
  include rdio
  include skype
  include sublime_text_2
  include tmux
  include viscosity
  include vlc
  include wget

  package { 'cheatsheet' : provider => 'brewcask', install_options => "--appdir='/Applications'" }
  package { 'ctags': }
  package { 'html2text': }
  package { 'htop-osx': }
  package { 'id3lib': }
  package { 'id3v2': }
  package { 'mpg123': }
  package { 's3cmd': }
  package { 'sizeup' : provider => 'brewcask', install_options => "--appdir='/Applications'" }
  package { 'xz': }

  # WARNING: there's a known bug with this -- you will have to go through the
  # fuckholed Java `android` installer thing every time this brew gets installed
  # or updated.
  # package { 'android-sdk': }

  # external non-packaged application installs
  package {
    'Skitch':
      provider => 'compressed_app',
      source   => 'http://f.cl.ly/items/0V0L2B0o2X3J380R353E/Skitch-1.0.12.zip';
    'yubiswitch':
      ensure   => installed,
      source   => 'https://github.com/pallotron/yubiswitch/releases/download/v0.3/yubiswitch_0.3.dmg',
      provider => appdmg;
    'Kindle':
      provider => 'appdmg',
      source   => 'http://stuff.rickbradley.com/misc/KindleForMac.dmg';
    'DaisyDisk':
      provider => 'compressed_app',
      source   => 'http://www.daisydiskapp.com/downloads/DaisyDisk.zip';
    'LimeChat':
      provider => 'compressed_app',
      flavor   => 'tbz',
      source   => 'http://downloads.sourceforge.net/project/limechat/limechat/LimeChat_2.42.tbz?r=http%3A%2F%2Flimechat.net%2Fmac%2F&ts=1405300873&use_mirror=superb-dca3';
    'Screenhero':
      provider => 'appdmg',
      source   => 'http://dl.screenhero.com/update/screenhero/Screenhero.dmg';
    'AndroidFileTransfer':
      provider => 'appdmg',
      source   => 'https://dl.google.com/dl/androidjumper/mtp/current/androidfiletransfer.dmg';
  }

  boxen::osx_defaults {
    'viscosity: dont display welcome screen':
      ensure  => 'present',
      domain  => 'com.viscosityvpn.Viscosity',
      key     => 'DisplayWelcome',
      value   => false,
      type    => 'boolean',
      before  => Osx_login_item['Viscosity'],
      require => Class['viscosity'];
    'viscosity: display IP address in menu':
      ensure  => 'present',
      domain  => 'com.viscosityvpn.Viscosity',
      key     => 'DisplayIPInMenu',
      value   => true,
      type    => 'boolean',
      before  => Osx_login_item['Viscosity'],
      require => Class['viscosity'];
    'viscosity: put the menu bar icon on the right':
      ensure  => 'present',
      domain  => 'com.viscosityvpn.Viscosity',
      key     => 'MenuOnRight',
      value   => true,
      type    => 'boolean',
      before  => Osx_login_item['Viscosity'],
      require => Class['viscosity'];
    'viscosity: enable automatic updates':
      ensure  => 'present',
      domain  => 'com.viscosityvpn.Viscosity',
      key     => 'SUEnableAutomaticChecks',
      value   => true,
      type    => 'boolean',
      before  => Osx_login_item['Viscosity'],
      require => Class['viscosity'];
  }

  exec { 'launch viscosity':
    command     => '/usr/bin/killall Viscosity; /usr/bin/open /Applications/Viscosity.app',
    refreshonly => true,
    subscribe   => Package['Viscosity'],
    require     => Osx_login_item['Viscosity'],
  }

  osx_login_item { 'Viscosity':
    path    => '/Applications/Viscosity.app',
    notify  => Exec['launch viscosity'],
  }

  boxen::osx_defaults {
    'caffeine: disable startup message':
      ensure     => present,
      domain     => 'com.lightheadsw.Caffeine',
      key        => 'SuppressLaunchMessage',
      value      => '1',
      type       => 'integer';
    'caffeine: deactivate on launch':
      ensure     => present,
      domain     => 'com.lightheadsw.Caffeine',
      key        => 'ActivateOnLaunch',
      value      => '0',
      type       => 'integer';
  }

  exec { 'launch caffeine':
    command     => '/usr/bin/killall Caffeine; /usr/bin/open /Applications/Caffeine.app',
    refreshonly => true,
    subscribe   => Package['Caffeine'],
    require     => Osx_login_item['Caffeine'],
  }

  osx_login_item { 'Caffeine':
    path    => '/Applications/Caffeine.app',
    require => [
      Package['Caffeine'],
      Boxen::Osx_defaults['caffeine: disable startup message'],
      Boxen::Osx_defaults['caffeine: deactivate on launch'],
    ],
    notify  => Exec['launch caffeine'],
  }

  # Terminal

#  boxen::osx_defaults {
#    'Enable default terminal theme':
#      domain  => 'com.apple.Terminal',
#      key     => '"Default Window Settings"',
#      value   => 'lstoll',
#      require => Exec['install terminal theme'];
#    'Enable startup terminal theme':
#      domain  => 'com.apple.Terminal',
#      key     => '"Startup Window Settings"',
#      value   => 'lstoll',
#      require => Exec['install terminal theme'];
#  }

  class { 'boxen::security': screensaver_delay_sec => 0 }

  boxen::osx_defaults { 'Disable Dashboard':
    key    => 'mcx-disabled',
    domain => 'com.apple.dashboard',
    value  => 'YES',
  }

  boxen::osx_defaults { 'Display full POSIX path as Finder Window':
    key    => '_FXShowPosixPathInTitle',
    domain => 'com.apple.finder',
    value  => 'true',
  }

  boxen::osx_defaults { 'fucking sane key repeat':
    domain => 'NSGlobalDomain',
    key    => 'KeyRepeat',
    value  => '0',
  }

  boxen::osx_defaults { 'Disable "natural scrolling"':
    key    => 'com.apple.swipescrolldirection',
    domain => 'NSGlobalDomain',
    value  => '0',
  }

  boxen::osx_defaults { 'Always use current directory in default search':
    key    => 'FXDefaultSearchScope',
    domain => 'com.apple.finder',
    value  => 'SCcf',
  }

  boxen::osx_defaults { 'Put my Dock on the left':
    key    => 'orientation',
    domain => 'com.apple.dock',
    value  => 'left',
  }
}
