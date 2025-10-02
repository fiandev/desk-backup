# Desk-Backup

## A Linux Desktop Configuration Backup & Restore System

A collection of shell scripts to automatically back up, restore, and sync a Linux desktop configuration (dotfiles, applications, and more) using Git. It is designed to speed up the setup process on a new machine or after a fresh OS installation.

## ✨ Features

-   **Application List Backup:** Saves a list of installed applications from DNF and Flatpak.
-   **File Backup Management with Git:** Uses the efficient "Git Bare Repository" method to track individual configuration files across the home directory.
-   **Smart Setup Process:** Includes an interactive setup script for initial configuration.
-   **One-Shot Restore:** A single command to restore an entire work environment on a new machine.
-   **Memorable Aliases:** Short commands (`desk-backup`, `desk-import`, etc.) for daily operations.

## ⚙️ How It Works

This system does not create a standard Git repository in your home directory (which would be a disaster). Instead, it uses a **Git Bare Repository** stored at `~/.dotfiles`. This repository acts as a centralized Git database.

A special alias (`dotfiles`) is used to interact with this repository, pointing to `$HOME` as the work-tree. This way, you can track any file (`~/.bashrc`, `~/.config/htop/htoprc`) without having to move them or initialize Git in the entire home directory.

## 📦 Creating a Remote Repository

Before you begin the installation, you need a place to store your backups. This system uses a Git repository as the central storage for your configuration files.

1.  **Choose a Git Hosting Service:**
    You can use any Git hosting provider, such as:
    *   GitHub
    *   GitLab
    *   Bitbucket
    *   A self-hosted Git server

2.  **Create a New, Private Repository:**
    Create a new repository on your chosen service. It is **highly recommended** to make this repository **private**, as it may contain sensitive information.

3.  **Use SSH, Not HTTPS:**
    When you create the repository, you will be given a URL to connect to it. It is strongly recommended to use the **SSH URL** instead of the HTTPS URL.

    *   **SSH URL (Recommended):** `git@github.com:YourUsername/YourRepo.git`
    *   **HTTPS URL:** `https://github.com/YourUsername/YourRepo.git`

    Using SSH is more secure and convenient as it allows you to authenticate using SSH keys instead of typing a password or personal access token every time you push changes.

## 🚀 Installation & Setup

The process is divided into two parts: setting up on your main machine and recovering on a new one.

### Initial Setup

1.  **Ensure Git is installed:**
    Check [this guide](https://git-scm.com/downloads) to install Git on your device.

2. **Run the Installer:** 
    Open a terminal and run the setup script.

    Do this **only once** to start your backup. This step is for restoring all your settings.


    ```bash
    curl -sL https://github.com/desk-backup/install | bash
    ```
3.  **Follow Instructions:** 
    The script will ask for the repository URL you created in step 1. Enter the URL, and the script will configure everything automatically.

4.  **Reload Your Shell:** 
    After the setup is complete, reload your shell configuration to activate the aliases.
    ```bash
    source ~/.bashrc
    ```
5.  **Run the `desk-import` Command:**
    ```bash
    desk-import 
    # or
    deskbackup import
    ```

6.  **First Backup:** 
    Start adding your important configuration files.

    ```bash
    desk-backup ~/.bashrc ~/.zshrc ~/.gitconfig ~/.config/htop
    ```

## 🛠️ Command List

After the setup is complete, you can use the following aliases in your terminal.

| Command         | Description                                                                                          | Example Usage                                   |
| :-------------- | :--------------------------------------------------------------------------------------------------- | :---------------------------------------------- |
| `desk-backup`   | Adds a file or folder to the Git backup, then commits & pushes.                                      | `desk-backup ~/.config/nvim ~/.aliases.sh`      |
| `desk-import`   | **(For recovery only)** Executes the full restore process on a new machine.                          | `bash -c "$(curl...)" import`                   |
| `desk-recovery` | Restores tracked files to their last committed state & reinstalls apps. Useful if a file was deleted. | `desk-recovery`                                 |
| `desk-ignore`   | Stops tracking a file or folder without deleting it from your disk.                                  | `desk-ignore ~/.cache/some_file`                |
| `desk-remove`   | Deletes a file from your disk and the backup. Use `--purge-history` for advanced removal.            | `desk-remove ~/.config/old_app`                 |

## 📂 File Structure

-   **`deskbackup`**: The core script containing all logic. It should be placed in a directory in your `$PATH` (e.g., `~/.local/bin`) for the aliases to work. The setup script handles this.
-   **`install`**: The interactive installer for the initial setup on your main machine.
-   **`aliases.sh`**: Your collection of custom aliases that will be sourced by `.bashrc`.
-   **`README.md`**: This file.

## 📜 License

Licensed under the MIT License.
