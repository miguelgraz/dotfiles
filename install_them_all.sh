# TODO: Adapt to handle Gnome 3 instead of Unity now
# - Install gnome-tweaks
# - Find a way to automatically configure gnome tweaks
# - Install some extensions (dash to dock, sound input & output device chooser, workspace grid, panel OSD, Bluetooth quick connect)
# - Find a way to configure these extensions programmatically
# - Set the correct number of workspaces
# - Fix spotify installation
# - Install spotify-now 
#   cd /usr/bin
#   sudo wget https://raw.githubusercontent.com/getmicah/spotify-now/master/spotify-now
#   sudo chmod +x spotify-now
# - Install https://github.com/miguelgraz/dotfiles/blob/master/notify_script.sh
# - Fix creation of custom keyboard shortcuts 
# - Create custom keyboard shortcut to notify_script (ctrl + alt + i)
# - Configure "mouse & touchpad" programmatically
# - Add mysql
# - Replace RVM with rbenv
# - Remove the default "beep" from gnome-terminal
# - Install elasticsearch and set it to start as a service on startup `sudo systemctl enable elasticsearch.service`

# Start with things that need interation
  # Dropbox, to start downloading early
  sudo apt-get -y install libappindicator1 nautilus-dropbox
  dropbox start
  # Create ssh keys
  ssh-keygen -t rsa -C "miguelgraz@gmail.com"
  echo "Don't forget to add this key to github on https://github.com/settings/ssh"
  echo "or Sublime Text won't be customized"
  cat /home/miguelgraz/.ssh/id_rsa.pub

# Remove useless apps/packages
sudo apt-get -y remove rhythmbox
# Initial upgrade
sudo apt-get update ; sudo apt-get -y upgrade ; sudo apt-get -y dist-upgrade ;

# Desktop tweaks
  # Best shortcuts ever to increase/decrease volume
  gsettings set org.gnome.settings-daemon.plugins.media-keys volume-up "<Ctrl><Shift>Up"
  gsettings set org.gnome.settings-daemon.plugins.media-keys volume-down "<Ctrl><Shift>Down"
  # Disable Shoppings suggestions on HUD
  gsettings set com.canonical.Unity.Lenses disabled-scopes "['more_suggestions-amazon.scope', 'more_suggestions-u1ms.scope', 'more_suggestions-populartracks.scope', 'music-musicstore.scope', 'more_suggestions-ebay.scope', 'more_suggestions-ubuntushop.scope', 'more_suggestions-skimlinks.scope']"
  # Show user name on right corner
  gsettings set com.canonical.indicator.session show-real-name-on-panel true
  # Datetime tweaks
  gsettings set com.canonical.indicator.datetime show-date true
  gsettings set com.canonical.indicator.datetime show-day true
  gsettings set com.canonical.indicator.datetime show-locations true
  # Supress confirmation dialog when restarting/shutting down
  gsettings set com.canonical.indicator.session suppress-logout-restart-shutdown true
  # Shutdown the computer without dialog when using the power button
  gsettings set org.gnome.settings-daemon.plugins.power button-power shutdown
  # Do not change zoom of PDF docs when using its index
  gsettings set org.gnome.Evince allow-links-change-zoom false

# Terminal tweaks
  # Font
  gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$(gsettings get org.gnome.Terminal.ProfilesList default|tr -d \')/ use-system-font false
  gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$(gsettings get org.gnome.Terminal.ProfilesList default|tr -d \')/ font "Ubuntu Mono 12"
  # Scrollback
  gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$(gsettings get org.gnome.Terminal.ProfilesList default|tr -d \')/ scrollback-unlimited true
  # Colors
  gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$(gsettings get org.gnome.Terminal.ProfilesList default|tr -d \')/ bold-color-same-as-fg false
  gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$(gsettings get org.gnome.Terminal.ProfilesList default|tr -d \')/ use-theme-colors true
  # Transparent background
  gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$(gsettings get org.gnome.Terminal.ProfilesList default|tr -d \')/ use-theme-transparency false
  gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$(gsettings get org.gnome.Terminal.ProfilesList default|tr -d \')/ use-transparent-background true
  gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$(gsettings get org.gnome.Terminal.ProfilesList default|tr -d \')/ background-transparency-percent 27

# Install general apps
  # Chrome
  wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
  sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
  sudo apt-get update; sudo apt-get -y install google-chrome-stable;
  # Firefox
  sudo apt-get update; sudo apt-get -y install firefox;
  # Sublime Text 3
  wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
  echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
  sudo apt-get update; sudo apt-get -y install sublime-text;
  # Spotify
  sudo apt-get -y install spotify-client
  # Skype
  sudo sh -c "echo 'deb http://archive.canonical.com/ trusty partner' >> /etc/apt/sources.list.d/canonical_partner.list" ; sudo apt-get update ; sudo apt-get -y install skype ;
  # Java needs
  sudo apt-get -y install icedtea-7-plugin openjdk-7-jre icedtea-plugin
  # Flash plugin
  sudo apt-get -y install pepperflashplugin-nonfree
  # Other basic apps
  sudo apt-get -y install aptitude curl git-core vlc rar htop virtualbox whois steam
  # Set custom shortcuts
    # Firefox
    gsettings set org.compiz.integrated run-command-1 "['<Control><Alt>C']"
    gsettings set org.compiz.integrated command-1 "firefox"
    # Sublime Text
    gsettings set org.compiz.integrated run-command-2 "['<Control><Alt>S']"
    gsettings set org.compiz.integrated command-2 "subl"
    # Spotify    
    gsettings set org.compiz.integrated run-command-3 "['<Control><Alt>P']"
    gsettings set org.compiz.integrated command-3 "spotify"
    # Re-configure global media keys
      # Keyboard Pause/Unpause
      gsettings set org.gnome.settings-daemon.plugins.media-keys play "<Primary><Alt>space"
      # Keyboard Next song
      gsettings set org.gnome.settings-daemon.plugins.media-keys next "<Primary><Alt>n"
      # Keyboard Previous song
      gsettings set org.gnome.settings-daemon.plugins.media-keys previous "<Primary><Alt>b"
  # Grab custom config files
    cd /home/miguelgraz ;
    # .bashrc
    rm -f .bashrc ; wget https://raw.githubusercontent.com/miguelgraz/dotfiles/master/.bashrc ;
    source /home/miguelgraz/.bashrc
    # .gitconfig
    rm -f .gitconfig ; wget https://raw.githubusercontent.com/miguelgraz/dotfiles/master/.gitconfig ;

# Development environment!
  # Default folder
  mkdir /home/miguelgraz/Dev ;
  # Basic toolbelt
  sudo apt-get -y install build-essential nodejs libxslt-dev libxml2-dev imagemagick libmagickwand-dev npm phantomjs libqt4-dev
  # Heroku toolbelt
  wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh
  # Databases
    # Sqlite (yep)
    sudo apt-get -y install sqlite3 libsqlite3-dev
    # Redis
    sudo apt-get -y install redis-server
    # Postgres
    sudo apt-get -y install uuid postgresql postgresql-contrib libpq-dev pgadmin3 ;
    # FIXME not sure if needed
    sudo update-rc.d postgresql enable
  # Ruby
    # RVM
    gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
    curl -sSL https://get.rvm.io | bash -s stable --ruby
    source /home/miguelgraz/.rvm/scripts/rvm
    rvm autolibs enable
    # Install some rubies
    rvm install 2.0.0
    # Some needed gems
    gem install rdoc
    gem install nokogiri
    gem install rspec
  # Customize Sublime Text and add some packages FIXME improve
  cd /home/miguelgraz/Desktop ; wget https://raw.githubusercontent.com/miguelgraz/dotfiles/master/install_ST_plugins.sh ; chmod +x install_ST_plugins.sh ; . install_ST_plugins.sh ; rm -f install_ST_plugins.sh ;

# Last touches and/or things that need interation
  # Set my default wallpaper
  gsettings set org.gnome.desktop.background picture-uri "file:///home/miguelgraz/Dropbox/Documents/Besteiras/wallpapers/LotR.jpg" ;
  # Remove no longer required packages
  sudo apt-get -y autoremove
