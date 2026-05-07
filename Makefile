SHELL := /bin/bash

REPO := $(CURDIR)
BACKUP_ROOT := $(REPO)/backups
BACKUP_DIR := $(BACKUP_ROOT)/$(shell date +%Y%m%d-%H%M%S)

# Canonical install roots
CFG_HOME := $(if $(XDG_CONFIG_HOME),$(XDG_CONFIG_HOME),$(HOME)/.config)
# iTerm2 path has a space so it cannot live in the whitespace-delimited MAPS variable.
# It is handled separately with explicit quoted cp commands in each target.
ITERM_DIR := $(HOME)/Library/Application Support/iTerm2/DynamicProfiles

# Source -> destination mappings (separator is % — safe in zsh for loops unlike |)
# Note: iTerm2 is excluded here due to its path containing a space (see ITERM_DIR above).
MAPS := \
	terminal/ghostty/designless-light%$(CFG_HOME)/ghostty/themes/designless-light \
	terminal/ghostty/designless-dark%$(CFG_HOME)/ghostty/themes/designless-dark \
	terminal/kitty/designless-light.conf%$(CFG_HOME)/kitty/colors/designless-light.conf \
	terminal/kitty/designless-dark.conf%$(CFG_HOME)/kitty/colors/designless-dark.conf \
	terminal/alacritty/designless-light.yml%$(CFG_HOME)/alacritty/colors/designless-light.yml \
	terminal/alacritty/designless-dark.yml%$(CFG_HOME)/alacritty/colors/designless-dark.yml \
	terminal/wezterm/designless-light.toml%$(CFG_HOME)/wezterm/colors/designless-light.toml \
	terminal/wezterm/designless-dark.toml%$(CFG_HOME)/wezterm/colors/designless-dark.toml \
	delta/designless-light.gitconfig%$(CFG_HOME)/delta/themes/designless-light.gitconfig \
	delta/designless-dark.gitconfig%$(CFG_HOME)/delta/themes/designless-dark.gitconfig \
	eza/light/theme.yml%$(CFG_HOME)/eza/light/theme.yml \
	eza/dark/theme.yml%$(CFG_HOME)/eza/dark/theme.yml \
	fzf/designless-light%$(CFG_HOME)/fzf/designless-light \
	fzf/designless-dark%$(CFG_HOME)/fzf/designless-dark \
	lazygit/designless-light.yml%$(CFG_HOME)/lazygit/themes/designless-light.yml \
	lazygit/designless-dark.yml%$(CFG_HOME)/lazygit/themes/designless-dark.yml \
	tmux/designless-light.conf%$(CFG_HOME)/tmux/designless-light.conf \
	tmux/designless-dark.conf%$(CFG_HOME)/tmux/designless-dark.conf \
	neovim/colors/designless-light.lua%$(CFG_HOME)/nvim/colors/designless-light.lua \
	neovim/colors/designless-dark.lua%$(CFG_HOME)/nvim/colors/designless-dark.lua \
	vim/colors/designless-light.vim%$(HOME)/.vim/colors/designless-light.vim \
	vim/colors/designless-dark.vim%$(HOME)/.vim/colors/designless-dark.vim

.PHONY: backup install install-light install-dark restore env-light env-dark lint lint-md lint-yaml lint-json

backup:
	@mkdir -p "$(BACKUP_DIR)"
	@echo "Backing up to: $(BACKUP_DIR)"
	@for m in $(MAPS); do \
		src_rel="$${m%%%*}"; \
		dest="$${m#*%}"; \
		if [[ -f "$$dest" ]]; then \
			backup_file="$(BACKUP_DIR)/$$src_rel"; \
			mkdir -p "$$(dirname "$$backup_file")"; \
			cp "$$dest" "$$backup_file"; \
			echo "  backed up: $$dest"; \
		fi; \
	done
	@for f in "terminal/iterm2/designless-light.json" "terminal/iterm2/designless-dark.json"; do \
		dest="$(ITERM_DIR)/$$(basename $$f)"; \
		if [[ -f "$$dest" ]]; then \
			backup_file="$(BACKUP_DIR)/$$f"; \
			mkdir -p "$$(dirname "$$backup_file")"; \
			cp "$$dest" "$$backup_file"; \
			echo "  backed up: $$dest"; \
		fi; \
	done
	@echo "Backup complete."

install:
	@echo "Installing theme files..."
	@for m in $(MAPS); do \
		src_rel="$${m%%%*}"; \
		dest="$${m#*%}"; \
		src="$(REPO)/$$src_rel"; \
		if [[ ! -f "$$src" ]]; then \
			echo "  missing source: $$src"; \
			exit 1; \
		fi; \
		mkdir -p "$$(dirname "$$dest")"; \
		cp "$$src" "$$dest"; \
		echo "  installed: $$dest"; \
	done
	@mkdir -p "$(ITERM_DIR)"
	@cp "$(REPO)/terminal/iterm2/designless-light.json" "$(ITERM_DIR)/designless-light.json" && echo "  installed: $(ITERM_DIR)/designless-light.json"
	@cp "$(REPO)/terminal/iterm2/designless-dark.json" "$(ITERM_DIR)/designless-dark.json" && echo "  installed: $(ITERM_DIR)/designless-dark.json"
	@echo "Install complete."

install-light:
	@echo "Installing light theme files..."
	@for m in $(MAPS); do \
		src_rel="$${m%%%*}"; \
		dest="$${m#*%}"; \
		if [[ "$$src_rel" != *light* ]]; then \
			continue; \
		fi; \
		src="$(REPO)/$$src_rel"; \
		if [[ ! -f "$$src" ]]; then \
			echo "  missing source: $$src"; \
			exit 1; \
		fi; \
		mkdir -p "$$(dirname "$$dest")"; \
		cp "$$src" "$$dest"; \
		echo "  installed: $$dest"; \
	done
	@mkdir -p "$(ITERM_DIR)"
	@cp "$(REPO)/terminal/iterm2/designless-light.json" "$(ITERM_DIR)/designless-light.json" && echo "  installed: $(ITERM_DIR)/designless-light.json"
	@echo "Light install complete."

install-dark:
	@echo "Installing dark theme files..."
	@for m in $(MAPS); do \
		src_rel="$${m%%%*}"; \
		dest="$${m#*%}"; \
		if [[ "$$src_rel" != *dark* ]]; then \
			continue; \
		fi; \
		src="$(REPO)/$$src_rel"; \
		if [[ ! -f "$$src" ]]; then \
			echo "  missing source: $$src"; \
			exit 1; \
		fi; \
		mkdir -p "$$(dirname "$$dest")"; \
		cp "$$src" "$$dest"; \
		echo "  installed: $$dest"; \
	done
	@mkdir -p "$(ITERM_DIR)"
	@cp "$(REPO)/terminal/iterm2/designless-dark.json" "$(ITERM_DIR)/designless-dark.json" && echo "  installed: $(ITERM_DIR)/designless-dark.json"
	@echo "Dark install complete."

restore:
	@latest="$$(find "$(BACKUP_ROOT)" -mindepth 1 -maxdepth 1 -type d -print 2>/dev/null | sort -r | head -1)"; \
	if [[ -z "$$latest" ]]; then \
		echo "No backup found under $(BACKUP_ROOT)."; \
		exit 1; \
	fi; \
	echo "Restoring from: $$latest"; \
	for m in $(MAPS); do \
		src_rel="$${m%%%*}"; \
		dest="$${m#*%}"; \
		backup_file="$$latest/$$src_rel"; \
		if [[ -f "$$backup_file" ]]; then \
			mkdir -p "$$(dirname "$$dest")"; \
			cp "$$backup_file" "$$dest"; \
			echo "  restored: $$dest"; \
		fi; \
	done
	@for f in "terminal/iterm2/designless-light.json" "terminal/iterm2/designless-dark.json"; do \
		backup_file="$$latest/$$f"; \
		dest="$(ITERM_DIR)/$$(basename $$f)"; \
		if [[ -f "$$backup_file" ]]; then \
			mkdir -p "$(ITERM_DIR)"; \
			cp "$$backup_file" "$$dest"; \
			echo "  restored: $$dest"; \
		fi; \
	done
	@echo "Restore complete."

env-light:
	@echo '# Use: eval "$$(make env-light)"'
	@echo "export XDG_CONFIG_HOME=\"$(CFG_HOME)\""
	@echo "export EZA_CONFIG_DIR=\"$(CFG_HOME)/eza/light\""
	@echo "export FZF_DEFAULT_OPTS_FILE=\"$(CFG_HOME)/fzf/designless-light\""
	@echo "export WEZTERM_CONFIG_FILE=\"$(CFG_HOME)/wezterm/wezterm.lua\""
	@echo "export KITTY_CONFIG_DIRECTORY=\"$(CFG_HOME)/kitty\""
	@echo "export NVIM_APPNAME=nvim"

env-dark:
	@echo '# Use: eval "$$(make env-dark)"'
	@echo "export XDG_CONFIG_HOME=\"$(CFG_HOME)\""
	@echo "export EZA_CONFIG_DIR=\"$(CFG_HOME)/eza/dark\""
	@echo "export FZF_DEFAULT_OPTS_FILE=\"$(CFG_HOME)/fzf/designless-dark\""
	@echo "export WEZTERM_CONFIG_FILE=\"$(CFG_HOME)/wezterm/wezterm.lua\""
	@echo "export KITTY_CONFIG_DIRECTORY=\"$(CFG_HOME)/kitty\""
	@echo "export NVIM_APPNAME=nvim"

lint: lint-md lint-yaml lint-json
	@echo "✓ All linting checks passed"

lint-md:
	@which markdownlint-cli2 > /dev/null || (echo "markdownlint-cli2 not found. Install with: npm install -g markdownlint-cli2 or brew install markdownlint-cli2"; exit 1)
	@echo "Linting Markdown files..."
	@markdownlint-cli2 "**/*.md" "#node_modules" --config .markdownlintrc.json || exit 1
	@echo "✓ Markdown linting passed"

lint-yaml:
	@which yamllint > /dev/null || (echo "yamllint not found. Install with: pip install yamllint or brew install yamllint"; exit 1)
	@echo "Linting YAML files..."
	@yamllint -c .yamllint --strict .github/workflows/*.yml .yamllint || exit 1
	@echo "✓ YAML linting passed"

lint-json:
	@echo "Validating JSON files..."
	@for f in $$(find . -type f -name "*.json" ! -path "./node_modules/*" ! -path "./.git/*"); do \
		if ! jq empty "$$f" 2>/dev/null; then \
			echo "✗ Invalid JSON: $$f"; \
			exit 1; \
		fi; \
	done
	@echo "✓ JSON validation passed"
