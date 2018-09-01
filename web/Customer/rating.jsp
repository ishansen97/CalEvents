<!DOCTYPE html>
<html>
<head>
    <title>Facebook like Desktop Notification with HTML5</title>
</head>
<body style="background:#ccc;">
    <button id="n_perm">Notification Permission</button>
    <button id="n_trigger">Notification Trigger</button>
 
 
    <script type="text/javascript">
            var n_perm = document.getElementById("n_perm");
        var n_trigger = document.getElementById("n_trigger");
 
        n_perm.addEventListener("click", function(){
            //check notification is supported on your browser or not (IE Peoples)
            if(!window.Notification){
                alert("Desktop Notification are not supported.");
            }else{
                notificationRequest(); //request for desktop notification
            }
        });
 
        //trigger clicked
        n_trigger.addEventListener("click", function(){
            var desktopNot;
 
            console.log(Notification.permission);
 
            //check notification permission
            if(Notification.permission == "default"){
                notificationRequest(); //request for desktop notification
            }else if(Notification.permission == "denied"){
                alert("OOPS! You Blocked Desktop Notification. Please Allow to see the Demo");
            }else{
                //set a new notification
                desktopNot = new Notification("You Have a new Notification",{
                    body: "Facebook like desktop Notification system",
                    icon: "icon.png",
                    tag: '12345'
                });
 
                desktopNot.onclick = function(){
                    window.location = "?notification="+this.tag;
                }
            }
        });
 
 
        // ask for desktop notification permission function
        function notificationRequest(){
            Notification.requestPermission(function(permission){
                //log the permission in the console
                console.log(permission);
                //when permission is granted
                if(permission == "granted"){
                    alert("Hurrey! Desktop Notification Permission has been Allowed.");
                }else{
                    alert("OOPS! You Blocked Desktop Notification. Please Allow to see the Demo");
                }
            });
        }
    </script>
</body>
</html>