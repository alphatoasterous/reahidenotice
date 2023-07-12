# reahidenotice
Utility to hide Cockos REAPERs Evaluation Notice at the start. For naughty users.

## DISCLAIMER
**REAPER IS NOT FREE.**

It is a paid software product.
If you use it more than 60 days you are **required** to purchase a license.
REAPER licenses are very reasonably priced, and they offer discounts for personal non-commercial use, and for very small businesses.

Please, buy the license at [reaper.fm](https://www.reaper.fm/purchase.php). It is a steal for the features and quality given.

## How does it work?
The script simply hides "About REAPER ..." window that shows at the start of Cockos REAPER using AutoHotkey [WinHide()](https://www.autohotkey.com/docs/v2/lib/WinHide.htm) function. It does not modify Cockos REAPER distribution files in **any** way.

It should pass any arguments to REAPER executable properly. I hope so.

## Download / How to use it?
### Method 1 - Pre-built
 - Download the binary from the [releases](https://github.com/alphatoasterous/reahidenotice/) page.
 - Put it alongside **reaper.exe** in your REAPERs installation folder.
 - Use it to start up REAPER instead of **reaper.exe**.

Please note that pre-built executables might not be binary-reproducible due to MPRESS used and some resources replaced via scripts compiler directives.
 
### Method 2 - As an AHK script
 - Clone or download the main branch of this repository.
 - Copy the script into your REAPERs installation folder, alongside **reaper.exe**.
 - Use it to start up REAPER instead of **reaper.exe**.

## Build
Build using ahk2exe GUI, if you need to. Note that the script contains compiler directives for setting up a 1x1 pixel icon (as a rather redundant space-saving measure).

