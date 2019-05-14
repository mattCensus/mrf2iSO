<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
   xmlns:gco="http://www.isotc211.org/2005/gco" xmlns:gfc="http://www.isotc211.org/2005/gfc"
   xmlns:gmd="http://www.isotc211.org/2005/gmd" xmlns:gmx="http://www.isotc211.org/2005/gmx"
   xmlns:gsr="http://www.isotc211.org/2005/gsr" xmlns:gss="http://www.isotc211.org/2005/gss"
   xmlns:gts="http://www.isotc211.org/2005/gts" xmlns:gml="http://www.opengis.net/gml/3.2"
   xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xs="http://www.w3.org/2001/XMLSchema"
   xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:fn="http://www.w3.org/2005/xpath-functions"
   xmlns:grp="http://www.altova.com/Mapforce/grouping"
   xmlns:mdb="http://www.isotc211.org/schemas/2012/mdb"
   xmlns:ci="http://www.isotc211.org/schemas/2012/ci" exclude-result-prefixes="fn grp xs xsi xsl xd"
   xmlns="http://www.isotc211.org/2005/gfc">
   
   
   
   <xsl:output method="xml" version="1.0" encoding="ISO-8859-1" indent="yes"/>
   <xsl:variable name="MetDate" select="//metadata/metainfo/metd"/>

   <xd:doc scope="stylesheet">
      <xd:desc>
         <xd:p>mrf2ISO/ISOKeywords.xsl</xd:p>
         <xd:p>called by the mrf2ISO/11_gmd_identificationInfo.xsl template</xd:p>
         <xd:p>XSLT stylesheet that transforms the values stored in the Theme_Keyword element that consist of one of the 12 ISO Topic categories the
            gmd:topicCategory/gmd:MD_TopicCategoryCode element. This stylesheet also corrects for inconsistencies between the GPMS and ISO standard. Examples of this
            inconsistency are the use of capitalization and the slash</xd:p>
         <xd:p><xd:b>Created on:</xd:b> Jan 7, 2014</xd:p>
         <xd:p><xd:b>Author:</xd:b> Matthew McCready</xd:p>
         <xd:p></xd:p>
      </xd:desc>
      <xd:ul>
         <xd:li>Template              Explanation                                                        </xd:li>
         <xd:li>ISO_TopicCategories   Handles the ISO Topic categories  for the identificationInformation</xd:li>
      </xd:ul>
      <xd:p>
         Initial   Date         Description
         MMC       1/8/2014     Modified to work on the MRF Format. 
         MMC       2/2/2015     Modified the if to work with version 2.0 
         MMC       7/2/2015     Modified the variable Themekey so that it work with only one variable at a time
      </xd:p>
   </xd:doc>

   <xsl:template name="ISO_TopicCategories">


      <xsl:for-each select="/MRF/Identification_Information/Keywords/Theme_ISO/Theme_Keyword">
         <!-- group-by="@gid1" -->




         <xsl:variable name="ThemeKey" select="."/>


         <xsl:comment> ThemeKey = <xsl:value-of select="$ThemeKey"/></xsl:comment>

         <!-- <comment> BoundCheck = <xsl:value-of select="$BoundCheck"/> 
</xsl:comment> -->

         <!-- farming -->
         <xsl:if test="contains($ThemeKey, 'Farming')">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">farming</xsl:element>
            </xsl:element>
         </xsl:if>

         <xsl:if test="contains($ThemeKey, 'farming')">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">
                  <xsl:value-of select="."/>
               </xsl:element>
            </xsl:element>
         </xsl:if>

         <!-- biota -->
         <xsl:if test="contains($ThemeKey, 'Biota')">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">biota</xsl:element>
            </xsl:element>
         </xsl:if>

         <xsl:if test="contains($ThemeKey, 'biota')">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">
                  <xsl:value-of select="."/>
               </xsl:element>
            </xsl:element>
         </xsl:if>

         <!-- boundaries -->
         <xsl:if test="contains($ThemeKey, 'Boundaries')">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">boundaries</xsl:element>
            </xsl:element>
         </xsl:if>

         <xsl:if test="contains($ThemeKey, 'boundaries')">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">
                  <xsl:value-of select="."/>
               </xsl:element>
            </xsl:element>
         </xsl:if>

         <!-- climatologyMeteorologyAtmosphere -->
         <xsl:if test="contains($ThemeKey, 'Atmosphere')">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode"
                  >climatologyMeteorologyAtmosphere</xsl:element>
            </xsl:element>
         </xsl:if>

         <xsl:if test="contains($ThemeKey, 'climatologyMeteorologyAtmosphere')">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">
                  <xsl:value-of select="."/>
               </xsl:element>
            </xsl:element>
         </xsl:if>

         <!-- Economy -->
         <xsl:if test="contains($ThemeKey, 'Economy')">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">economy</xsl:element>
            </xsl:element>
         </xsl:if>

         <xsl:if test="contains($ThemeKey, 'economy')">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">
                  <xsl:value-of select="."/>
               </xsl:element>
            </xsl:element>
         </xsl:if>

         <!-- elevation -->
         <xsl:if test="contains($ThemeKey, 'Environment')">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">elevation</xsl:element>
            </xsl:element>
         </xsl:if>

         <xsl:if test="contains($ThemeKey, 'environment')">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">
                  <xsl:value-of select="."/>
               </xsl:element>
            </xsl:element>
         </xsl:if>

         <!-- environment -->
         <xsl:if test="contains($ThemeKey, 'Environment')">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">environment</xsl:element>
            </xsl:element>
         </xsl:if>

         <xsl:if test="contains($ThemeKey, 'environment')">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">
                  <xsl:value-of select="."/>
               </xsl:element>
            </xsl:element>
         </xsl:if>

         <!-- geoscientificInformation 282 -->
         <xsl:if test="contains($ThemeKey, 'GeoscientificInformation')">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">geoscientificInformation</xsl:element>
            </xsl:element>
         </xsl:if>

         <xsl:if test="contains($ThemeKey, 'GeoscientificInformation')">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">
                  <xsl:value-of select="."/>
               </xsl:element>
            </xsl:element>
         </xsl:if>

         <!-- health -->
         <xsl:if test="contains($ThemeKey, 'Health')">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">health</xsl:element>
            </xsl:element>
         </xsl:if>

         <xsl:if test="contains($ThemeKey, 'health')">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">
                  <xsl:value-of select="."/>
               </xsl:element>
            </xsl:element>
         </xsl:if>

         <!-- Imagery -->
         <xsl:if test="contains($ThemeKey, 'ImageryBaseMapsEarthCover')">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">imageryBaseMapsEarthCover</xsl:element>
            </xsl:element>
         </xsl:if>

         <xsl:if test="contains($ThemeKey, 'imageryBaseMapsEarthCover')">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">
                  <xsl:value-of select="."/>
               </xsl:element>
            </xsl:element>
         </xsl:if>

         <!-- intelligenceMilitary -->
         <xsl:if test="contains($ThemeKey, 'IntelligenceMilitary')">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">intelligenceMilitary</xsl:element>
            </xsl:element>
         </xsl:if>

         <xsl:if test="contains($ThemeKey, 'intelligenceMilitary')">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">
                  <xsl:value-of select="."/>
               </xsl:element>
            </xsl:element>
         </xsl:if>

         <!-- inlandWaters -->
         <xsl:if test="contains($ThemeKey, 'InlandWaters')">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">inlandWaters</xsl:element>
            </xsl:element>
         </xsl:if>

         <xsl:if test="contains($ThemeKey, 'inlandWaters')">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">
                  <xsl:value-of select="."/>
               </xsl:element>
            </xsl:element>
         </xsl:if>

         <!-- Location -->
         <xsl:if test="contains($ThemeKey, 'Location')">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">location</xsl:element>
            </xsl:element>
         </xsl:if>

         <xsl:if test="contains($ThemeKey, 'location')">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">
                  <xsl:value-of select="."/>
               </xsl:element>
            </xsl:element>
         </xsl:if>

         <!-- Oceans -->
         <xsl:if test="contains($ThemeKey, 'Oceans')">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">oceans</xsl:element>
            </xsl:element>
         </xsl:if>

         <xsl:if test="contains($ThemeKey, 'oceans')">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">
                  <xsl:value-of select="."/>
               </xsl:element>
            </xsl:element>
         </xsl:if>

         <!-- planningCadastre -->
         <xsl:if test="contains($ThemeKey, 'PlanningCadastre')">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">planningCadastre</xsl:element>
            </xsl:element>
         </xsl:if>

         <xsl:if test="contains($ThemeKey, 'planningCadastre')">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">
                  <xsl:value-of select="."/>
               </xsl:element>
            </xsl:element>
         </xsl:if>

         <xsl:if test="contains($ThemeKey, 'Planning/Cadastre')">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">planningCadastre</xsl:element>
            </xsl:element>
         </xsl:if>
         <!-- society -->
         <xsl:if test="contains($ThemeKey, 'Society')">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">society</xsl:element>
            </xsl:element>
         </xsl:if>

         <xsl:if test="contains($ThemeKey, 'society')">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">
                  <xsl:value-of select="."/>
               </xsl:element>
            </xsl:element>
         </xsl:if>

         <!-- structure -->

         <xsl:if test="contains($ThemeKey, 'Structure')">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">structure</xsl:element>
            </xsl:element>
         </xsl:if>

         <xsl:if test="contains($ThemeKey, 'structure')">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">
                  <xsl:value-of select="."/>
               </xsl:element>
            </xsl:element>
         </xsl:if>

         <!-- Transportation -->

         <xsl:if test="contains($ThemeKey, 'Transportation')">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">transportation</xsl:element>
            </xsl:element>
         </xsl:if>

         <xsl:if test="contains($ThemeKey, 'transportation')">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">
                  <xsl:value-of select="."/>
               </xsl:element>
            </xsl:element>
         </xsl:if>

         <!-- Utilities -->
         <xsl:if test="contains($ThemeKey, 'UtilitiesCommunication')">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">utilitiesCommunication</xsl:element>
            </xsl:element>
         </xsl:if>

         <xsl:if test="contains($ThemeKey, 'utilitiesCommunication')">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">
                  <xsl:value-of select="."/>
               </xsl:element>
            </xsl:element>
         </xsl:if>

         <xsl:if test="contains($ThemeKey, 'Utilities/Communications')">
            <xsl:element name="gmd:topicCategory">
               <xsl:element name="gmd:MD_TopicCategoryCode">utilitiesCommunication</xsl:element>
            </xsl:element>
         </xsl:if>




      </xsl:for-each>




   </xsl:template>

</xsl:stylesheet>
