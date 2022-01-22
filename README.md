# webcamOnTop

View IP cameras in a window that will always stay on top

Surf the web or read email while keeping an eye on the action. Works with the URL of any live image, all AXIS cameras or video encoders, and many other camera manufactures like Panasonic and AvertX. Also useful to display network monitors, weather radar, or any web content you don't want to miss.

webcamOnTop will not work directly with USB webcams (like those sold by Linksys or Microsoft) unless a third-party application, such as webcamXP, makes the image stream available at a web (http://) address.

Tested on Windows 2000, XP, Vista, 7, 8, 8.1 and Server 2003, 2008, 2012

Note: webcamOnTop is intentionally a Windows 32-bit executable, this way it can run the Axis Media Control (AMC) available at: https://www.axis.com/support/tools/install-and-manage-systems/axis-media-control - which is also 32-bit, along with it's ActiveX component.

## Installation

1) Run wcontop-setup.exe and follow the wizard
2) Launch webcamOnTop in any of the following ways...

Start Menu:  Programs, webcamOnTop, webcamOnTop icon (also edit the webcam.ini file as indicated below)

Command line: 

    webcam.exe http://example.com/file.htm

Remotely:

    psexec \\computername -d -i -w "C:\Program Files\webcamOnTop" "C:\Program Files\webcamOnTop\webcam.exe" http://example.com/file.htm

Webpage link:

    webcamontop://example.com/file.htm

## .ini Settings

The INI is used for all users on a machine, or whenever a file/URL is not included as a parameter with the executable. Using shortcuts with a parameter provides a way to customize the view for different windows users.

Edit C:\Program Files\webcamOnTop\webcam.ini to point to the file or URL where your camera is visible. Only one file location (referenced on the local disk, network by drive letter, or URL) can be defined in the INI.

Files below can be downloaded with "right-click, Save Target As..."  You must edit the file to contain the IP or hostname and other settings for your camera. The file path is an example for use in the INI, alternatively the file could be hosted and defined as a URL.

For AXIS cameras and video encoders see the samples at:

    http://jpelectron.com/sample/Axis%20IP%20Camera/

For use with Panasonic Network Cameras*

    http://[ip-address]:[port]/ImageViewer?Mode=Motion&Resolution=320x240
    http://[ip-address]:[port]/cgi-bin/camera  (for newer cameras like the WV-NS202A)
    http://[username]:[password]@[ip-address]:[port]/cgi-bin/camera  (include your login info)

For use with webcamXP software

    http://[ip-address]:[port]/wetdex.html?number=1

If you are using port 80, the default www port, you do not need to specify it.
Example: http://127.0.0.1:80/ is the same as http://127.0.0.1/
Some cameras or software may use an alternate port such as 8080.
Example: http://127.0.0.1:8080/

AutoClose=20
...would cause webcamOnTop to close 20 seconds after it is launched. If the special HTML tag with close="X" is encountered, then that value would take precedence.

FixupW=8
FixupH=11
...would cause webcamOnTop's Width and Height to appear correctly under later versions of Windows themes that are not like XP's "Windows Classic" theme. Optionally, use these settings on select systems to display additional features further down/right in the HTML page that normal systems wouldn't see.

## Usage

webcamOnTop can be resized by clicking and dragging the bottom-right corner of the window, this preference along with window location is saved in the registry for the next launch. To automatically resize the window add the special tag <webcamontop width="362" height="295"> to the HTML file being displayed. When webcamOnTop sees this tag it will resize to the width and height specified.

Adding close="X" to the special tag of the HTML file will cause webcamOnTop to close after the specified number of seconds. This is useful to conserve bandwidth to a camera if someone leaves webcamOnTop running. The close option can be used alone as <webcamontop close="10"> or with size declarations as <webcamontop width="640" height="480" close="10">

When webcamOnTop is the active window you can...
Press F5 to refresh
Press Backspace to go back a page
Press ESC to exit (or Clear on a Media Center Edition remote)

To suppress popup messages about script errors from within the webcamOnTop window you should disable script debugging, see: http://jpelectron.com/sample/WWW%20and%20HTML/disable%20script%20debugging.txt

## Related Links

http://www.axis.com/ - network cameras and video encoders

http://www.webcamxp.com/ - webcam streaming software

## License

GPL does not allow you to link GPL-licensed components with other proprietary software (unless you publish as GPL too).

GPL does not allow you to modify the GPL code and make the changes proprietary, so you cannot use GPL code in your non-GPL projects.

If you wish to integrate this software into your commercial software package, or you are a corporate entity with more than 10 employees, then you should obtain a per-instance license, or a site-wide license, from http://jpelectron.com/buy

For all other use cases please consider: <a href='https://ko-fi.com/C0C54S4JF' target='_blank'><img height='36' style='border:0px;height:36px;' src='https://cdn.ko-fi.com/cdn/kofi2.png?v=2' border='0' alt='Buy Me a Coffee at ko-fi.com' /></a>
    
[End of Line]
