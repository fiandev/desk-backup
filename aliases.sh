#!/bin/sh

# ==============================================================================
# DESK-TOOL ALIASES FOR BASH & ZSH
# ==============================================================================
# This file provides a set of convenient aliases for the desk-backup script.
# It should be sourced in your ~/.bashrc or ~/.zshrc file.

# --- ALIAS DEFINITIONS ---

# Usage: desk-import
# Clones the remote repository and restores the entire desktop configuration on a new machine.
alias desk-import='~/.local/bin/deskbackup import'

# Usage: desk-recovery
# Restores tracked files and reinstalls applications from the backup lists.
alias desk-recovery='~/.local/bin/deskbackup recovery'

# Usage: desk-backup <file1> <folder2> ...
# Adds one or more files/folders to the backup, commits, and pushes them.
alias desk-backup='~/.local/bin/deskbackup backup'

# Usage: desk-ignore <file_or_folder>
# Stops tracking a file or folder, but leaves it on the local disk.
alias desk-ignore='~/.local/bin/deskbackup ignore'

# Usage: desk-remove <file_or_folder>
# Removes a file or folder from the local disk and the backup.
alias desk-remove='~/.local/bin/deskbackup remove'
