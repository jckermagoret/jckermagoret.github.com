When you want to develop in javascript, you look for usual tools in programing languages. One of the best tool in Java is log4j. It's a tool to help developers to insert information in their code and display this information according the configuration. I t means you may have test and production configuration without the need to change anything.

I gave a glimpse to google about javascript and logging and it gave me back 2 answers which seem of interest. It was:

log4js
log4javascript
I first gave a try to log4js because of its name, very similar to the log4j for Java. Unfortunately, it didn't work correctly with my javascript application, because of a conflict.

I didn't go further and tried log4javascript. It worked immediately like a charm. Here is the magic lines. Just add the following at the top of your html page:

        <script type="text/javascript" src="/resources/common/js/misc/log4javascript.js"></script>

                        log4javascript.setEnabled(true);
                        var pua = new log4javascript.PopUpAppender();
                        log4javascript.getDefaultLogger().addAppender(pua);
                        log4javascript.getLogger("SIDE.Observer").addAppender(pua);
                        log4javascript.getLogger("SIDE.Tree").addAppender(pua);

                        // You can define explicitely a var to set the log level
                        var lsa = log4javascript.getLogger("SIDE.Authenticate");
                        lsa.setLevel(log4javascript.Level.INFO);
                        lsa.addAppender(pua);
                        log4javascript.getLogger("SIDE.Util").addAppender(pua);
                        log4javascript.getLogger("SIDE.Preview").addAppender(pua);

As stated in the code, you can define explicitely a var to set the log level.

It works very well and the log window does the job.

To conclude, log4js would certainly do the job but for any reasons, it didn't when I tried. Nevermind, these tools are mature and they work the same way, so don't be worry. Take the one that does the job for you the fastest.