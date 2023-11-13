#!/bin/bash
# Author: https://gist.github.com/naranyala/90ff96270aba33bc88dfe9afcb15dcba
declare -A list

list["001"]="say hello"
list["002"]="toggle zenmode"
list["003"]="show clock"
list["004"]="show lazygit"
list["005"]="list sessions"
list["006"]="show ranger"
list["007"]="screensaver"
list["008"]="new window htop"
list["009"]="new window btop"
list["010"]="statusbar position"
list["011"]="reload config"
list["012"]="choose tree"
list["013"]="create new session"
list["014"]="rename current session"
list["015"]="kill current session"
list["016"]="kill session by-name"
list["017"]="create new window"
list["018"]="rename current window"
list["019"]="kill current window"
list["020"]="kill window by-id"
list["021"]="kill other windows"
list["022"]="show display pane"
list["023"]="kill pane by-number"
list["024"]="split vertical"
list["025"]="split horizontal"
list["026"]="switch color-theme"
list["027"]="swap window - left"
list["028"]="swap window - right"
list["029"]="swap pane - left/up"
list["030"]="swap pane - right/down"
list["031"]="prev session"
list["032"]="next session"
list["033"]="prev window"
list["034"]="next window"

run_cmd() {
	case "$1" in
	--cmd-error-handler)
		tmux display-message -p "ERR: failed to execute!"
		;;
	--cmd-001-say-hello)
		tmux display-message "Have a good day!!!"
		;;
	--cmd-002-toggle-zenmode)
		tmux if -F '#{s/off//:status}' 'set status off' 'set status on'
		;;
	--cmd-003-show-clock)
		tty-clock
		;;
	--cmd-004-show-lazygit)
		lazygit
		;;
	--cmd-005-list-sessions)
		tmux list-sessions | sed -E 's/:.*$//' | grep -v \"^$(tmux display-message -p '#S')\$\" | fzf --reverse | xargs tmux switch-client -t
		;;
	--cmd-006-show-ranger) ranger ;;
	--cmd-007-screensaver)  ;;
	--cmd-008-new-window-htop)
		tmux new-window "htop" \; set-option -w monitor-activity off
		;;
	--cmd-009-new-window-top)
		tmux new-window "top" \; set-option -w monitor-activity off
		;;
	--cmd-010-statusbar-position)
		tmux if -F '#{s/top//:status-position}' 'set status-position top' 'set status-position bottom'
		;;
	--cmd-011-reload-config)
		tmux source "$HOME/.tmux.conf" \; display-message " TMUX >>> config reloaded ..."
		;;
	--cmd-012-choose-tree) tmux choose-tree ;;
	--cmd-013-create-new-session)
		tmux command-prompt -p " TMUX >>> create new SESSION with name: " "new-session -A -s '%%'"
		;;
	--cmd-014-rename-current-session)
		tmux command-prompt -p " TMUX >>> rename this SESSION into: " "rename-session -- '%%'"
		;;
	--cmd-015-kill-current-session)
		tmux confirm-before -p " TMUX >>> kill this SESSION (#S)? (y/n)" kill-session
		;;
	--cmd-016-kill-session-byname)
		tmux command-prompt -p " TMUX >>> kill SESSION with session-name: " "kill-session -t '%%'"
		;;
	--cmd-017-create-new-window)
		tmux new-window -c "#{pane_current_path}"
		;;
	--cmd-018-rename-current-window)
		tmux command-prompt -p " TMUX >>> rename this WINDOW into: " "rename-window -- '%%'"
		;;
	--cmd-019-kill-current-window)
		tmux confirm-before -p " TMUX >>> kill this WINDOW (#S)? (y/n)" kill-window
		;;
	--cmd-020-kill-window-byid)
		tmux command-prompt -p " TMUX >>> kill WINDOW by id: " "kill-window -t '%%'"
		;;
	--cmd-021-kill-other-windows)
		tmux confirm-before -p "kill other windows? (y/n)" "kill-window -a"
		;;
	--cmd-022-show-display-pane)
		tmux display-pane
		;;
	--cmd-023-kill-pane-bynumber)
		tmux command-prompt -p " TMUX >>> kill PANE with pane-id: " "kill-pane -t '%%'"
		;;
	--cmd-024-split-vetical)
		tmux split-window -v -c "#{pane_current_path}"
		;;
	--cmd-025-split-horizontal)
		tmux split-window -h -c "#{pane_current_path}"
		;;
	--cmd-026-switch-theme)
		tmux display-message " Switch Theme!"
		;;
	--cmd-027-swap-window-left)
		tmux swap-window -t -1\; select-window -t -1
		;;
	--cmd-028-swap-window-right)
		tmux swap-window -t +1\; select-window -t +1
		;;
	--cmd-029-swap-pane-left) tmux swap-pane -U ;;
	--cmd-030-swap-pane-right) tmux swap-pane -D ;;
	--cmd-031-prev-session) tmux switch-client -p ;;
	--cmd-032-next-session) tmux switch-client -n ;;
	--cmd-033-prev-window) tmux previous-window ;;
	--cmd-034-next-window) tmux next-window ;;

	esac
}

### MAIN ###

main() {
	selected_menu=$(
		printf '%s\n' "${list[@]}" | sort -n |
			fzf --reverse --prompt="TMUX GLOBAL MENU: " --preview="cat" --preview-window="hidden"
	)

	if [ -n "$selected_menu" ]; then
		tmux popup -w 85% -h 60% -E "sh $selected_menu; read -n 1 -s -r -p 'Press any key to close...'"

		case $selected_menu in
		${list["001"]}) run_cmd --cmd-001-say-hello ;;
		${list["002"]}) run_cmd --cmd-002-toggle-zenmode ;;
		${list["003"]}) run_cmd --cmd-003-show-clock ;;
		${list["004"]}) run_cmd --cmd-004-show-lazygit ;;
		${list["005"]}) run_cmd --cmd-005-list-sessions ;;
		${list["006"]}) run_cmd --cmd-006-show-ranger ;;
		${list["007"]}) run_cmd --cmd-007-screensaver ;;
		${list["008"]}) run_cmd --cmd-008-new-window-htop ;;
		${list["009"]}) run_cmd --cmd-009-new-window-btop ;;
		${list["010"]}) run_cmd --cmd-010-statusbar-position ;;
		${list["011"]}) run_cmd --cmd-011-reload-config ;;
		${list["012"]}) run_cmd --cmd-012-choose-tree ;;
		${list["013"]}) run_cmd --cmd-013-create-new-session ;;
		${list["014"]}) run_cmd --cmd-014-rename-current-session ;;
		${list["015"]}) run_cmd --cmd-015-kill-current-session ;;
		${list["016"]}) run_cmd --cmd-016-kill-session-byname ;;
		${list["017"]}) run_cmd --cmd-017-create-new-window ;;
		${list["018"]}) run_cmd --cmd-018-rename-current-window ;;
		${list["019"]}) run_cmd --cmd-019-kill-current-window ;;
		${list["020"]}) run_cmd --cmd-020-kill-window-byid ;;
		${list["021"]}) run_cmd --cmd-021-kill-other-windows ;;
		${list["022"]}) run_cmd --cmd-022-show-display-pane ;;
		${list["023"]}) run_cmd --cmd-023-kill-pane-bynumber ;;
		${list["024"]}) run_cmd --cmd-024-split-vetical ;;
		${list["025"]}) run_cmd --cmd-025-split-horizontal ;;
		${list["026"]}) run_cmd --cmd-026-switch-theme ;;
		${list["027"]}) run_cmd --cmd-027-swap-window-left ;;
		${list["028"]}) run_cmd --cmd-028-swap-window-right ;;
		${list["029"]}) run_cmd --cmd-029-swap-pane-left ;;
		${list["030"]}) run_cmd --cmd-030-swap-pane-right ;;
		${list["031"]}) run_cmd --cmd-031-prev-session ;;
		${list["032"]}) run_cmd --cmd-032-next-session ;;
		${list["033"]}) run_cmd --cmd-033-prev-window ;;
		${list["034"]}) run_cmd --cmd-034-next-window ;;

		*) run_cmd --cmd-error-handler ;;
		esac
	fi
}

main
