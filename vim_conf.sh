#! /bin/bash


if [ ! -d ~/.vim ]
then
    mkdir ~/.vim
	if [ ! -d ~/.vim ]
	then
		echo "Failed to create path ~/.vim"
		exit 1
	fi
    mkdir ~/.vim/tags
	if [ ! -d ~/.vim/tags ]
	then
		echo "Failed to create path ~/.vim/tags"
		exit 1
	fi
elif [ ! -d ~/.vim/tags ]
then
    mkdir ~/.vim/tags
fi

if [ ! -d ~/.vim/syntax ]
then
mkdir ~/.vim/syntax
fi

if [ ! -d ~/.vim/lib ]
then
mkdir ~/.vim/lib
fi

if [ ! -d ~/.vim/lib/nerdtree ]
then
mkdir ~/.vim/lib/nerdtree
fi

if [ ! -d ~/.vim/syntax ]
then
	echo "Failed to create path ./vim/synatx"
	exit 1
fi

if [ ! -d ~/.vim/lib/nerdtree]
then
	echo "Failed to create path ./vim/lib/nerdtree"
	exit 1
fi

cp after ~/.vim/ -rf
cp autoload ~/.vim/ -rf
cp doc ~/.vim/ -rf
cp plugin ~/.vim/ -rf
cp syntax ~/.vim/ -rf
cp nerdtree_plugin ~/.vim/ -rf
cp lib ~/.vim/ -rf

current_dir="$PWD"
cd ~/.vim/tags

#ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --languages=c++ --extra=+q -f cpp cpp_src
#
#ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --languages=c++ --extra=+q -f gl /usr/include/GL/
#
#ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --languages=c++ --extra=+q -f qt4 /usr/include/Qt/

ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --languages=c++ --extra=+q -f cpp /usr/include/

cd "$current_dir"
cat vimrc > ~/.vimrc
