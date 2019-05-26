printf "Perfection is achieved when it's not just easy it's smart\n"
printf "[starting easy setup]\n"

printf "step #1 [system update]\n"
sudo apt-get update
printf "system update complete\n"

printf "step #2 [install curl]\n"
sudo apt-get install curl
printf "curl installed successfully\n"

printf "step #3 [install unity-tweak-tool]\n"
sudo apt-get install unity-tweak-tool
printf "Unity-tweak-tool installed successfully\n"

printf "step #4 [install synaptic-package-manager]\n"
sudo apt-get install synaptic
printf "synaptic-package-manager installed successfully\n"

printf "step #5 [install git]"
sudo add-apt-repository ppa:git-core/ppa
sudo apt-get update
sudo apt-get install git
printf "git installed successfully\n"

printf "step #6 [install codeblocks]\n"
sudo add-apt-repository ppa:damien-moore/codeblocks-stable
sudo apt update
sudo apt install codeblocks
printf "codeblocks installed successfully\n"

printf "step #7 [install java]\n"
sudo apt-get update
sudo apt-get install default-jre
sudo apt-get install default-jdk
printf "java installed successfully"

# printf "step #8 [install dropbox]\n"
# cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
# ~/.dropbox-dist/dropboxd
# printf "dropbox installed successfully\n"

printf "step #9 [install vs code]\n"
sudo apt updatesudo apt install software-properties-common apt-transport-https wget
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt install code
printf "vs code installed successfully\n"

printf "step #10 [install themes] :P\n"
sudo add-apt-repository ppa:noobslab/themes
sudo apt-get update
sudo apt-get install flatabulous-theme
sudo add-apt-repository ppa:snwh/pulp
sudo apt-get update
sudo apt-get install paper-gtk-theme
sudo apt-get install paper-icon-theme
sudo apt-get install paper-cursor-theme

