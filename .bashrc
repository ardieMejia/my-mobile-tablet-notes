alias cdo="cd ~/storage/shared/Documents/my-org-and-obsidian"
alias cdd="cd ~/storage/shared/Documents/TestMD"
alias e="emacs"
alias v="vim"


read -p 'Continue syncing org repo, and publish? (y or n)' yn


function start_cycle() {
	git -C ~/storage/shared/Documents/my-org-and-obsidian/my-org-notes pull origin main
	emacs --load ~/storage/shared/Documents/my-org-and-obsidian/rd-org-publish-org-obsidian.el
}


function end_cycle() {
	echo 'nothing happened'
}
	




if [[ $yn == 'y' ]]
then
	start_cycle
else
	end_cycle
fi


