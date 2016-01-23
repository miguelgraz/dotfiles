cd ~/Desktop ; git clone git@github.com:miguelgraz/dotfiles.git ;
cp dotfiles/TwilightBold.tmTheme ~/.config/sublime-text-3/Packages
cp dotfiles/Railscasts\ Modified.tmTheme ~/.config/sublime-text-3/Packages
cp -r dotfiles/User ~/.config/sublime-text-3/Packages/
rm -rf dotfiles ;

cd ~/.config/sublime-text-3/Packages/

git clone git@github.com:equinusocio/material-theme.git Material\ Theme
git clone git://github.com/matthewrobertson/ERB-Sublime-Snippets.git ERB_Snippets
git clone git@github.com:miguelgraz/FocusFileOnSidebar.git
git clone git@github.com:FMCorz/MoveTab.git
git clone git@github.com:ehamiter/ST2-GitHubinator.git
