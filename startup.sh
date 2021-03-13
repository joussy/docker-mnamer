#!/bin/bash
shell2http -show-errors -include-stderr -form -export-all-vars -timeout=600 -cgi / '/bin/bash /config/mnamer.sh'
