Let's take our previous code and replace jQuery mechanism by dojo:

replace jquery lib by dojo lib
replace bind by subscribe
replace trigger by publish
replace jquery sugar by dojo one
Then transform the parameter passed when the trigger is fired as an array:

'View Updated Through The Old Way' becomes 'View Updated Through The Old Way'
and remove the event from the content and metadata portlet. You don't need them anymore. If required, you can forward them in the parameters when the event is triggered.

You now have the following code:

<html>
<head>
        <script src="https://ajax.googleapis.com/ajax/libs/dojo/1.5/dojo/dojo.xd.js"></script>

        <script type="text/javascript">

                var doc = document;

                var contentPortlet = function(message) {
                        dojo.byId("content").innerHTML = 'Content ' + message;
                }

                var metadataPortlet = function(message) {
                        dojo.byId("metadata").innerHTML = 'Metadata ' + message;
                }

                dojo.subscribe('info', contentPortlet);
                dojo.subscribe('info', metadataPortlet);

                function OldWay() {
                   var content = document.getElementById('content');
                   var metadata = document.getElementById('metadata');

                   content.innerHTML = "Content View Updated Through The Old Way";
                   metadata.innerHTML = "Metadata View Updated Through The Old Way";
                }

                function ObserverWay() {
                        dojo.publish('info', ['View Updated Through The Old Way']);
                }

        </script>

</head>
<body>
        <div id="menu">
                        <h1>Menu</h1>
                <ul>
                        <li><a href="javascript:OldWay()">Old way</a></li>
                        <li><a href="javascript:ObserverWay()">Observer way</a></li>
                </ul>
        </div>
        <div id="contentPortlet">
                <h1>Content</h1>
                <div id="content"></div>
        </div>
        <div id="metadataPortlet">
                <h1>Detail</h1>
                <div id="metadata"></div>
        </div>
</body>
</html>
Any comments?