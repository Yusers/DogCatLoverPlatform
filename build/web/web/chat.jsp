<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style media="screen" type="text/css">

            .chat {
                width: 100%;
                height: 200px;
                border: 1px solid silver;
                overflow-y: scroll;
            }

            #msg {
                width: 99%;
            }

            h1 {
                text-align: center;
            }

            .my-message {
                text-align: right;
                background-color: #cceeff; /* Light blue for your messages */
                border-radius: 10px;
                padding: 5px 10px;
                margin: 5px 0;
            }

            .other-message {
                text-align: left;
                background-color: #f0f0f0; /* Light gray for others' messages */
                border-radius: 10px;
                padding: 5px 10px;
                margin: 5px 0;
            }

        </style>
    </head>
    <script type="text/javascript">
        var wsUrl;
        if (window.location.protocol == 'http:') {
            wsUrl = 'ws://';
        } else {
            wsUrl = 'wss://';
        }
        var ws = new WebSocket(wsUrl + window.location.host + "/DogCatLoverPlatform/chat");
        var username = prompt("Please enter your name:");

        ws.onmessage = function (event) {
            var messageData = JSON.parse(event.data);
            var sender = messageData.sender;
            var message = messageData.message;
            var mySpan = document.getElementById("chat");
            var messageElement = document.createElement('div');
            if (sender === username) {
                messageElement.classList.add('my-message');
            } else {
                messageElement.classList.add('other-message');
            }
            messageElement.innerHTML = '<strong>' + sender + ':</strong> ' + message;
            mySpan.appendChild(messageElement);
        };

        ws.onerror = function (event) {
            console.log("Error ", event);
        }

        function sendMsg() {
            var msg = document.getElementById("msg").value;
            if (msg) {
                var messageData = {
                    sender: username,
                    message: msg
                };
                ws.send(JSON.stringify(messageData));
            }
            document.getElementById("msg").value = "";
        }

    </script>
    <body>
        <h1>Live Chat updates</h1>

        <div>
            <div id="chat" class="chat"></div>
            <div>
                <input type="text" name="msg" id="msg" placeholder="Enter message here"/>
                <button onclick="return sendMsg();">Enter</button>
            </div>
        </div>
    </body>
</html>
