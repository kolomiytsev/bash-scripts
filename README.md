# bash-scripts
To execute bash script run

> chmod +x script_name

and then type ./script_name
or enter

> bash script_name

All additional information about each script you'll find below

###Script1###

This script creates group, then add users to that group and creates password or ssh key for each of user.

Script1 accepts as:

+ first argument - comma separated list of users;
+ second argument - group name;
+ third argument - "ssh" or "password" flag;


###Script2###

This script will monitor specific log file on remote system(s) and will send to stdout lines that contain specified text.

Script2 accepts as:

+ first argument - file for monitoring;
+ 2nd - 6th arguments - remote systems to connect;

Also you should specify ssh key path, and keyword for search in script body (keyword & ssh_key variables).



###Script3###

This script starts after each system reboot , runs 40 minutes from boot and stops CURLing with an interval of X seconds (from config file) a random web page from a list of URLs (from a config file), counts occurrences of a specific substring in the html code of that web page with output to a result.txt file.

Script3 use config file that located at same directory as script.
At config file we could specify:

+ CURLing interval;
+ Url list;
+ Keyword;

**Config file should end with new line.**

**First of all you should add script to the crontab using such syntax:**

    crontab -e
    @reboot /path_to_script/script3.sh*


###Script4###

This script will check CPU usage of a process/processes on local system by it's partial name cmd param each 10 seconds. 
If CPU usage exceeds 5% - a warning log would appear with process details.

Script accepts as:

+ first argument - name of process(es) to look for (not less than 4 letters);




