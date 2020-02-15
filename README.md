# FileWatcherNew
File Watcher for Multiple Files
Step One: Install SrvStart
To run an app as a service, you’re going to need a small, third-party utility. There are several out there, but our favorite is SrvStart. It was originally designed for Windows NT, and will work with just about any version of Windows from Windows XP on up.

To get started, head over to the SrvStart download page and grab the utility. The download contains just four files (two DLL and two EXE files). There’s no installer; instead, copy these to your computer’s C:\Windows folder these to your main Windows folder to “install” SrvStart.



We’re also going to assume that you’ve already installed and set up whatever program you’re going to turn into a service, but if you haven’t, now would be a good time to do that too.

Step Two: Create a Configuration File for the New Service
Next, you’ll want to create a configuration file that SrvStart will read to create the service. There’s a lot you can do with SrvStart, and you can read the full details on all the configuration options on the documentation page. For this example, we are only going to use two commands: startup, which specifies the program to launch, and shutdown_method, which tells SrvStart how to close the program when the respective service is stopped.

Fire up Notepad and create your configuration file using the format below. Here, we’re using Plex, but you can create a file for any program you want to run as a service. The startup command simply specifies the path where the executable file resides. For the shutdown_method command, we’re using the winmessage parameter, which causes SrvStart to send a Windows close message to any windows opened by the service.

[Plex]
startup="C:\Program Files (x86)\Plex\Plex Media Server\Plex Media Server.exe"
shutdown_method=winmessage
Obviously, adjust the path and name according to the program you’re launching.

aas_1_v2

Save the new configuration file wherever you like, and replace the .txt extension with a .ini extension. Make note of the file name, since we’ll need it in the next step. For ease of typing at the Command Prompt, we suggest saving this file temporarily right on your C: drive.

Step Three: Use the Command Prompt to Create the New Service
Your next step is using the Windows Service Controller (SC) command to create the new service based on the criteria in your configuration file. Open Command Prompt by right-clicking the Start menu (or pressing Windows+X), choosing “Command Prompt (Admin)”, and then clicking Yes to allow it to run with administrative privileges.

tl_start

At the Command Prompt, use the following syntax to create the new service:

SC CREATE <servicename> Displayname= "<servicename>" binpath= "srvstart.exe <servicename> -c <path to srvstart config file>" start= <starttype>
There are a couple of things to note in that command. First, each equal sign (=) has a space after it. That’s required. Also, the <servicename> value is entirely up to you. And, finally, for the <starttype> value, you’ll want to use auto so that the service starts automatically with Windows.

So in our Plex example, the command would look like this:

SC CREATE Plex Displayname= "Plex" binpath= "srvstart.exe Plex -c C:PlexService.ini" start= auto
Yes, you read that right: I used C:PlexService.ini instead of C:\PlexService.ini . The command requires you to remove the slash.

When you run the command, you should receive a SUCCESS message if everything goes well.

aas_2

From this point on, your new service will run whenever Windows starts. If you open the Windows Services interface (just click Start and type “Services”), you can find and configure the new service just like you would any other.

aas_3

And that’s all there is to it. If you have apps that start with Windows and you’d rather they start without needing a user to log in, it’s easy enough to turn any app into a service. We’ve only just touched on the basic method for creating and running a new service, but there’s a lot more you can do with SrvStart to fine tune how a service runs. Be sure to check out the documentation if you’d like to learn more.
