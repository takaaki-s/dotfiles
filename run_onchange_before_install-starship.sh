#!/bin/bash

# Prompt is starship (see dot_config/starship.toml). Kept out of
# run_onchange_before_install-packages.sh so that editing this one does not
# re-trigger the sheldon/nvim/mise installers.

command -v starship >/dev/null 2>&1 ||
  curl --proto '=https' -fLsS https://starship.rs/install.sh | sh -s -- --yes --bin-dir "$HOME/.local/bin"
