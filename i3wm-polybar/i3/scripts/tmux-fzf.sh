#!/bin/bash
# Author: https://gist.github.com/naranyala/90ff96270aba33bc88dfe9afcb15dcba
declare -A list

list["001"]="toggle zenmode"
list["002"]="show clock"
list["003"]="show lazygit"
list["004"]="list sessions"
list["005"]="show ranger"
list["006"]="new window htop"
list["007"]="new window btop"
list["008"]="statusbar position"
list["009"]="reload config"
list["010"]="choose tree"
list["011"]="create new session"
list["012"]="rename current session"
list["013"]="kill current session"
list["014"]="kill session by-name"
list["015"]="create new window"
list["016"]="rename current window"
list["017"]="kill current window"
list["018"]="kill window by-id"
list["019"]="kill other windows"
list["020"]="show display pane"
list["021"]="kill pane by-number"
list["022"]="split vertical"
list["023"]="split horizontal"
list["024"]="swap window - left"
list["025"]="swap window - right"
list["026"]="swap pane - left/up"
list["027"]="swap pane - right/down"
list["028"]="prev session"
list["029"]="next session"
list["030"]="prev window"
list["031"]="next window"

run_cmd() {
	case "$1" in
	--cmd-error-handler)
		tmux display-message -p "ERR: failed to execute!"
		;;
	--cmd-001-toggle-zenmode)
		tmux if -F '#{s/off//:status}' 'set status off' 'set status on'
		;;
	--cmd-002-show-clock)
		tty-clock
		;;
	--cmd-003-show-lazygit)
		lazygit
		;;
	--cmd-004-list-sessions)
		tmux list-sessions | sed -E 's/:.*$//' | grep -v \"^$(tmux display-message -p '#S')\$\" | fzf --reverse | xargs tmux switch-client -t
		;;
	--cmd-005-show-ranger) ranger ;;
	--cmd-006-new-window-htop)
		tmux new-window "htop" \; set-option -w monitor-activity off
		;;
	--cmd-007-new-window-top)
		tmux new-window "top" \; set-option -w monitor-activity off
		;;
	--cmd-008-statusbar-position)
		tmux if -F '#{s/top//:status-position}' 'set status-position top' 'set status-position bottom'
		;;
	--cmd-009-reload-config)
		tmux source "$HOME/.tmux.conf" \; display-message " TMUX >>> config reloaded ..."
		;;
	--cmd-010-choose-tree) tmux choose-tree ;;
	--cmd-011-create-new-session)
		tmux command-prompt -p " TMUX >>> create new SESSION with name: " "new-session -A -s '%%'"
		;;
	--cmd-012-rename-current-session)
		tmux command-prompt -p " TMUX >>> rename this SESSION into: " "rename-session -- '%%'"
		;;
	--cmd-013-kill-current-session)
		tmux confirm-before -p " TMUX >>> kill this SESSION (#S)? (y/n)" kill-session
		;;
	--cmd-014-kill-session-byname)
		tmux command-prompt -p " TMUX >>> kill SESSION with session-name: " "kill-session -t '%%'"
		;;
	--cmd-015-create-new-window)
		tmux new-window -c "#{pane_current_path}"
		;;
	--cmd-016-rename-current-window)
		tmux command-prompt -p " TMUX >>> rename this WINDOW into: " "rename-window -- '%%'"
		;;
	--cmd-017-kill-current-window)
		tmux confirm-before -p " TMUX >>> kill this WINDOW (#S)? (y/n)" kill-window
		;;
	--cmd-018-kill-window-byid)
		tmux command-prompt -p " TMUX >>> kill WINDOW by id: " "kill-window -t '%%'"
		;;
	--cmd-019-kill-other-windows)
		tmux confirm-before -p "kill other windows? (y/n)" "kill-window -a"
		;;
	--cmd-020-show-display-pane)
		tmux display-pane
		;;
	--cmd-021-kill-pane-bynumber)
		tmux command-prompt -p " TMUX >>> kill PANE with pane-id: " "kill-pane -t '%%'"
		;;
	--cmd-022-split-vetical)
		tmux split-window -v -c "#{pane_current_path}"
		;;
	--cmd-023-split-horizontal)
		tmux split-window -h -c "#{pane_current_path}"
		;;
	--cmd-024-swap-window-left)
		tmux swap-window -t -1\; select-window -t -1
		;;
	--cmd-025-swap-window-right)
		tmux swap-window -t +1\; select-window -t +1
		;;
	--cmd-026-swap-pane-left) tmux swap-pane -U ;;
	--cmd-027-swap-pane-right) tmux swap-pane -D ;;
	--cmd-028-prev-session) tmux switch-client -p ;;
	--cmd-029-next-session) tmux switch-client -n ;;
	--cmd-030-prev-window) tmux previous-window ;;
	--cmd-031-next-window) tmux next-window ;;

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
		${list["001"]}) run_cmd --cmd-001-toggle-zenmode ;;
		${list["002"]}) run_cmd --cmd-002-show-clock ;;
		${list["003"]}) run_cmd --cmd-003-show-lazygit ;;
		${list["004"]}) run_cmd --cmd-004-list-sessions ;;
		${list["005"]}) run_cmd --cmd-005-show-ranger ;;
		${list["006"]}) run_cmd --cmd-006-new-window-htop ;;
		${list["007"]}) run_cmd --cmd-007-new-window-btop ;;
		${list["008"]}) run_cmd --cmd-008-statusbar-position ;;
		${list["009"]}) run_cmd --cmd-009-reload-config ;;
		${list["010"]}) run_cmd --cmd-010-choose-tree ;;
		${list["011"]}) run_cmd --cmd-011-create-new-session ;;
		${list["012"]}) run_cmd --cmd-012-rename-current-session ;;
		${list["013"]}) run_cmd --cmd-013-kill-current-session ;;
		${list["014"]}) run_cmd --cmd-014-kill-session-byname ;;
		${list["015"]}) run_cmd --cmd-015-create-new-window ;;
		${list["016"]}) run_cmd --cmd-016-rename-current-window ;;
		${list["017"]}) run_cmd --cmd-017-kill-current-window ;;
		${list["018"]}) run_cmd --cmd-018-kill-window-byid ;;
		${list["019"]}) run_cmd --cmd-019-kill-other-windows ;;
		${list["020"]}) run_cmd --cmd-020-show-display-pane ;;
		${list["021"]}) run_cmd --cmd-021-kill-pane-bynumber ;;
		${list["022"]}) run_cmd --cmd-022-split-vetical ;;
		${list["023"]}) run_cmd --cmd-023-split-horizontal ;;
		${list["024"]}) run_cmd --cmd-024-swap-window-left ;;
		${list["025"]}) run_cmd --cmd-025-swap-window-right ;;
		${list["026"]}) run_cmd --cmd-026-swap-pane-left ;;
		${list["027"]}) run_cmd --cmd-027-swap-pane-right ;;
		${list["028"]}) run_cmd --cmd-028-prev-session ;;
		${list["029"]}) run_cmd --cmd-029-next-session ;;
		${list["030"]}) run_cmd --cmd-030-prev-window ;;
		${list["031"]}) run_cmd --cmd-031-next-window ;;

		*) run_cmd --cmd-error-handler ;;
		esac
	fi
}

main
