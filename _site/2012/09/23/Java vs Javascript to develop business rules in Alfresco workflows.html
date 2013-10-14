While Javascript Server Side may seem easier, it's a real mess to debug. So, I clearly prefer to use Java which avoid this kind of problems thanks to JPDA.

For example, use the following javascript snippet into a transition in an Alfresco Workflow based on jBPM (and generated with SIDE to make thinks a lot easier):

var node =bpm_package.children[0];

var destination = node.parent.parent.childByNamePath("achieved");

if (node.shortType == 'YAMMA:com_bluexml_side_yamma_OutgoingMail') {
        destination = destination.childByNamePath("mail");
} else if (node.shortType == 'YAMMA:com_bluexml_side_yamma_Invoice') {
        destination = destination.childByNamePath("invoice");
} else if (node.shortType == 'YAMMA:com_bluexml_side_yamma_Quotation') {
        destination = destination.childByNamePath("quotation");
}

node.move(destination);
There is an error which is very difficult to diagnose if you don't know it. The error message just tells you that there is a '}' missing at the 3rd line of your script. Well, in fact, nothing's missing! You must just type node.shortType instead of node.typeShort to make things working smoothly!

You can try to activate the javascript debugger but it won't be very useful because once loaded, the javascript code corresponding to your transition appears on one line. So debugging step by step is not very efficient.

What a difference with Java in which you have tools, mature and well tested, to help you to develop the code you need.

Thanks to JPDA, it's really easy.
