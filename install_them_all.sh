# Be root always
sudo su

# Dropbox, to start downloading early
sudo apt-get -y install libappindicator1 nautilus-dropbox

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
  gsettings set com.canonical.indicator.datetime locations "['Stockholm']"
  gsettings set com.canonical.indicator.datetime show-locations true
  # Set my default wallpaper FIXME improve
  cd /home/miguelgraz/Desktop ; wget https://www.dropbox.com/sh/i1soo9vhd2qdjzo/AAABuKn4w5IcW38jHJn95Y--a/LotR.jpg ;
  gsettings set org.gnome.desktop.background picture-uri file:///home/miguelgraz/Desktop/LotR.jpg ;
  gsettings set com.canonical.unity-greeter background '/home/miguelgraz/Desktop/LotR.jpg' ;
  rm -f LotR.jpg ;
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
  # Chromium
  sudo apt-get -y install chromium-browser
  # Sublime Text 3
  sudo add-apt-repository -y ppa:webupd8team/sublime-text-3 ; sudo apt-get update; sudo apt-get -y install sublime-text-installer ;
  # Skype
  sudo sh -c "echo 'deb http://archive.canonical.com/ trusty partner' >> /etc/apt/sources.list.d/canonical_partner.list" ; sudo apt-get update ; sudo apt-get -y install skype ;
  # Java needs
  sudo apt-get -y install icedtea-7-plugin openjdk-7-jre icedtea-plugin
  # Flash plugin
  sudo apt-get -y install pepperflashplugin-nonfree
  # Other basic apps
  sudo apt-get -y install aptitude mpg123 vlc rar htop virtualbox
  # Set custom shortcuts FIXME it seems to lose these shortcuts after a reboot
    # Chromium
    gsettings set org.compiz.integrated run-command-1 "['<Control><Alt>C']"
    # /apps/compiz-1/plugins/commands/screen0/options/command1
    gsettings set org.compiz.integrated command-1 "chromium-browser"
    # Sublime Text
    gsettings set org.compiz.integrated run-command-2 "['<Control><Alt>S']"
    gsettings set org.compiz.integrated command-2 "subl"

# Development environment!
  # Default folder
  mkdir /home/miguelgraz/Dev ;
  # Basic toolbelt
  sudo apt-get -y install curl git-core gitg build-essential nodejs libxslt-dev libxml2-dev imagemagick libmagickwand-dev npm phantomjs
  # Grab my custom .bashrc and .gitconfig (FIXME improve)
  cd /home/miguelgraz ;
  rm -f .bashrc ; wget https://raw.githubusercontent.com/miguelgraz/dotfiles/master/.bashrc ;
  rm -f .gitconfig ; wget https://raw.githubusercontent.com/miguelgraz/dotfiles/master/.gitconfig ;
  source /home/miguelgraz/.bashrc
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
    sudo apt-get -y install postgresql libpq-dev pgadmin3 ; sudo -u postgres psql template1 ; 
    # FIXME setup postgres' password automatically
    # \password postgres
    # FIXME not sure if needed
    sudo update-rc.d postgresql enable
  # Ruby
    # RVM
    \curl -sSL https://get.rvm.io | bash -s stable --ruby
    source /home/miguelgraz/.rvm/scripts/rvm
    rvm autolibs enable
    # Install some rubies
    rvm install 1.9.3
    rvm install 2.0.0
    # Some needed gems
    gem install rdoc
    gem install nokogiri
    gem install debugger-ruby_core_source
    gem install rspec
  # Customize Sublime Text and add some packages FIXME improve
  cd /home/miguelgraz/Desktop ; wget https://raw.githubusercontent.com/miguelgraz/dotfiles/master/install_ST_plugins.sh ; chmod +x install_ST_plugins.sh ; . install_ST_plugins.sh ; rm -f install_ST_plugins.sh ;

# Last touches
  # Create shortcuts to music folders inside the ~/Music folder
  for d in /home/miguelgraz/Dropbox/Music/*/ ; do
    sudo ln -s "$d" /home/miguelgraz/Music ;
  done
  # Pipelight to watch Netflix, needs interation FIXME install https://addons.mozilla.org/en-US/firefox/addon/user-agent-overrider/?src=ss to Firefox
  sudo add-apt-repository -y ppa:pipelight/stable ; sudo apt-get update ; sudo apt-get -y install --install-recommends pipelight-multi ; sudo pipelight-plugin -y --update ; sudo pipelight-plugin -y --enable silverlight ;
  # Create ssh keys
  ssh-keygen -t rsa -C "miguelgraz@gmail.com"
