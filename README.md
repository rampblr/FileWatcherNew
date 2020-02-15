# FileWatcherNew
File Watcher for Multiple Files
<div class="entry-content e-content">
<p><a href="https://www.howtogeek.com/wp-content/uploads/2016/05/aas_top.png" rel="attachment wp-att-253540"><img class="alignnone size-large wp-image-253540" alt="aas_top" width="650" height="300" src="https://www.howtogeek.com/wp-content/uploads/2016/05/aas_top-650x300.png" onerror="this.onerror=null;pagespeed.lazyLoadImages.loadIfVisibleAndMaybeBeacon(this);"></a></p>
<p>If you’re like most Windows users, you have lots of great little utilities that run when you start Windows. While this works great for most apps, there are some that would be nice to start even before a user logs in to the PC. To do this, you’ll need to run the app as a Windows service.</p>
<div id="purch_N_C_0_1"><script type="text/javascript" data-pagespeed-no-defer="">pagespeed.lazyLoadImages.overrideAttributeFunctions();</script><script>tmntag.cmd.push(function(){tmntag.adTag('purch_N_C_0_1', false);});</script></div>	<div style="clear:both"></div>
<p><a href="https://www.howtogeek.com/school/using-windows-admin-tools-like-a-pro/lesson8/">Windows services</a> are a special class&nbsp;of programs&nbsp;that are configured to launch and run in the background, usually without any sort of user interface and without needing a user to log in to the PC. Many gamers and power users know them as those things you used to disable to help speed up your system, though <a href="https://www.howtogeek.com/252969/should-you-disable-windows-services-to-speed-up-your-pc/">that’s really not necessary any more</a>.</p>
<p>The primary advantage of running an app as a service&nbsp;is that you can have a program start before&nbsp;a user to log in. That can be particularly important with apps that provide important services you want to be available when you’re away from your computer.</p>
<p><strong>RELATED:</strong> <a href="https://www.howtogeek.com/school/using-windows-admin-tools-like-a-pro/lesson8/"><strong><em>Understanding and Managing Windows Services</em></strong></a></p>
<p>A perfect example of this is <a href="https://www.howtogeek.com/252261/how-to-set-up-plex-and-watch-your-movies-on-any-device/">Plex</a>, a media server app that can stream local content to just about any device you own. Sure, you could let it sit in the system tray like a normal program, but what if the computer restarts due to a power outage or scheduled updates?&nbsp;Until you log back in on the PC, Plex wouldn’t be&nbsp;available. That’s irritating if you have to run to another room to start Plex back up while your popcorn gets cold, and super irritating if you’re out of town and trying to stream your media over the Internet. Setting up Plex as a Service would solve that problem.</p>
<p>Before getting started, you should be aware of a couple of&nbsp;important caveats to running an app as a service:</p>
<ul>
<li>The app will not put an icon in the system tray. If you need the interface available regularly for an app, it may not be best suited to run as a service.</li>
<li>When you need to make configuration changes or updates, you’ll need to stop the service, run the program as a regular app, do what you need to do, stop the program, and then start the service again.</li>
<li>If the program is already set up to run when Windows starts, you’ll need to disable that so that you don’t end up with two instances running. Most programs have an option in the interface for toggling this setting. Others may add themselves to your <a href="https://www.howtogeek.com/228467/how-to-make-a-program-run-at-startup-on-any-computer/">Startup folder</a>, so you can remove them there.</li>
</ul>
<p>Ready to roll? Let’s talk about how to set it up.</p>
<h2>Step One: Install SrvStart</h2>
<p>To run an app as a service, you’re going to need a small, third-party utility. There are several out there, but our favorite is <a href="http://www.rozanski.org.uk/software">SrvStart</a>. It was originally designed for Windows NT, and will work with just about any version of Windows from Windows XP on up.</p>
<p>To get started, head over to the <a href="http://www.rozanski.org.uk/software">SrvStart download page</a> and grab the utility. The download contains just four files (two DLL and two EXE files). There’s no installer; instead, copy&nbsp;these to your computer’s <code>C:\Windows</code> folder&nbsp;these to&nbsp;your main Windows folder to “install” SrvStart.</p>
<p><a href="https://www.howtogeek.com/wp-content/uploads/2016/05/aas_4.png" rel="attachment wp-att-253555"><img class="alignnone size-large wp-image-253555" alt="aas_4" width="650" height="300" src="https://www.howtogeek.com/wp-content/uploads/2016/05/xaas_4-650x300.png.pagespeed.gp+jp+jw+pj+ws+js+rj+rp+rw+ri+cp+md.ic.FclyL3d6K9.png" onerror="this.onerror=null;pagespeed.lazyLoadImages.loadIfVisibleAndMaybeBeacon(this);"></a></p>
<p>We’re also going to assume that you’ve already installed and set up whatever program you’re going to turn into a service, but if you haven’t, now would be a good time to do that too.</p>
<h2>Step Two:&nbsp;Create a Configuration File for the New Service</h2>
<p>Next, you’ll want to&nbsp;create a configuration file&nbsp;that&nbsp;SrvStart will read to create the service. There’s a lot you can do with SrvStart, and you can read the full details on all the configuration options on the <a href="http://rozanski.org.uk/services">documentation page</a>. For this example, we are only going to use two commands: <code>startup</code>, which specifies the program to launch, and <code>shutdown_method</code>, which tells SrvStart how to close the program when the respective service is stopped.</p>
<script type="text/javascript" data-pagespeed-no-defer="">pagespeed.lazyLoadImages.overrideAttributeFunctions();</script><script async="" src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<div class="htg-lazyload">
<ins class="adsbygoogle" style="display:block; text-align:center;" data-ad-format="fluid" data-ad-layout="in-article" data-ad-client="ca-pub-9173525300015284" data-ad-slot="7675409007"></ins>
</div>	<div style="clear:both"></div>
<p>Fire up Notepad and create your configuration file using the format below. Here, we’re using Plex, but you can create a file for any program you want to run as a service. The <code>startup</code> command simply specifies the path where the executable file resides. For the <code>shutdown_method</code> command, we’re using the <code>winmessage</code> parameter, which causes SrvStart&nbsp;to send a Windows close message to any windows opened by the service.</p>
<pre>[Plex]
startup="C:\Program Files (x86)\Plex\Plex Media Server\Plex Media Server.exe"
shutdown_method=winmessage</pre>
<p>Obviously, adjust the path and name according to the program you’re launching.</p>
<p><a href="https://www.howtogeek.com/wp-content/uploads/2016/05/aas_1_v2.png" rel="attachment wp-att-253534"><img class="alignnone size-large wp-image-253534" alt="aas_1_v2" width="650" height="198" src="https://www.howtogeek.com/wp-content/uploads/2016/05/xaas_1_v2-650x198.png.pagespeed.gp+jp+jw+pj+ws+js+rj+rp+rw+ri+cp+md.ic.v4MnYQ5Yle.png" onerror="this.onerror=null;pagespeed.lazyLoadImages.loadIfVisibleAndMaybeBeacon(this);"></a></p>
<p>Save the new configuration file wherever you like, and replace the .txt extension with a .ini extension. Make note of the file name, since we’ll need it in the next step. For ease of typing at the Command Prompt, we suggest saving this file&nbsp;temporarily right on your C: drive.</p>
<h2>Step Three: Use the Command Prompt to Create the New Service</h2>
<p>Your&nbsp;next step is using the Windows Service Controller (SC) command to create the new service based on the criteria in your configuration file.&nbsp;Open Command Prompt by right-clicking the Start menu (or pressing Windows+X), choosing “Command Prompt (Admin)”, and then clicking Yes to allow it to run with administrative privileges.</p>
<p><a href="https://www.howtogeek.com/wp-content/uploads/2016/05/tl_start.png" rel="attachment wp-att-253532"><img class="alignnone size-full wp-image-253532" alt="tl_start" width="325" height="638" src="https://www.howtogeek.com/wp-content/uploads/2016/05/xtl_start.png.pagespeed.gp+jp+jw+pj+ws+js+rj+rp+rw+ri+cp+md.ic.xfg3Eu2IXg.png" onerror="this.onerror=null;pagespeed.lazyLoadImages.loadIfVisibleAndMaybeBeacon(this);"></a></p>
<p>At the Command Prompt, use the following syntax to create the new service:</p>
<pre>SC CREATE &lt;servicename&gt; Displayname= "&lt;servicename&gt;" binpath= "srvstart.exe &lt;servicename&gt; -c &lt;path to srvstart config file&gt;" start= &lt;starttype&gt;</pre>
<p>There are a couple of things to note in that command. First, each equal sign (=) has a space after it. That’s&nbsp;required. Also, the <code>&lt;servicename&gt;</code> value is&nbsp;entirely up to you. And, finally, for the <code>&lt;starttype&gt;</code> value, you’ll want to use <code>auto</code> so that the service starts automatically with Windows.</p>
<p>So in&nbsp;our Plex example, the command would look like this:</p>
<pre>SC CREATE Plex Displayname= "Plex" binpath= "srvstart.exe Plex -c C:PlexService.ini" start= auto</pre>
<p>Yes, you read that right: I used <code>C:PlexService.ini</code> instead of <code>C:\PlexService.ini</code> . The command requires you to remove the slash.</p>
<p>When you run the command, you should receive a SUCCESS message if everything goes well.</p>
<p><a href="https://www.howtogeek.com/wp-content/uploads/2016/05/aas_2.png" rel="attachment wp-att-253537"><img class="alignnone size-large wp-image-253537" alt="aas_2" width="650" height="213" src="https://www.howtogeek.com/wp-content/uploads/2016/05/aas_2-650x213.png" onerror="this.onerror=null;pagespeed.lazyLoadImages.loadIfVisibleAndMaybeBeacon(this);"></a></p>
<p>From this point on, your new service will run whenever Windows starts. If you open the Windows Services interface (just click Start and type “Services”), you can find and configure the new service just like you would any other.</p>
<p><a href="https://www.howtogeek.com/wp-content/uploads/2016/05/aas_3.png" rel="attachment wp-att-253539"><img class="alignnone size-large wp-image-253539" alt="aas_3" width="650" height="384" src="https://www.howtogeek.com/wp-content/uploads/2016/05/xaas_3-650x384.png.pagespeed.gp+jp+jw+pj+ws+js+rj+rp+rw+ri+cp+md.ic.h3d3KQ86Jr.png" onerror="this.onerror=null;pagespeed.lazyLoadImages.loadIfVisibleAndMaybeBeacon(this);"></a></p>
<p>And that’s all there is to it. If you have apps that start with Windows and you’d rather they start without needing a user to log in, it’s easy enough to turn any app into a service. We’ve only just touched on the basic method for creating and running a new service, but there’s a lot more you can do with SrvStart to fine tune how a service runs. Be sure to check out the documentation if you’d like to learn more.</p>
<style>
			body #primary .entry-content ul#nextuplist {list-style-type: none;margin-left:0px;padding-left:0px;}
			body #primary .entry-content ul#nextuplist li a {text-decoration:none;color:#1d55a9;}
		</style>
<div class="nextup">
<span id="nextuplabel" style="font-weight: bold;
					    font-size: 22px;
					    color: #000;
					    margin-bottom: 10px;
					    display: block;">READ NEXT</span>
<ul id="nextuplist">
<li>› <a href="https://www.howtogeek.com/509071/how-to-add-move-to-or-copy-to-to-windows-10s-context-menu/">How to Add “Move to” or “Copy to” to Windows 10’s Context Menu</a></li>
<li>› <a href="https://www.howtogeek.com/656879/no-cable-required-how-to-stream-the-nba-all-star-game/">No Cable Required: How to Stream the NBA All-Star Game</a></li>
<li>› <a href="https://www.howtogeek.com/657255/how-to-set-a-default-zoom-level-in-firefox/">How to Set a Default Zoom Level in Firefox</a></li>
<li>› <a href="https://www.howtogeek.com/529219/how-to-parse-json-files-on-the-linux-command-line-with-jq/">How to Parse JSON Files on the Linux Command Line with jq</a></li>
<li>› <a href="https://www.howtogeek.com/657476/the-future-of-phones-what-is-foldable-glass/">The Future of Phones: What Is Foldable Glass?</a></li>
</ul>
</div>
</div>
