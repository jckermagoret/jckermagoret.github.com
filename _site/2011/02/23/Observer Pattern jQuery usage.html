If I take the example back, I just have to add the js corresponding to jQuery. I finally get the following html page:

<html>
<head>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
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
I now add the event mechanism through the use of the bind and trigger functions.

The bind action takes 2 arguments:

the event name
the function to call
The following code snippet will make the contentPortlet listen to the info event:

doc.bind('info', contentPortlet);
An event is triggered by simply calling the trigger action with the event name, with optional parameters:

doc.trigger('info', 'View Updated Through The Old Way');
        <script type="text/javascript">

                var doc = $(document); // just a shortcut

                var contentPortlet = function(event, message) {
                        // replace the content div by the message received
                        // when the event has been triggered
                        $('#content').html('Content ' + message);
                }

                var metadataPortlet = function(event, message) {
                        // replace the metadata div by the message received
                        // when the event has been triggered
                        $('#metadata').html('Metadata ' + message);
                }

                doc.bind('info', contentPortlet);
                doc.bind('info', metadataPortlet);

                function ObserverWay() {
                        doc.trigger('info', 'View Updated Through The Old Way');
                }

        </script>
As you noticed, all these components are coupled in a very agile way. We could configure (bind) content and metadata portlets so they listen to other events.