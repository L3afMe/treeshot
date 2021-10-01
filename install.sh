# Install script
chmod +x ./src/treeshot
cp ./src/treeshot /usr/bin/treeshot

# Install man page
mkdir /usr/local/man/man1
cp ./man/treeshot.1 /usr/local/man/man1/treeshot.1
gzip /usr/local/man/man1/treeshot.1
mandb
