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
  # Enable 2 horizontal workspaces
  gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ hsize 2
  # and 3 vertical workspaces
  gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ vsize 3
  # Disable Shoppings suggestions on HUD
  gsettings set com.canonical.Unity.Lenses disabled-scopes "['more_suggestions-amazon.scope', 'more_suggestions-u1ms.scope', 'more_suggestions-populartracks.scope', 'music-musicstore.scope', 'more_suggestions-ebay.scope', 'more_suggestions-ubuntushop.scope', 'more_suggestions-skimlinks.scope']"
  # Show user name on right corner
  gsettings set com.canonical.indicator.session show-real-name-on-panel true
  # Datetime tweaks
  gsettings set com.canonical.indicator.datetime show-date true
  gsettings set com.canonical.indicator.datetime show-day true
  gsettings set com.canonical.indicator.datetime show-locations true
  # Set my default wallpaper FIXME improve
  cd /home/miguelgraz/Desktop ; wget https://www.dropbox.com/sh/i1soo9vhd2qdjzo/AAABuKn4w5IcW38jHJn95Y--a/LotR.jpg ;
  gsettings set org.gnome.desktop.background picture-uri "file:///home/miguelgraz/Desktop/LotR.jpg" ;
  # Install Ubuntu Tweak for custom future tweaks
  sudo add-apt-repository -y ppa:tualatrix/ppa ; sudo apt-get update ; sudo apt-get -y install ubuntu-tweak ;
  # Install Compiz Settings Manager and allow alt+tab to work in all workspaces
  sudo apt-get -y install compizconfig-settings-manager
  dconf write /org/compiz/profiles/unity/plugins/unityshell/alt-tab-bias-viewport false

# Terminal tweaks
  # Font
  gconftool-2 --set /apps/gnome-terminal/profiles/Default/font --type string "Ubuntu Mono 12"
  # Transparent background
  gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/background_type transparent
  # Custom darkness
  gconftool-2 --type float --set /apps/gnome-terminal/profiles/Default/background_darkness 0.62875499999999995
  # Unlimited scrolling
  gconftool-2 --type boolean --set /apps/gnome-terminal/profiles/Default/scrollback_unlimited true

# Install general apps
  # Chrome
  wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
  sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
  sudo apt-get update; sudo apt-get -y install google-chrome-stable;
  # Sublime Text 3
  sudo add-apt-repository -y ppa:webupd8team/sublime-text-3 ; sudo apt-get update; sudo apt-get -y install sublime-text-installer ;
  # Skype
  sudo sh -c "echo 'deb http://archive.canonical.com/ trusty partner' >> /etc/apt/sources.list.d/canonical_partner.list" ; sudo apt-get update ; sudo apt-get -y install skype ;
  # Java needs
  sudo apt-get -y install icedtea-7-plugin openjdk-7-jre icedtea-plugin
  # Flash plugin
  sudo apt-get -y install pepperflashplugin-nonfree
  # Popcorn Time
  sudo add-apt-repository -y ppa:webupd8team/popcorntime ; sudo apt-get update; sudo apt-get -y install popcorn-time ;
  # Other basic apps
  sudo apt-get -y install aptitude curl git-core gitg mpg123 moc moc-ffmpeg-plugin vlc rar htop virtualbox whois
  # Set custom shortcuts
    # Chrome
    gsettings set org.compiz.integrated run-command-1 "['<Control><Alt>C']"
    gsettings set org.compiz.integrated command-1 "google-chrome"
    # Sublime Text
    gsettings set org.compiz.integrated run-command-2 "['<Control><Alt>S']"
    gsettings set org.compiz.integrated command-2 "subl"
    # Multimedia keyboard shortcuts configs to control MOC through bluetooth headphones \m/ d(-_-)b \m/
      # Activate them all
      gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/']"
      # Play
      gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name "MOC Play"
      gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command "mocp --toggle-pause"
      gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding "AudioForward"
      # Pause
      gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ name "MOC Pause"
      gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ command "mocp --toggle-pause"
      gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ binding "AudioPause"
      # Next song
      gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ name "MOC Next Song"
      gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ command "mocp --next"
      gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ binding "AudioNext"
      # Previous song
      gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/ name "MOC Previous Song"
      gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/ command "mocp --previous"
      gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/ binding "AudioPrev"
  # Grab custom config files
    cd /home/miguelgraz ;
    # .bashrc
    rm -f .bashrc ; wget https://raw.githubusercontent.com/miguelgraz/dotfiles/master/.bashrc ;
    source /home/miguelgraz/.bashrc
    # .gitconfig
    rm -f .gitconfig ; wget https://raw.githubusercontent.com/miguelgraz/dotfiles/master/.gitconfig ;
    # AutoStartMOC
    mkdir /home/miguelgraz/.config/autostart ;
    wget https://raw.githubusercontent.com/miguelgraz/dotfiles/master/moc.desktop ;
    mv /home/miguelgraz/moc.desktop /home/miguelgraz/.config/autostart/ ;
    # MOC config
    wget https://raw.githubusercontent.com/miguelgraz/dotfiles/master/moc.config ;
    rm -f /home/miguelgraz/.moc/config ;
    mv /home/miguelgraz/moc.config /home/miguelgraz/.moc/config ;

# Development environment!
  # Default folder
  mkdir /home/miguelgraz/Dev ;
  # Basic toolbelt
  sudo apt-get -y install build-essential nodejs libxslt-dev libxml2-dev imagemagick libmagickwand-dev npm phantomjs libmysqlclient-dev libmysqlclient18 ruby-dev libqt4-dev
  # Heroku toolbelt
  wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh
  # Databases
    # Sqlite (yep)
    sudo apt-get -y install sqlite3 libsqlite3-dev
    # MySQL
    sudo apt-get -y install mysql-server libmysqlclient-dev mysql-client libmysql-ruby libdbd-mysql
    # Redis
    sudo apt-get -y install redis-server
    # Postgres
    sudo apt-get -y install uuid postgresql postgresql-contrib libpq-dev pgadmin3 ;
    # FIXME not sure if needed
    # sudo -u postgres psql template1 ;
    # FIXME setup postgres' password automatically
    # \password postgres
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
    gem install debugger-ruby_core_source
    gem install rspec
  # Customize Sublime Text and add some packages FIXME improve
  cd /home/miguelgraz/Desktop ; wget https://raw.githubusercontent.com/miguelgraz/dotfiles/master/install_ST_plugins.sh ; chmod +x install_ST_plugins.sh ; . install_ST_plugins.sh ; rm -f install_ST_plugins.sh ;

# Last touches and/or things that need interation
  # Create shortcuts to music folders inside the ~/Music folder
  for d in /home/miguelgraz/Dropbox/Music/*/ ; do
    sudo ln -s "$d" /home/miguelgraz/Music ;
  done
  # Remove no longer required packages
  sudo apt-get -y autoremove
