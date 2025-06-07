# my-mobile-tablet-notes #

#### Bash and eLisp script used to sync Emacs org mode and Obsidian md notes on tablet ####

Some duplicate code, but basically, the only thing that matters is the publishing function `(org-publish-project "my-org" t)`
and defining `org-publish-project-alist`. No proper variable naming, coz its a one-off, executing from tablet to create readable Obsidian notes.
The rest is details becoz of difficulty of making Emacs create directories recursively (for images), copying images (separate from publishing to md, which is not automatic), bashrc to trigger the whole thing from Android Termux, replacing spaces with tabs (cant remember whats that for).
