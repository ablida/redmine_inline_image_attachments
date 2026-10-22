# Redmine Inline Image Attachments

Internal [Redmine](https://www.redmine.org/) plugin for ablida. Clicking the download icon of an image attachment opens the image in a browser tab instead of downloading it.

## What it does

Redmine sends attachments with `Content-Disposition: attachment`, so the browser saves the file. Only PDFs are shown in the browser. With this plugin, images are also sent with `Content-Disposition: inline` and open directly in a browser tab.

This is useful when Redmine's own attachment preview (shown when clicking the file name) is not enough, e.g. to view an image in full size or zoom into it.

All other file types are downloaded as before.

## Security note

This plugin undoes a security change in Redmine core ([r16285](https://www.redmine.org/projects/redmine/repository/svn/revisions/16285)). Files delivered inline are opened by the browser in the context of the Redmine domain.

This is critical for **SVG images**: an SVG file can contain JavaScript. If a user uploads a prepared SVG and someone else opens it via the download icon, the script runs with that person's Redmine session. Only use this plugin if every user who can upload attachments is trusted.

## Installation

1. Clone the repository into the `plugins` directory of the Redmine installation. The directory name must be `redmine_inline_image_attachments`, as it has to match the plugin ID:

   ```bash
   cd /path/to/redmine/plugins
   git clone https://github.com/ablida/redmine_inline_image_attachments.git
   ```

   The repository is private, so a GitHub account with access to the `ablida` organization (or a deploy key) is needed.

2. Restart Redmine.

No database migrations or settings are required.

## Notes for Redmine upgrades

The plugin replaces the private method `AttachmentsController#disposition`. If Redmine changes or renames this method in an update, the plugin may stop working or override new behavior. After each upgrade, check that images still open in the browser and that other files are still downloaded.

## Uninstallation

Remove the `plugins/redmine_inline_image_attachments` directory and restart Redmine.

## About

Copyright (c) 2023–2026 ablida. Internal use only, not licensed for redistribution.
