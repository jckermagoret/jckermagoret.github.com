The document-details page is defined in the page directory located $TOMCAT/webapps/share/WEB-INF/classes/alfresco/site-data/pages/document-details.xml:

<?xml version='1.0' encoding='UTF-8'?>
<page>
   <title>Document Details</title>
   <title-id>page.documentDetails.title</title-id>
   <description>Document details</description>
   <description-id>page.documentDetails.description</description-id>
   <template-instance>document-details</template-instance>
   <authentication>user</authentication>
</page>
This page uses the document-details template as indicated, located at $TOMCAT/webapps/share/WEB-INF/classes/alfresco/site-data/template-instances/document-details.xml

<?xml version='1.0' encoding='UTF-8'?>
<template-instance>
   <template-type>org/alfresco/document-details</template-type>
   <properties>
      <pageFamily>documentlibrary</pageFamily>
      <container>documentLibrary</container>
   </properties>
</template-instance>
The document-details page is the result of the agregation of the (take a deep breath :-) $TOMCAT/webapps/share/WEB-INF/classes/alfresco/templates/org/alfresco/document-details.ftl which looks like this for its most important part:

<div>
    <div>
        <@region id=doclibType + "document-metadata-header" scope="template" protected=true />
        <@region id=doclibType + "document-metadata" scope="template" protected=true />
        <@region id=doclibType + "document-info" scope="template" protected=true />
        <@region id=doclibType + "document-versions" scope="template" protected=true />
    </div>
    <div>
        <@region id=doclibType + "document-actions" scope="template" protected=true />
        <@region id=doclibType + "document-links" scope="template" protected=true />
        <#if doclibType?starts_with("dod5015")>
            <@region id=doclibType + "document-references" scope="template" protected=true />
        </#if>
    </div>
</div>
The only part a little strange is that the core of this page, consisting of the metadata is not processed the same way, which would make customization a lot easier. Instead of that, they use the form component to render the document metadata. Maybe to provide inline update later, but for the moment, I just want to render my metadata and I prefer to have a consistent way to do this.

So, I replaced the:

<@region id=doclibType + "document-metadata" scope="template" protected=true />
by:

<@region id=doclibType + "document-metadata-core" scope="template" protected=true />
and then defined the corresponding template, webscript and component.

First, indicate the component to use when the document-metadata-core region is used from the document-details template. This happens in $TOMCAT/share/WEB-INF/classes/alfresco/site-data/components/template.document-metadata-core.document-details.xml:

<?xml version='1.0' encoding='UTF-8'?>
<component>
   <scope>template</scope>
   <region-id>document-metadata-core</region-id>
   <source-id>document-details</source-id>
   <url>/components/document-details/document-metadata-core</url>
</component>
Second, define $TOMCAT/webapps/share/WEB-INF/classes/alfresco/site-webscripts/org/alfresco/components/document-details/document-metadata-core.get.(desc|head|html).xml files with the following content: 2.1: document-metadata-core.get.desc.html:

<webscript>
  <shortname>document-metadata-core</shortname>
  <description>Document Metadata Core Component</description>
  <url>/components/document-details/document-metadata-core</url>
</webscript>
2.2: document-metadata-core.get.head.html:

<#include "../component.head.inc">
<!-- Document Metadata Header -->
<@link rel="stylesheet" type="text/css" href="${page.url.context}/components/document-details/document-metadata-core.css" />
<@script type="text/javascript" src="${page.url.context}/components/document-details/document-metadata-core.js"></@script>
2.3: document-metadata-core.get.html:

<script type="text/javascript">//<![CDATA[
   new Alfresco.DocumentMetadataCore("${args.htmlid}").setMessages(${messages});
//]]></script>
<div id="metadata-core">
   <div>${msg("document-metadata-core.heading")}</div>
   <h1>>Woooh, juste un peu de texte :-)</h1>
</div>
Lastly, we define $TOMCAT/webapps/share/components/document-details/document-metadata-core.js which will be compressed in document-metadata-core-min.js later:

/**
 * Document metadata-core component.
 *
 * @namespace Alfresco
 * @class Alfresco.DocumentMetadataCore
 */
(function()
{
   var Dom = YAHOO.util.Dom;
   var $html = Alfresco.util.encodeHTML;

   /**
    * DocumentMetadataCore constructor.
    *
    * @param {String} htmlId The HTML id of the parent element
    * @return {Alfresco.DocumentMetadataCore} The new DocumentMetadataCore instance
    * @constructor
    */
   Alfresco.DocumentMetadataCore = function(htmlId)
   {
      Alfresco.DocumentMetadataCore.superclass.constructor.call(this, "Alfresco.DocumentMetadataCore", htmlId);*/

      /* Decoupled event listeners */
      YAHOO.Bubbling.on("documentDetailsAvailable", this.onDocumentDetailsAvailable, this);

      return this;
   };

   YAHOO.extend(Alfresco.DocumentMetadataCore, Alfresco.component.Base,
   {
      onDocumentDetailsAvailable: function DocumentMetadataCore_onDocumentDetailsAvailable(layer, args)
      {
      // Just write your code there
      }
   });
})();
Through the use of bubbling (kind of Observer pattern), the document-details page updates when the "documentDetailsAvailable" event fires and the method above is played thanks to the following line:

YAHOO.Bubbling.on("documentDetailsAvailable", this.onDocumentDetailsAvailable, this);