# gentoo-overlay

Assorted Gentoo portage tree overlay by mittwinter. Contains several
ebuilds that I needed or found useful over the time. Sparsely maintained.

## Installation

Via [layman](https://wiki.gentoo.org/wiki/Layman):

1. Install layman: `% emerge -av layman`
2. Make this overlay known to layman by adding the following line to `/etc/layman/layman.cfg`:

   ```
   overlays:
     # ...
     https://dev.mroot.net/gentoo/repositories.xml
   ```
3. Fetch the list of all repositories:

   ```
   % layman --fetch
   ```

4. Add this overlay:

   ```
   % layman -a mittwinter
   ```
