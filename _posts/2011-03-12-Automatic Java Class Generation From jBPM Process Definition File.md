Goal

This page explains how to automatically add action in a jBPM workflow and generate the corresponding java class from a jBPM processdefinition file for each added action. At the end, you'll have a java class with a method for each action in transitions and events. The methods only contain a log statement at first. You then can inherit from it and customize the code if you want.

Solution

The solution is achieved in 2 steps:

add a java action for each transition and event
generate the java class with a method for each action
ADD A JAVA ACTION FOR EACH TRANSITION AND EVENT

This is done through this xsl code snippet extracted from this xsl stylesheet.

        <xsl:template match="transition|event">
                <xsl:element name="{name()}">
                        <xsl:copy-of select="@*"/>
                        <xsl:choose>
                                <xsl:when test="not(action)
                                                                or (action and $replaceActions = 'true')">
                                        <action>
                                                <xsl:apply-templates select=".//script"/>
                                        </action>
                                </xsl:when>
                                <xsl:otherwise>
                                        <xsl:apply-templates/>
                                </xsl:otherwise>
                        </xsl:choose>
                </xsl:element>
        </xsl:template>
/
GENERATE THE JAVA CLASS WITH A METHOD FOR EACH ACTION

This is done through this xsl code snippet extracted from this xsl stylesheet.

        <xsl:template name="create-java-class">
                <xsl:param name="package"/>
                <xsl:param name="class"/>

package <xsl:value-of select="$package"/>;

import org.sidelabs.workflow.SIDEActionHandler;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class <xsl:value-of select="$class"/> extends SIDEActionHandler {

        private static final long serialVersionUID = 1L;
        private static Log logger = LogFactory.getLog(<xsl:value-of select="$class"/>.class);

        /**
         * Transitions
         */
        <xsl:apply-templates select=".//transition"/>

        /**
         * Events
         */
        <xsl:apply-templates select=".//event"/>

}
        </xsl:template>
Action

An ant script is provided in the SIDE-deployer project. Java classes will be stored into the provided package. The class name is based on the name of the workflow. Don't forget to capitalize your workflow name in your SIDE model!

BUILD JAVA CLASSES (AND REPLACE EXISTING ACTIONS)

Java classes will be stored into the provided package. The class name is based on the name of the workflow. Don't forget to capitalize your workflow name in your SIDE model!

./build.sh improve-workflows \ -Dworkflow.action.package="org.sidelabs.is.operational.workflow" -DuseProcessDefinitionName="true" -DreplaceActions="true"
CHOOSE THE NAME OF THE MAIN CLASS IF REQUIRED

./build.sh improve-workflows \
  -Dworkflow.action.package="org.sidelabs.is.operational.workflow"
  -Dworkflow.action.class="Dispatch"
CHOOSE NOT TO REPLACE ALREADY EXISTING ACTIONS

./build.sh improve-workflows \
  -Dworkflow.action.package="org.sidelabs.is.operational.workflow"
  -useProcessDefinitionName="true"
  -DreplaceActions="true"
Conclusion

You get the following java class:

package org.sidelabs.is.operational.workflow;

import org.sidelabs.workflow.SIDEActionHandler;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class Yamma extends SIDEActionHandler {

        private static final long serialVersionUID = 1L;
        private static Log logger = LogFactory.getLog(Yamma.class);

        /**
         * Transitions
         */

                /**
                  * @param none
                  *
                  * @return void
                  **/
                public void initialize() {
                        logger.debug("Processing: initialize");
                }

                /**
                  * @param none
                  *
                  * @return void
                  **/
                public void checkQuality() {
                        logger.debug("Processing: checkQuality");
                }

                /**
                  * @param none
                  *
                  * @return void
                  **/
                public void accountingIsNOK() {
                        logger.debug("Processing: accountingIsNOK");
                }

                /**
                  * @param none
                  *
                  * @return void
                  **/
                public void accountingIsOK() {
                        logger.debug("Processing: accountingIsOK");
                }

                /**
                  * @param none
                  *
                  * @return void
                  **/
                public void legalIsNOK() {
                        logger.debug("Processing: legalIsNOK");
                }

                /**
                  * @param none
                  *
                  * @return void
                  **/
                public void legalIsOK() {
                        logger.debug("Processing: legalIsOK");
                }

                /**
                  * @param none
                  *
                  * @return void
                  **/
                public void finish1() {
                        logger.debug("Processing: finish1");
                }

                /**
                  * @param none
                  *
                  * @return void
                  **/
                public void finish2() {
                        logger.debug("Processing: finish2");
                }

                /**
                  * @param none
                  *
                  * @return void
                  **/
                public void retry() {
                        logger.debug("Processing: retry");
                }

                /**
                  * @param none
                  *
                  * @return void
                  **/
                public void decision2() {
                        logger.debug("Processing: decision2");
                }

                /**
                  * @param none
                  *
                  * @return void
                  **/
                public void termination() {
                        logger.debug("Processing: termination");
                }

                /**
                  * @param none
                  *
                  * @return void
                  **/
                public void accounting() {
                        logger.debug("Processing: accounting");
                }

                /**
                  * @param none
                  *
                  * @return void
                  **/
                public void legal() {
                        logger.debug("Processing: legal");
                }

        /**
         * Events
         */

                /**
                  * @param none
                  *
                  * @return void
                  **/
                public void onEnteringNodeMove() {
                        logger.debug("Processing: onEnteringNodeMove");
                }

                /**
                  * @param none
                  *
                  * @return void
                  **/
                public void onEnteringNodeTermination() {
                        logger.debug("Processing: onEnteringNodeTermination");
                }

                /**
                  * @param none
                  *
                  * @return void
                  **/
                public void onEnteringNodeError() {
                        logger.debug("Processing: onEnteringNodeError");
                }

}
 HTH