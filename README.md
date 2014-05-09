# skype-notify

A simple bash script for displaying skype notifications via libnotify and your notification deamon.  
An example with "dunst":  
![dunst.jpg](img/dunst.jpg)


## Usage

1. Realise that you still need skype and mourn silently for 10 seconds.

2. Clone this repo somewhere.  
`git clone https://github.com/lathan/skype-notify.git`

3. Open skype. Go to "options" (`CTRL+o`). Select the "Notifications" tab. Click "Advanced View"

4. Check the box that says "Execute the following script on any event:". In it's input field you need to enter the following:  
`<path_to_script>/skype-notify.sh "%type" "%sskype" "%sname" "%smessage" "%fname" "%fpath" "%fsize`  
So, if for example you cloned this repo inside `~/git`, the above should look like:  
`~/git/skype-notify/skype-notify.sh "%type" "%sskype" "%sname" "%smessage" "%fname" "%fpath" "%fsize"`

5. From the list of notifications, select "Chat Message Received", press "Test Event". You should now see a notification pop up in your environment's native notification daemon. Bellow is an artist's rendition of what that might look like.  
![screenshot.jpg](img/screenshot.jpg)

6. Optionally, disable skype's pop-up notifications for events that you only want to be displayed by `skype-notify`.

7. Skype has now been made less terrible. Rejoice at this realization.
