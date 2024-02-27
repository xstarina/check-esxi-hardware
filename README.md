# check_esxi_hardware.py as a Docker container

Author: [Claudio Kuenzler](https://www.claudiokuenzler.com/monitoring-plugins/check_esxi_hardware.php)

check_esxi_hardware (formerly known as check_esx_wbem) is an open source monitoring plugin to monitor the hardware of ESXi (and previously ESX) servers. It queries the CIM (Common Information Model) server running on the ESXi server to retrieve the current status of all discovered hardware parts. The plugin can also be used as standalone script to check the hardware. The plugin is written in python and uses the pywbem module. It supports both python2 and python3. See Requirements for more information.

## Original script taken from here
<https://www.claudiokuenzler.com/monitoring-plugins/check_esxi_hardware.php>

## Usage example
```
docker run --rm \
  -v ${PWD}/.esxipass:/app/.esxipass:ro \
  starina/check-esxi-hardware:latest \
  -H esxi1.domain.local -U file:.esxipass -P file:.esxipass
```

## Definition of the parameters
<https://www.claudiokuenzler.com/monitoring-plugins/check_esxi_hardware.php#Parameters>
```
docker run --rm starina/check-esxi-hardware:latest --help
```
