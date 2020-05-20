#! /bin/bash

#copies cowsay files to root to allow it to work there
sudo ln -s /usr/games/cowsay /usr/bin/cowsay
sudo ln -s /usr/games/cowthink /usr/bin/cowthink
sudo ln -s /usr/games/xcowsay /usr/bin/xcowsay

echo 0