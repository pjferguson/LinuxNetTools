## Linux scripts to help with system troubleshooting
 This repository contains a couple of bash scripts {more to be added} for diagnosing and fixing various issues on Linux systems. 


## Scripts 
- 'system-troubleshooting.sh': Has multiple functions that will check system RAM, disk utilization, active tcp connections, and advanced network statistics. 
- 'tsio.sh': Monitors VM system statistics and places the results into a new file.

## Usage
- Install this repo locally run : '''git clone https://github.com/pjferguson/LinuxNetTools'''
- Modify permissions using chmod, more on chmod: https://kb.iu.edu/d/abdb
- To make the scripts executable from any directory: '''mv /path/to/{script} /usr/local/bin/''''
- '''./script_name''', replace script_name with the script you'd like to run. 

## License
MIT License

Copyright (c) 2024 Promyse Ferguson

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
