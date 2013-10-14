Observer Pattern: The Graal of The Developer

In a very few words, this pattern enables to build agile software architecture by decoupling objects which produce information and objects which consume it. For example, it is really useful to update user interfaces after an event happens.

First, we're going to deal with a very simple use case and provide a solution without and with this pattern (based on an algorithmic solution) to describe the problem
Then, we'll provide a concrete solution in jQuery, Dojo and Y!UI to be able to compare them
Then, we'll suggest a unified approach so we can use observer mechanism in an application with all these 3 frameworks. This solution can be extended to use other frameworks too.
At last, we'll conclude with a few thoughts about server-side observer implementation like Cometd
This approach will finally be used at the end of the tutorial to customize the metadata component of the document details page in Alfresco Share.

The Use Case

Let's imagine we have 3 components in an html page. These components are 3 divs named menu, content and details. We have in the menu an action to update menu and details:

<html>
<body>
        <div id="menu">
                <ul>
                        <li><a href="javascript:OldWay()">Old way</a></li>
                        <li><a href="javascript:ObserverWay()">Observer way</a></li>
                </ul>
        </div>
        <div id="content">Content</div>
        <div id="metadata">Detail</div>
</body>
</html>
The solution without Observer Pattern

To achieve the requirements, you would write the OldWay javascript function like that:

function OldWay() {

   var content = document.getElementById('content');
   var metadata = document.getElementById('metadata');
   content.innerHTML = "Content View Updated Through The Old Way";
   metadata.innerHTML = "Metadata View Updated Through The Old Way";
   alert("Success");
}

This solution works very well but as you noticed, the OldWay function must know the components to update. It is a very annoying point. Our components are strongly coupled: it's a very bad design.

The Observer Pattern Based Solution

The following lines are not true code, rather alogrithmic ones.

function ObserverWay() {

   Publish("/info", "update")
}

function UpdateContent() {

   content.innerHTML = "Content Updated Through The Old Way";
}

function UpdateMetadata() {

   content.innerHTML = "Content Updated Through The Old Way";
}

Subscribe("/info", UpdateContent()); Subscribe("/info", UpdateMetadata());

We now have 3 functions, completely independant:

one publisher, ObserverWay, which produces some information
two consumers, UpdateContent and UpdateMetadata, which consume information
The communication beetween producers and consumers is done through the info channel on which the first publishes some information while the others subscribe (or listen) to it.

In this architecture, if we add a new component, it just has to subscribe to the channels it is interested with, without disturbing the architecture.

We'll see tomorrow the unified approach I suggest to use.