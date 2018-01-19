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
   
   <xsl:import href="../mrf2ISO/NGDA_Themes.xsl"/> 
   <xsl:import href="../mrf2ISO/IdPointOfContact.xsl"/>
   <xsl:import href="../mrf2ISO/MD_SpatialRepresentationType.xsl"/>
   <xsl:import href="../mrf2ISO/03_gmd_characterSet.xsl"/>
   <xsl:import href="../mrf2ISO/MD_MaintenanceFrequencyCode.xsl"/>
   <xsl:import href="../mrf2ISO/ISOTopicCategoryKeywords.xsl"/>
   <xsl:import href="../mrf2ISO/NonISOKeywords.xsl"/>
   <xsl:import href="../mrf2ISO/ExtraDataQualityTemplate.xsl"/>
   <xsl:import href="../mrf2ISO/MD_Status.xsl"/>
   <xsl:import href="../mrf2ISO/CI_PresentationForm.xsl"/>
   <xsl:import href="../mrf2ISO/spatialResolution.xsl"/>
   <xsl:import href="../mrf2ISO/graphicOverview.xsl"/>
   <xsl:import href="../mrf2ISO/NGDAAltTitle.xsl"/>
   
   <xd:doc scope="stylesheet">
      <xd:p>mrf2ISO/11_gmd_identificationInfo.xsl</xd:p>
      <xd:p>called by the mrf2ISO/mrf2ISOMaster.xsl template</xd:p>
      <xd:p>calls the following templates
         Template                                     Stylesheet/File
         CitedResponsibleParty                        IdPointOfContact.xsl
         MD_MaintenanceFrequencyCode                  MD_MaintenanceFrequencyCode.xsl
         NonISOKeywords                               NonISOKeywords.xsl
         ISO_TopicCategories                          ISO_TopicCategories.xsl
         BegDateTemp                                  ExtraDataQualityTemplate.xsl
         EndDateTemp                                  ExtraDataQualityTemplate.xsl
         NGDA_Themes                                  NGDA_Themes.xsl
         MD_Status                                    MD_Status.xsl
         PresentationForm                             CI_PresentationForm.xsl
         spatialResolution                            spatialResolution.xsl
         AltTitle                                     NGDAAltTitle.xsl
      </xd:p>
      <xd:ul>
         <xd:li></xd:li>
      </xd:ul>
      <xd:desc>
         <xd:p><xd:b>Created on:</xd:b> Jan 7, 2014</xd:p>
         <xd:p><xd:b>Author:</xd:b> Matthew McCready</xd:p>
         <xd:ul>
            <xd:li>Template                Explanation                                </xd:li>
            <xd:li>identificationInfo      Handles the gmd:identificationInfo element </xd:li>
         </xd:ul>
         <xd:p>
            Initial   Date         Description
            MMC       12/04/2013   Inserted a call to the NGDA template to handle National Geospatial Data Asset OMB themes.
            MMC       12/04/2013   Ensured that all calls to the ISO codelists have the correct URL 
            MMC       12/12/2013   Inserted a call to the spatialRepresentationType template, which is in the  MD_SpatialRepresentationType.xsl stylesheet.
                                    Spatial reference information is now handled in the metadata file.
            MMC       1/8/2014     Modified to work on the MRF Format. 
            MMC       2/2/2015     Modified the if to work with version 2.0 
            MMC       2/27/2015    Added a call to the MD_Status template to handle the MD_Status element.
            MMC       5/4/2015     Added an if option to handle the Alternate Title  
            MMC       12/16/15     Added a call to the PresentationForm temple to handle the PresentationForm element.
            MMC       2/11/16      Added a call to the spatialResolution template to handle scale information for the cartographic files 
            MMC       6/13/2016    Modified to include the  Spatial Products Software Branch 
            MMC       6/20/17      Modified to produce NGDA Alternate Titles for NGDA datasets
            MMC       1/19/        replaced the "http" with "https" in browse graphic 
         </xd:p>
      </xd:desc>
   </xd:doc>

<!-- file:/U:/ReleasedPerlScriptsandSchemas/XSLTSSchemsaModules/mrf2ISO/11_gmd_identificationInfo.xsl -->
   <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>


   <xsl:template name="identificationInfo" match="/">
      <xsl:text>&#10;</xsl:text>
      <xsl:comment>This part represents Section 1 of the FGDC Metadata Standard </xsl:comment>
      <xsl:text>&#10;</xsl:text>
      <xsl:element name="gmd:identificationInfo">
         <xsl:element name="gmd:MD_DataIdentification">
            <xsl:element name="gmd:citation">
               <xsl:element name="gmd:CI_Citation">

                  <xsl:element name="gmd:title">
                     <xsl:element name="gco:CharacterString">
                        <xsl:apply-templates select="/MRF/Identification_Information/Citation/Title"/>
                     </xsl:element>
                  </xsl:element><!-- gmd:title -->
                  <xsl:call-template name="AltTitle"/>
                  
                  <xsl:if test="/MRF/Identification_Information/Citation/Alternate_Title">
                     <xsl:element name="gmd:alternateTitle">
                        <xsl:element name="gco:CharacterString"><xsl:value-of select="/MRF/Identification_Information/Citation/Alternate_Title"/></xsl:element>
                     </xsl:element>
                  </xsl:if>
                  
                  <xsl:element name="gmd:date">
                     <xsl:element name="gmd:CI_Date">
                        <xsl:text>&#10;</xsl:text>
                        <xsl:comment> This is the publication date </xsl:comment>
                        <xsl:text>&#10;</xsl:text>
                        <xsl:element name="gmd:date">

                           <xsl:element name="gco:Date">
                              <xsl:variable name="dateLength" select="string-length(/MRF/Identification_Information/Citation/Publication_Date)"/>
                              <xsl:variable name="citDate" select="/MRF/Identification_Information/Citation/Publication_Date"/>
                              <xsl:choose>
                                 <xsl:when test="$dateLength=6">
                                   <xsl:variable name="year" select="substring($citDate,1,4)"/>
                                    <xsl:variable name="month" select="substring($citDate,5,2)"/>
                                    <xsl:variable name="corrCitDate" select="concat($year,'-',$month)"/>
                                    <xsl:value-of select="$corrCitDate"/>
                                 </xsl:when>
                                 <xsl:otherwise>
                                    <xsl:value-of select="/MRF/Identification_Information/Citation/Publication_Date"/>
                                 </xsl:otherwise>
                              </xsl:choose>
                              
                           </xsl:element>
                           <!--gco:date -->
                        </xsl:element>
                        <!-- gmd:date -->

                        <xsl:element name="gmd:dateType">
                           <xsl:element name="gmd:CI_DateTypeCode">
                              <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#CI_DateTypeCode</xsl:attribute>
                              <xsl:attribute name="codeListValue">publication</xsl:attribute>
                              <xsl:attribute name="codeSpace">002</xsl:attribute> publication </xsl:element>
                           <!-- gmd:CI_DateTypeCode -->
                        </xsl:element>
                        <!-- gmd:dateType -->

                     </xsl:element>
                     <!-- gmd:CI_Date -->
                  </xsl:element>
                  <!-- gmd:date -->

                  <!-- <xsl:comment>Edition Check  </xsl:comment> -->
                  <xsl:text>
           
                  </xsl:text>
                  <xsl:if test="/MRF/Identification_Information/Citation/Edition">
                     <xsl:element name="gmd:edition">
                        <xsl:element name="gco:CharacterString">
                           <xsl:value-of select="/MRF/Identification_Information/Citation/Edition"/>
                        </xsl:element>
                        <!-- gco:CharacterString -->
                     </xsl:element>
                     <!-- gmd:edition -->
                  </xsl:if>

                  <!-- <xsl:comment> calling CitedResponsibleParty</xsl:comment>-->
                  <xsl:call-template name="CitedResponsibleParty"/> 
                  <!--  <xsl:comment> done with CitedResponsibleParty</xsl:comment> -->

                  <xsl:call-template name="PresentationForm"/>
               </xsl:element>
               <!-- gmd:CI_Citation -->
            </xsl:element>
            <!-- gmd:citation-->

            <xsl:element name="gmd:abstract">
               <xsl:element name="gco:CharacterString">
                  <xsl:value-of select="/MRF/Identification_Information/Description/Abstract"/>
               </xsl:element>
               <!-- gco:CharacterString -->
            </xsl:element>
            <!-- gmd:abstract -->

            <xsl:element name="gmd:purpose">
               <xsl:element name="gco:CharacterString">
                  <xsl:value-of select="/MRF/Identification_Information/Description/Purpose"/>
               </xsl:element>
               <!-- gco:CharacterString -->
            </xsl:element>
            <!-- gmd:purpose -->
            
            <xsl:call-template name="MD_Status"/>

            <xsl:call-template name="pointOfContact"/>

            <xsl:if test="/MRF/Identification_Information/Status/Maintenance_and_Update_Frequency">
               <xsl:text>&#10;</xsl:text>
               
               <xsl:element name="gmd:resourceMaintenance">
                  <xsl:element name="gmd:MD_MaintenanceInformation">

                     <xsl:call-template name="MD_MaintenanceFrequencyCode"/>
                  </xsl:element>
                  <!-- gmd:MD_MaintenanceInformation -->
               </xsl:element>
               <!-- gmd:resourceMaintenance -->
            </xsl:if>

            <xsl:variable name="NgdaCheck" select="/MRF/Identification_Information[1]/Keywords[1]/Theme[1]/Theme_Keyword_Thesaurus[1]"/>
            <!--   <xsl:comment><xsl:value-of select="$NgdaCheck"/></xsl:comment>-->
            <xsl:if test="contains($NgdaCheck,'NGDA Portfolio Themes')">
               <xsl:call-template name="graphicOverview"/>
            </xsl:if>

            <xsl:call-template name="NonISOKeywords"/>

        <!--      <xsl:call-template name="NGDAThemes"/>-->

            <xsl:element name="gmd:resourceConstraints">
               <xsl:element name="gmd:MD_LegalConstraints">

                  <xsl:element name="gmd:accessConstraints">

                     <xsl:element name="gmd:MD_RestrictionCode">
                        <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_RestrictionCode</xsl:attribute>
                        <xsl:attribute name="codeListValue">otherRestrictions</xsl:attribute>
                        <xsl:attribute name="codeSpace">008 </xsl:attribute> otherRestrictions </xsl:element>
                     <!-- gmd:MD_RestrictionCode -->
                  </xsl:element>
                  <!-- gmd:accessConstraints -->


                  <xsl:element name="gmd:useConstraints">
                     <xsl:element name="gmd:MD_RestrictionCode">
                        <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_RestrictionCode</xsl:attribute>
                        <xsl:attribute name="codeListValue">otherRestrictions</xsl:attribute>
                        <xsl:attribute name="codeSpace">008 </xsl:attribute>
                     </xsl:element>
                     <!-- gmd:MD_RestrictionCode -->
                  </xsl:element>
                  <!-- gmd:useConstraints -->



                  <xsl:if test="/MRF/Identification_Information/Access_Constraints">
                     <xsl:element name="gmd:otherConstraints">
                        <xsl:element name="gco:CharacterString"> Access Constraints: <xsl:value-of
                              select="/MRF/Identification_Information/Access_Constraints"/>
                        </xsl:element>
                        <!-- gco:CharacterString -->
                     </xsl:element>
                     <!-- gmd:otherConstraints -->
                  </xsl:if>

                  <xsl:if test="/MRF/Identification_Information/Use_Constraints">
                     <xsl:element name="gmd:otherConstraints">
                        <xsl:element name="gco:CharacterString"> Use Constraints:<xsl:value-of select="/MRF/Identification_Information/Use_Constraints"/>                      </xsl:element>
                        <!-- gco:CharacterString -->
                     </xsl:element>
                     <!-- gmd:otherConstraints -->
                  </xsl:if>


               </xsl:element>
               <!-- gmd:MD_LegalConstraints -->
            </xsl:element>
            <!-- gmd:resourceConstraints -->

            <xsl:text>
            </xsl:text>
            <xsl:comment> This is from the Direct Spatial Reference from Chapter 3 </xsl:comment>
            <xsl:text>
            </xsl:text>

            <xsl:call-template name="spatialRepresentationType"/>
            <xsl:call-template name="spatialResolution"/>

            <xsl:element name="gmd:language">
               <xsl:choose>
                  <xsl:when test="/MRF/Identification_Information/Data_Set_Language">
                     <xsl:element name="gco:CharacterString">
                        <xsl:value-of select="/MRF/Identification_Information/Data_Set_Language"/>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:element name="gco:CharacterString">eng</xsl:element>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:element>
            <!-- language -->

            <xsl:call-template name="Metadata_Character_Set"/>
            <!-- <xsl:comment> calling the ISO template </xsl:comment> -->
            <xsl:call-template name="ISO_TopicCategories"/>
            
            

            <xsl:if test="/MRF/Distribution_Information/Technical_Prerequisites">
               <xsl:element name="gmd:environmentDescription">
                  <xsl:element name="gco:CharacterString">
                     <xsl:value-of select="/MRF/Distribution_Information/Technical_Prerequisites"/>
                  </xsl:element>
               </xsl:element>
            </xsl:if>

            <xsl:element name="gmd:extent">
               <xsl:element name="gmd:EX_Extent">
                  <xsl:attribute name="id">boundingExtent</xsl:attribute>

                  <xsl:element name="gmd:geographicElement">
                     <xsl:element name="gmd:EX_GeographicBoundingBox">
                        <xsl:attribute name="id">boundingGeographicBoundingBox</xsl:attribute>

                        <xsl:element name="gmd:westBoundLongitude">
                           <xsl:element name="gco:Decimal">
                              <xsl:value-of select="/MRF/Identification_Information/Spatial_Domain/West_Bounding_Coordinate"/>
                           </xsl:element>
                           <!-- gco:Decimal -->
                        </xsl:element>
                        <!-- gmd:westBoundLongitude -->


                        <xsl:element name="gmd:eastBoundLongitude">
                           <xsl:element name="gco:Decimal">
                              <xsl:value-of select="/MRF/Identification_Information/Spatial_Domain/East_Bounding_Coordinate"/>
                           </xsl:element>
                           <!-- gco:Decimal -->
                        </xsl:element>
                        <!-- gmd:eastBoundLongitude -->


                        <xsl:element name="gmd:southBoundLatitude">
                           <xsl:element name="gco:Decimal">
                              <xsl:value-of select="//MRF/Identification_Information/Spatial_Domain/South_Bounding_Coordinate"/>
                           </xsl:element>
                           <!-- gco:Decimal -->
                        </xsl:element>
                        <!-- gmd:southBoundLongitude -->


                        <xsl:element name="gmd:northBoundLatitude">
                           <xsl:element name="gco:Decimal">
                              <xsl:value-of select="/MRF/Identification_Information/Spatial_Domain/North_Bounding_Coordinate"/>
                           </xsl:element>
                           <!-- gco:Decimal -->
                        </xsl:element>
                        <!-- gmd:southBoundLongitude -->


                     </xsl:element>
                     <!-- gmd:EX_GeographicBoundingBox -->
                  </xsl:element>
                  <!-- gmd:geographicElement -->


                  <xsl:element name="gmd:temporalElement">
                     <xsl:element name="gmd:EX_TemporalExtent">
                        <xsl:attribute name="id">boundingTemporalExtent</xsl:attribute>
                        <!-- <xsl:attribute name="gml:id">boundingTimePeriodExtent</xsl:attribute> -->
                        <xsl:element name="gmd:extent">
                           <xsl:element name="gml:TimePeriod">
                              <xsl:attribute name="gml:id">boundingTemporalExtentA</xsl:attribute>

                              <xsl:element name="gml:description">
                                 <xsl:value-of select="/MRF/Identification_Information/Time_Period_of_Content/Currentness_Reference"/>
                              </xsl:element>

                              <xsl:call-template name="begDateFormatTimePeriod"/>
                              <xsl:call-template name="endDateFormatTimePeriod"/>

                           </xsl:element>
                           <!-- gml:TimePeriod -->
                        </xsl:element>
                        <!-- gmd:extent -->
                     </xsl:element>
                     <!-- gmd:EX_TemporalExtent -->
                  </xsl:element>
                  <!-- gmd:temporalElement -->
               </xsl:element>
               <!-- gmd:EX_Extent -->
            </xsl:element>
            <!-- gmd:extent -->


            <xsl:if test="/MRF/Identification_Information/Description/Supplemental_Information">
               <xsl:element name="gmd:supplementalInformation">
                  <xsl:element name="gco:CharacterString">
                     <xsl:value-of select="/MRF/Identification_Information/Description/Supplemental_Information"/>
                  </xsl:element>
               </xsl:element>
            </xsl:if>
         </xsl:element>
         <!-- gmd:MD_DataIdentification -->
      </xsl:element>
      <!-- gmd:identificationInfo -->

      <!-- </xsl:if> -->




   </xsl:template>
</xsl:stylesheet>
