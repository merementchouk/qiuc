# Quantum-Inspired Unconventional Computing

The page itself can be seen here

[https://merementchouk.github.io/qiuc/]

## Development & Workflow Setup

This site is written in Emacs Org-mode, published to Markdown via `ox-gfm`, and built into static HTML by Jekyll. Follow these instructions to set up the workflow on a fresh Arch-based Linux environment.

### 1. Prerequisites (Arch Linux)

Install the required system packages, including Ruby, build essentials, and Emacs:

```bash
sudo pacman -Syu --needed git emacs ruby base-devel

```


Configure your local user Ruby environment (so gems can be installed without `sudo`):

```bash
# Add user gems to PATH
echo 'export GEM_HOME="$(ruby -e "puts Gem.user_dir")"' >> ~/.bashrc
echo 'export PATH="$PATH:$GEM_HOME/bin"' >> ~/.bashrc
source ~/.bashrc

```

Install Bundler:

```bash
gem install bundler

```

---

### 2. Emacs Configuration

The publishing workflow relies on `ox-gfm` (GitHub Flavored Markdown exporter).

Ensure `ox-gfm` is installed in your Emacs setup. If you use `use-package`, add this to your `~/.emacs.d/init.el` (or `~/.config/emacs/init.el`):

```elisp
(use-package ox-gfm
  :ensure t)
```

Alternatively, install it interactively:

```text
M-x package-refresh-contents RET
M-x package-install RET ox-gfm RET

```

The repository includes a `.dir-locals.el` file in the root that automatically sets project-relative export directories. When opening an `.org` file in this repository for the first time, Emacs may ask if local variables are safe—press `!` to accept permanently.*

The content of `.dir-local.el` file may look like this

```elisp
((org-mode
  . ((eval . (let* ((root (locate-dominating-file default-directory ".dir-locals.el"))
                    (org-dir (expand-file-name "org" root)))
               (setq-local org-publish-project-alist
                           `(("qiuc-page"
                              :base-directory ,org-dir
                              :base-extension "org"
                              :publishing-directory ,root
                              :publishing-function org-gfm-publish-to-gfm
                              :recursive t))))))))

```

---

### 3. Repository Setup & Local Server

1. **Clone the repository:**
```bash
git clone [https://github.com/](https://github.com/)<your-repo-path>/qiuc.git
cd qiuc

```


2. **Install Jekyll dependencies:**
Create a minimal `Gemfile` in the project root if not already present:
```ruby
source "https://rubygems.org"
gem "github-pages", group: :jekyll_plugins

# Ruby 3.4+ compatibility dependencies
gem "erb"
gem "csv"
gem "base64"
gem "bigdecimal"
gem "webrick"

```


Then install the bundle into the local user environment:
```bash
bundle config set --local path 'vendor/bundle'
bundle install

```

---

### 4. Authoring & Publishing Workflow

All source documents live under the `org/` directory.

1. **Edit or create notes:** Work inside `org/` (e.g., `org/index.org`, `org/topics/spin-models.org`).
2. **Export to Markdown:**
* Inside Emacs, run:
```text
M-x org-publish-project RET qiuc-site RET

```


* Org will mirror the folder structure and export the corresponding `.md` files to the project root and subdirectories.


3. **Run local preview server:**
```bash
bundle exec jekyll serve --livereload

```


Open `http://127.0.0.1:4000/` in your browser. Any re-export from Emacs will trigger an automatic reload.
4. **Deploy changes:**
Commit the source `.org` files and the generated `.md` files (never commit `_site/`):
```bash
git add org/ *.md topics/*.md assets/
git commit -m "Update meeting schedule and topic notes"
git push origin main

```

### 5. Ignored local content

An example of `.gitignore` content

```bash
# ----------------------------------------
# Jekyll Build Output & Metadata
# ----------------------------------------
_site/
.sass-cache/
.jekyll-cache/
.jekyll-metadata

# ----------------------------------------
# Ruby / Bundler (if testing locally)
# ----------------------------------------
.bundle/
vendor/bundle/
Gemfile.lock

# ----------------------------------------
# Emacs Artifacts
# ----------------------------------------
*~
\#*\#
.#*
auto-save-list/
/org/ltximg

# ----------------------------------------
# OS & Editor Artifacts
# ----------------------------------------
.DS_Store
Thumbs.db


```