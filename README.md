# Desk-Tool: A Linux Desktop Configuration Backup & Restore System

A super shell scripts to automatically back up, restore, and sync a Linux desktop configuration (dotfiles, applications, and more) using Git. Designed to speed up the setup process on a new machine or after a fresh OS install.

## ✨ Features

-   **Application List Backup:** Saves a list of installed applications from DNF and Flatpak.
-   **Dotfiles Management with Git:** Uses the efficient "Git Bare Repository" method to track individual configuration files across the home directory.
-   **Smart Setup Process:** Includes an interactive setup script for initial configuration.
-   **One-Shot Restore:** A single command to restore the entire work environment on a new machine.
-   **Memorable Aliases:** Short commands (`desk-backup`, `desk-import`, etc.) for daily operations.

## ⚙️ How It Works

This system does not create a standard Git repository in your home directory (which would be a disaster). Instead, it uses a **Git Bare Repository** stored at `~/.dotfiles`. This repository acts as a centralized Git database.

A special alias (`dotfiles`) is used to interact with this repository, pointing to `$HOME` as the work-tree. This way, we can track any file (`~/.bashrc`, `~/.config/htop/htoprc`) without having to move them or initialize Git in the entire home directory.

## 🚀 Installation & Setup

The process is divided into two parts: setting up on your main machine, and recovering on a new one.

### A. Initial Setup (On Your Main Machine)

Do this **only once** to start your backup.

1.  **Create an Empty Repository:** Create a new, empty (and preferably private) Git repository on GitHub, GitLab, or another Git service.
2.  **Prepare the Files:**
    * Place the `setup-desk-tool.sh` and `desk.sh` scripts in a directory.
    * Create an `aliases.sh` file in the same directory with your desired aliases.
3.  **Run the Installer:** Open a terminal in that directory and run the setup script.
    ```bash
    chmod +x setup-desk-tool.sh
    ./setup-desk-tool.sh
    ```
4.  **Follow Instructions:** The script will ask for the repository URL you created in step 1. Enter the URL, and the script will configure everything automatically.
5.  **Reload Your Shell:** After the setup is complete, reload your shell configuration to activate the aliases.
    ```bash
    source ~/.bashrc
    ```
6.  **First Backup:** Start adding your important configuration files.
    ```bash
    desk-backup ~/.bashrc ~/.zshrc ~/.gitconfig ~/.config/htop
    ```

### B. Recovery (On a New Machine or After Reinstall)

This is the step to restore all your settings.

1.  **Ensure Git is installed:**
    ```bash
    sudo dnf install git
    ```
2.  **Run the `desk-import` Command:**
    Use `curl` or `wget` to download the `desk.sh` script from your repository and execute it directly with the `import` argument.

    ```bash
    # Replace with the RAW URL of the desk.sh file in your repo
    bash -c "$(curl -fsSL [https://raw.githubusercontent.com/YOUR_USERNAME/YOUR_REPO/main/desk.sh](https://raw.githubusercontent.com/YOUR_USERNAME/YOUR_REPO/main/desk.sh))" import
    ```
    The script will ask for confirmation, then automatically clone the dotfiles, place the configuration files, add the aliases to `.bashrc`, and install all applications from your backup list.

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

-   **`desk.sh`**: The core script containing all logic. It should be placed in a directory in your `$PATH` (e.g., `~/.local/bin`) for the aliases to work. The setup script handles this.
-   **`setup-desk-tool.sh`**: The interactive installer for the initial setup on your main machine.
-   **`aliases.sh`**: Your collection of custom aliases that will be sourced by `.bashrc`.
-   **`README.md`**: This file.

## 📜 License

Licensed under the MIT License.