printf "Perfection is achieved when it's not just easy it's smart\n"
printf "[starting easy setup]\n"

printf "step #1 [system update]\n"
sudo apt-get update
printf "system update complete\n"

printf "step #2 [install curl]\n"
sudo apt-get install curl
printf "curl installed successfully\n"

printf "step #3 [install unity-tweak-tool]\n"
sudo apt-get install gnome-tweak-tool
printf "Unity-tweak-tool installed successfully\n"

printf "step #5 [install git]"
sudo add-apt-repository ppa:git-core/ppa
sudo apt-get update
sudo apt-get install git
printf "git installed successfully\n"

printf "step #7 [install java]\n"
sudo apt-get update
sudo apt-get install default-jre
sudo apt-get install default-jdk
printf "java installed successfully"

printf "step # [install vim and set up]"
sudo apt install vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
curl https://raw.githubusercontent.com/nilasrum/ubuntu-setup/master/vimrc > ~/.vimrc

printf "step #9 [install vs code]\n"
sudo apt updatesudo apt install software-properties-common apt-transport-https wget
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt install code
printf "vs code installed successfully\n"

printf "step #10 [install themes] :P\n"
sudo add-apt-repository ppa:noobslab/themes
sudo apt-get update
sudo add-apt-repository ppa:oranchelo/oranchelo-icon-theme
sudo apt-get update
sudo add-apt-repository ppa:snwh/pulp
sudo apt-get update
sudo apt-get install canta-themes
sudo apt-get install oranchelo-icon-theme
