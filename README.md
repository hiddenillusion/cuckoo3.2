cuckoo patches
======

This repo contains patches for the 0.3.2 release of the cuckoo sandbox (http://www.cuckoobox.org). These patches are diffs from the original files. In order to implement these patches you need to 'patch' them on your system:

- $ patch /path/to/cuckoo/processing/data.py < data.py.patch
- $ patch /path/to/cuckoo/web/sections/dropped_files.html < dropped_files.html.patch
- $ patch /path/to/cuckoo/processing/file.py < file.py.patch
- $ patch /path/to/cuckoo/web/sections/general_information.html < general_information.html.patch
- $ patch /path/to/cuckoo/web/report.html < report.html.patch
- $ patch /path/to/cuckoo/reporting/tasks/reporttxt.py < reporttxt.py.patch

and copy the new files as such:

- $ cp signatures.html /path/to/cuckoo/web/sections/
- $ cp lookups.html /path/to/cuckoo/web/sections/
- $ cp watcher.rb /path/to/cuckoo/

You also need to:

- edit '/path/to/cuckoo/processing/file.py' to include your YARA signatures, ClamAV database(s)/clamscan location and VirusTotal API key