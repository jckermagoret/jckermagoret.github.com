We have seen in the previous posts how to use Observer Pattern in dojo and jQuery. But first, why do we bother at building such a unified solution?

Why such a requirement?

I have 2 main reasons:

I can use it the same way whatever the context I am in. I don't want to remember the specific syntax for a specific framework. It makes code understandability easier.
I can work simultaneously with various frameworks.
For example, in Alfresco Share, I wrote a code snippet to use dojo in the document-details view to extend the way meta data are displayed in a more friendly UI. But this extension uses dojo and Alfresco Share is based on Y!UI. So I need to interact from Y!UI with dojo and vice-versa. Architecture may evolve and I could need to interact with jquery components, so such an Observer implementation may help.

In short:

one publish will forward the publish on all the available Observer implementation
one subscribe will subscribe the component on all the available Observer implementation
Moreover by this way I can add specific code for debugging purposes.

Observer Implementation

Observer = {
        log: new log4javascript.getLogger("SIDE.Observer"),

        subscribe: function(channel, subscriber) {
                if (Observer.log.isDebugEnabled()) {
                        Observer.log.debug("Observer - Subscribing");
                        Observer.log.debug("Channel : " + channel);
                }
                // Dojo
                dojo.subscribe(channel, subscriber);
                // jQuery
                document.bind(channel, subscriber);
                // Y!UI, ExtJS, ...
        },

        publish: function(channel, message) {
                if (Observer.log.isDebugEnabled()) {
                        Observer.log.debug("Observer - Publishing");
                        Observer.log.debug("Channel : ", channel);
                        Observer.log.debug("Message : ", message[0]);
                }
                // Dojo
                dojo.publish(channel, message);
                // jQuery
                document.trigger(channel, message);
                // Y!UI, ExtJS, ...
        }
}
For the use of log4javascript, please refer to my previous post.

Any comments?