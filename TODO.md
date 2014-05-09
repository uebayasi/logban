- Write a makefile.
- Leave sed results (e.g. /var/tmp/logban/authlog.blacklist).  Compare
  timestamp and rerun sed only when updated.
  - Cache inode number and line numbers too?
- Split backend into own files (ban-npf.sh).
