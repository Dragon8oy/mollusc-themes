# mollusc-themes
 - A collection of customised themes, packaged as .debs
 - If you have an issue, please file a bug report under [Issues](https://github.com/Dragon8oy/mollusc-themes/issues "Issues")
 - GitHub Link: https://github.com/Dragon8oy/mollusc-themes
 - The master branch is usually unstable, refer to the releases page for stable releases

## Contents:
 - Component - `Author` - Source
 - GRUB Theme (Modified) - `vinceliuice` - [grub2-themes](https://github.com/vinceliuice/grub2-themes "grub2-themes")
 - Plymouth Theme (Modified) - `navisjayaseelan` - [apple-mac-plymouth](https://github.com/navisjayaseelan/apple-mac-plymouth "apple-mac-plymouth")
 - Shell / GTK / Sound / Icon / Cursor Theme - `Canonical / Yaru Team` - [Yaru](https://github.com/ubuntu/yaru "Yaru")
 - Wallpapers - `DigitalOcean`
 - Fonts - `Canonical`
 - Terminal Profile - `Dragon8oy`

 - GDM Theme (Undecided) - ``

## Installation:
 - Download the latest deb from the Releases page
 - Run `sudo dpkg -i mollusc-themes_all.deb`
 - ### OR:
   * Run `./build.sh -i`

## Building:
 - Download the version of yaru's .tar.gz required (Usually the latest)
 - Save it in the project's root folder
 - Run `./build.sh -b`

## Updating:
 - ### Automatic:
   * Run `update-themes -u`
 - ### Manual:
   * Follow the instructions in the `Installation` section

## Code of Conduct and Contributing:
 - Read 'CODE\_OF\_CONDUCT.md' and 'CONTRIBUTING.md' in 'docs/' for information

## License
 - This project has mixed licencing. You are free to copy, redistribute and/or modify aspects of this work under the terms of each licence accordingly (unless otherwise specified).
 - Code / assets, unless specified, is free software licensed under the terms of the GNU General Public License, version 3.

 - ### grub2-themes:
   * Changed background
   * Modified for packaging

 - ### apple-mac-plymouth:
   * Changed logo
   * Changed locked icon
   * Changed password prompt

 - ### Yaru:
   * The Suru icon assets (any and all source .svg files or rendered .png files) are licensed under the terms of the Creative Commons Attribution-ShareAlike 4.0 License.
   * Other included scripts and assets are free software licensed under the terms of the GNU General Public License, version 3.
