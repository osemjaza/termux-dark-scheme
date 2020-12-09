echo "\n\tWelcome! Ready to try out my configs?"
echo "\n\tMake sure to update and upgrade all your packages with apt update && apt upgrade before this installation"
echo
echo "\n\n\tChose your preferred config/s to setup"
echo "\n\t1. .vimrc cofigs"
echo "\n\t2. bashrc config replacement"
echo "\n\t3. copy new vim colors"
echo "\n\t4. .inputrc config"
echo "\n\t5. font config"
echo "\n\t6. colorscheme for the terminal"
echo
echo "\nChose any number of options followed by spaces, for eg; to set up vimrc, bashrc font and colorscheme you would have to type 1 2 s s 5 6. Here 's' stands for skip."
echo
read -p "Enter your number sequence: " vimrc bashr vimcolo inputrc font colorsc

case "$vimrc" in
	"1") echo "\nCopying vimrc setup"
		if [ -e ~/.vimrc ]; then
			echo "\nA vimrc configuration file already exists in your home directory, do you want to replace it with the new one?"
			echo
			read -p "Yes or no [y or n] " virep
			case "$virep" in
				"y") cat vim-setup/vimrc > ~/.vimrc
					if [ $? = 0 ]; then
						echo "\nvimrc placed successfully"
					else
						echo "\nSomething went wrong while placing vimrc..continuing rest of the setup though..."
					fi
					;;
				"n") echo "\nSkipping vimrc setup..."
					;;
				*) echo "\nInvalid key pressed, skipping vimrc setup.."
			esac
		else
			cat vim-setup/vimrc > ~/.vimrc
			if [ $? = 0 ]; then
				echo "\nvimrc placed successfully"
			else
				echo "\nSomething went wrong while placing vimrc..continuing rest of the setup though..."
			fi
		fi
		;;
	"s") echo "\nSkipping vimrc setup"
		;;
	*) echo "\nInvalid key..skipping vimrc setup..continuing rest of the setup..."
		;;
esac

case "$bashr" in
	"2") echo "\nCopying bashrc setup"
		if [ -e $PREFIX/etc/bash.bashrc ]; then
			echo "\nA bashrc configuration file already exists in your home directory, do you want to replace it with the new one?"
			echo
			read -p "Yes or no [y or n] " bshrc
			case "$bshrc" in
				"y") cat bash.bashrc > /$PREFIX/etc/bash.bashrc
					if [ $? = 0 ]; then
						echo "\nbashrc replaced successfully"
					else
						echo "\nSomething went wrong while replacing bashrc..continuing rest of the setup though..."
					fi
					;;
				"n") echo "\nSkipping bashrc setup..."
					;;
				*) echo "\nInvalid key pressed, skipping bashrc setup, continuing rest of the setup though..."
			esac
		else
			cat bash.bashrc > $PREFIX/etc/bash.bashrc
			if [ $? = 0 ]; then
				echo "\nbashrc placed successfully"
			else
				echo "\nSomething went wrong while placing bashrc..continuing rest of the setup though..."
			fi
		fi
		;;
	"s") echo "\nSkipping bashrc setup"
		;;
	*) echo "\nInvalid key..skipping bashrc setup..continuing rest of the setup..."
		;;
esac

which vim

if [ $? = 0 ]; then
	echo "\nVim already installed..copying vim colors..."
else
	echo "\n\tFor vim colors you'll need vim text editor. Do you want to download vim text editor?"
	echo
	read -p "Yes or no [y or n] " vim
	case "$vim" in
		"y") pkg install vim
			;;
		"n") echo "\nskipping vim installation"
			;;
		*) echo "\nInvalid key, skipping vim installation, continuing rest of the installation..."
			;;
	esac
fi

case "$vimcolo" in
	"3") echo "\nCopying vim colors"
		chmod 755 vim-setup/*.vim
		cp vim-setup/*.vim $PREFIX/share/vim/vim*/colors/
		if [ $? = 0 ]; then
			echo "vim colors placed successfully"
		else
			which vim
			if [ $? =0 ]; then
			echo "Something went wrong while placing vim colors..continuing rest of the setup though..."
			else
				echo "Something went wrong while placing vim colors... maybe vim isn't installed yet, try installing vim with pkg install vim"
			fi
		fi
		;;
	"s") echo "\nSkipping vim color setup"
		;;
	*) echo "Invalid key..skipping vim color setup..continuing rest of the setup..."
		;;
esac

case "$inputrc" in
	"4") echo "\nCopying inputrc..."
		if [ -e ~/.inputrc ]; then
			echo "\nA inputrc configuration file already exists in your home directory, do you want to replace it with the new one?"
			echo
			read -p "Yes or no [y or n] " inrep
			case "$inrep" in
				"y") cat termux-setup/inputrc > ~/.inputrc
					if [ $? = 0 ]; then
						echo "\ninputrc placed successfully"
					else
						echo "\nSomething went wrong while placing inputrc..continuing rest of the setup though..."
					fi
					;;
				"n") echo "\nSkipping inputrc setup..."
					;;
				*) echo "\nInvalid key pressed, skipping inputrc setup.."
					;;
			esac
		else
			cat termux-setup/inputrc > ~/.inputrc
			if [ $? = 0 ]; then
				echo "\ninputrc placed successfully"
			else
				echo "\nSomething went wrong while placing inputrc..continuing rest of the setup though..."
			fi
		fi
		;;
	"s") echo "\nSkipping inputrc setup"
		;;
	*) echo "\nInvalid key..skipping inputrc setup..continuing rest of the setup..."
		;;
esac

case "$font" in
	"5") echo "\nCopying hack font..."
		if [ -e ~/.termux/font.ttf ]; then
			echo "\nA font file already exists in your home directory, do you want to replace it with the new one?"
			echo
			read -p "Yes or no [y or n] " fontrep
			case "$fontrep" in
				"y") cat termux-setup/font.ttf > ~/.termux/font.ttf && termux-reload-settings
					if [ $? = 0 ]; then
						echo "\nHack font placed successfully"
					else
						echo "\nSomething went wrong while placing font..continuing rest of the setup though..."
					fi
					;;
				"n") echo "\nSkipping font setup..."
					;;
				*) echo "\nInvalid key pressed, skipping font setup.."
					;;
			esac
		else
			mkdir ~/.termux 2>/dev/null
			cat termux-setup/font.ttf > ~/.termux/font.ttf && termux-reload-settings
			if [ $? = 0 ]; then
				echo "\nfont placed successfully"
			else
				echo "\nSomething went wrong while placing font..continuing rest of the setup though..."
			fi
		fi
		;;
	"s") echo "\nSkipping font setup"
		;;
	*) echo "\nInvalid key..skipping font setup..continuing rest of the setup..."
		;;
esac

case "$colorsc" in
	"6") echo "\nCopying inputrc..."
		if [ -e ~/.termux/colors.properties ]; then
			echo "\nA.termux/colors.properties configuration file already exists in your home directory, do you want to replace it with the new one?"
			echo
			read -p "Yes or no [y or n] " colorep
			case "$colorep" in
				"y") cat termux-setup/colors.properties > ~/.termux/colors.properties && termux-reload-settings
					if [ $? = 0 ]; then
						echo "\.termux/colors.properties placed successfully"
					else
						echo "\nSomething went wrong while placing .termux/colors.properties..continuing rest of the setup though..."
					fi
					;;
				"n") echo "\nSkipping .termux/colors.properties setup..."
					;;
				*) echo "\nInvalid key pressed, skipping .termux/colors.properties setup.."
					;;
			esac
		else
			mkdir ~/.termux 2>/dev/null	
			cat termux-setup/colors.properties > ~/.termux/colors.properties && termux-reload-settings
			if [ $? = 0 ]; then
				echo "\.termux/colors.properties placed successfully"
			else
				echo "\nSomething went wrong while placing .termux/colors.properties..continuing rest of the setup though..."
			fi
		fi
		;;
	"s") echo "\nSkipping .termux/colors.properties setup"
		;;
	*) echo "\nInvalid key..skipping .termux/colors.properties setup..continuing rest of the setup..."
		;;
esac


echo "\n\n\tCongratulations, setup complete. Thank you for trying out my configs. Hopefully you'll end up liking it (: Enjoy!"
