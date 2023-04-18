#!/usr/bin/env zsh

# set current dir either manually or by picking the parent of the script
WD=~/Sync

# install yay
if ! [[ $(pacman -Qi yay) ]]; then
  $WD/bin/install_yay.sh
fi

# install all appriopriate packages
for f in $(cat $WD/package.list); do
  yay -S --needed "$f" --noconfirm
done

#yay -S libglade --noconfirm --answerclean All --answerdiff None
#yay -U --needed $WD/wbar-* --answerclean All --answerdiff None
#yay -S wbar-bin --noconfirm --answerclean All --answerdiff None
#rm ~/.wbar
#ln -s $WD/wbar ~/.wbar


## symlink various files from Sync/
## move all files to a list outside of this
## put into a for loop
#for f in find $WD/linked/* -exec 
#  rm $f
#  ln -s $f ~/

rm ~/.xinitrc
ln -s $WD/xinitrc ~/.xinitrc

if grep -q zsh $WD/package.list; then
  rm ~/.zshrc
  ln -s $WD/zshrc ~/.zshrc
fi

if grep -q vim $WD/package.list; then
  rm ~/.vimrc
  ln -s $WD/vimrc ~/.vimrc
fi

if grep -q tint2 $WD/package.list; then
  rm -r ~/.config/tint2
  ln -s $WD/tint2 ~/.config/
fi

if grep -q nitrogen $WD/package.list; then
  rm -r ~/.config/nitrogen
  ln -s $WD/nitrogen ~/.config/
  DISPLAY=:0.0 nitrogen --restore
fi

if grep -q terminator $WD/package.list; then
  rm -r ~/.config/terminator
  ln -s $WD/terminator ~/.config/
fi

if grep -q openbox $WD/package.list; then
  rm -r ~/.config/openbox
  ln -s $WD/openbox ~/.config/
  DISPLAY=:0.0 openbox --reconfigure
fi

if grep -q openssh $WD/package.list; then
  rm ~/.ssh/config
  ln -s $WD/sshconfig ~/.ssh/config
  sudo systemctl restart sshd
fi

## icons?
#
## set bin folder.  right now ~/bin, but should PATH just be updated?
## it is in .zshrc right now
