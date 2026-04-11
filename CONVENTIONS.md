# Literate Dotfiles

This repository contains `.org`{.verbatim} files (mainly
`dotfiles.org`{.verbatim}) that hold source code blocks, where lines of
code in various programming languages live. These blocks will be
exported via Org-mode's tangling functionality and utilized as dotfiles.

## Coding Conventions {#coding-conventions created="[2026-04-11 Sat 10:35]"}

### Emacs Lisp {#emacs-lisp created="[2026-04-11 Sat 10:13]"}

1.  Documentation String

    Follow
    <https://www.gnu.org/software/emacs/manual/html_node/elisp/Documentation-Tips.html>

## Version Control {#version-control created="[2026-04-11 Sat 10:15]"}

### Git Commit Message

1.  Role

    You are an expert developer specializing in \"Literate Programming\"
    for dotfiles, using Org-mode to tangle configuration files.

2.  Context

    -   The repository stores system configurations as `.org`{.verbatim}
        files (Literate Dotfiles).
    -   Changes are applied by editing the `.org`{.verbatim} files,
        which are then tangled into the actual configuration files
        (e.g., `.zshrc`{.verbatim}, `init.lua`{.verbatim}).
    -   The commit should focus on the intent behind the configuration
        change within the Org-mode source.

3.  Commit Type Definitions

    Use one of the following types for your commit:

    -   `feat`{.verbatim}: Adding a new tool, configuration block, or
        application setting.
    -   `fix`{.verbatim}: Fixing a bug in a configuration or a tangling
        issue.
    -   `chore`{.verbatim}: Routine maintenance (e.g., updating package
        managers, organizing Org-mode headers, dependency updates).
    -   `style`{.verbatim}: Formatting or cleanup of the Org-mode file
        (does not affect runtime behavior).
    -   `refactor`{.verbatim}: Restructuring the Org-mode file (e.g.,
        changing header structure, grouping related settings).
    -   `docs`{.verbatim}: Adding explanations or documentation within
        the Org-mode file.

4.  Rules

    1.  **Format**: Follow the \[Conventional Commits
        v1.0.0\](<https://www.conventionalcommits.org/en/v1.0.0/>)
        specification.
    2.  **Scope**: Use the application or category name as the scope
        (e.g., `feat(zsh): ...`{.verbatim},
        `fix(nvim): ...`{.verbatim}).
    3.  **Description**: Be concise. Describe *what* was changed from
        the perspective of the configuration, not just the file name.
    4.  **Body (Optional)**: If the change is complex, briefly explain
        the motivation for the configuration change in the body.
    5.  **Footer**: Include breaking changes if any, or reference
        relevant issue trackers.

5.  Output Format

    ``` example
    <type>(<scope>): <short summary>

    [optional body]

    [optional footer(s)]
    ```
