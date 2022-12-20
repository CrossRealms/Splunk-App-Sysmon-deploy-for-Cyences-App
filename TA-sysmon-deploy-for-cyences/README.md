# Sysmon Deploy Add-on for Cyences App


OVERVIEW
--------
The Sysmon Deploy for Cyences App is a Splunk Add-on to deploy Sysmon and collect Sysmon logs from Windows hosts. This Add-on is useful to collect the Sysmon data for Cyences App for Splunk (https://splunkbase.splunk.com/app/5351/). It contains required inputs and scrips. It does not contain alerts/reports and dashboards.


* Author - CrossRealms International Inc.
* Creates Index - False
* Compatible with:
   * Splunk Enterprise version: 9.0, 8.2, 8.1, 8.0
   * OS: Platform Independent



TOPOLOGY AND SETTING UP SPLUNK ENVIRONMENT
------------------------------------------
* Install this Add-on on required Windows server through Universal Forwarders.
* Add-on can be installed on both full Splunk server and Splunk universal forwarder.


INSTALLATION, DEPENDENCIES, DATA COLLECTION & CONFIGURATION
------------------------------------------------------------
* Deploy this App on the Windows UFs through deployment server.
* Add-on does not require any App configurations.

Visit https://cyences.com/cyences-app-for-splunk/ for the more information.


RELEASE NOTES
-------------
Version 1.1.0 (December 2022)
* Sysmon binary updated to the latest version 14.13.
* Enhanced deploy Sysmon and update config scripted input.
* Added log clean up script to remove log file every week.


Version 1.0.2 (November 2022)
* Sysmon binary updated to the latest version 14.11.


Version 1.0.1 (October 2021)
* Excluded more Splunk related files from being collected to reduce license usage.
* Removed invalid key from inputs.conf.


Version 1.0.0 (October 2021)
* Created Sysmon Deploy Add-on for Cyences App with scripts and inputs.


OPEN SOURCE COMPONENTS AND LICENSES
------------------------------
* NA


# Binary File Declaration
bin/Sysmon.exe: this file does not require any source code
bin/Sysmon64.exe: this file does not require any source code



CONTRIBUTORS
------------
* Vatsal Jagani
* Bhavik Bhalodia
* Preston Carter
* Ahad Ghani
* Usama Houlila
* Mahir Chavda


SUPPORT
-------
* Contact - CrossRealms International Inc.
  * US: +1-312-2784445
* License Agreement - https://d38o4gzaohghws.cloudfront.net/static/misc/eula.html
* Copyright - Copyright CrossRealms Internationals, 2023
