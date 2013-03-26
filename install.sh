#!/usr/bin/env sh

REPOSITORY_NAME='AF83/dotfiles'
REPOSITORY_URL="https://github.com/${REPOSITORY_NAME}"

# Get file listing by http and ugly grep and sed
# Maybe if this install fail on the future you may look at this line
FILES=`curl -s $REPOSITORY_URL | grep js-directory-link | sed "s/.* title=\"\(.*\)\".*/\1/"`

update_dotfile() {
	FILE=$1
	echo "Get latest version for $FILE from ${REPOSITORY_NAME}."
	wget -c "https://raw.github.com/${REPOSITORY_NAME}/master/$FILE" -O ~/$FILE
}

for f in $FILES; do
	first_car=`echo $f | awk '{print substr($0,0,2)}'`
	if [ "$first_car" = "." ]; then
		if [ -f ~/$f ]; then
			read -p "~/$f exist update it ? (y/n) : " update
			if [ "$update" = "y" ]; then
				update_dotfile $f
			else
				echo "Ok. Dont do nothing."
			fi
		else
			update_dotfile $f
		fi
	fi
done
