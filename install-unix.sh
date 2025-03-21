mkdir -p $HOME/.scripts-local/
mkdir -p $HOME/.config/

for i in .ideavimrc .clangd .scripts .hammerspoon .gitconfig .vimrc .zshrc .tmux.conf .gitrc .emacs; do
    rm -rf $HOME/$i
    ln -s $HOME/.dotfiles/.home/$i $HOME/$i
done

for i in nvim btop alacritty; do
    rm -rf $HOME/.config/$i
    ln -s $HOME/.dotfiles/.home/.config/$i $HOME/.config/$i
done
