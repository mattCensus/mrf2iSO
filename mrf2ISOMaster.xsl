<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:gco="http://www.isotc211.org/2005/gco" xmlns:gmd="http://www.isotc211.org/2005/gmd"
    xmlns:gmi="http://www.isotc211.org/2005/gmi" xmlns:gmx="http://www.isotc211.org/2005/gmx"
    xmlns:gsr="http://www.isotc211.org/2005/gsr" xmlns:gss="http://www.isotc211.org/2005/gss"
    xmlns:gts="http://www.isotc211.org/2005/gts" xmlns:gml="http://www.opengis.net/gml/3.2"
    xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:gfc="http://www.isotc211.org/2005/gfc" xmlns:vmf="http://www.altova.com/MapForce/UDF/vmf"
      xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:grp="http://www.altova.com/Mapforce/grouping"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="fn grp vmf xs xsi xsl xd" xmlns="http://www.isotc211.org/2005/gmi">
    
    <xsl:import href="../mrf2ISO/01_gmd_fileIdentifier.xsl"/>
    <xsl:import href="../mrf2ISO/02_gmd_language.xsl"/>
    <xsl:import href="../mrf2ISO/03_gmd_characterSet.xsl"/>
    <xsl:import href="../mrf2ISO/03B_gmd_parentIdentifier.xsl"/>
    <xsl:import href="../mrf2ISO/04_gmd_hierarchySet.xsl"/>
    <xsl:import href="../mrf2ISO/05_gmd_contact.xsl"/>
    <xsl:import href="../mrf2ISO/06_gmd_dateStamp.xsl"/>
    <xsl:import href="../mrf2ISO/07_gmd_metadataStandardName.xsl"/>
    <xsl:import href="../mrf2ISO/08_gmd_dataSetURI.xsl"/>
    <xsl:import href="../mrf2ISO/09_gmd_spatialRepresentationInfo.xsl"/>
    <xsl:import href="../mrf2ISO/10_gmd_referenceSystemInfo.xsl"/>
    <xsl:import href="../mrf2ISO/11_gmd_identificationInfo.xsl"/>
    <xsl:import href="../mrf2ISO/12_gmd_contentInfo.xsl"/>
    <xsl:import href="../mrf2ISO/13_gmd_distributionInfo.xsl"/>
    <xsl:import href="../mrf2ISO/14_gmd_dataQualityInfo.xsl"/>
    <xsl:import href="../mrf2ISO/15_metadataMaintenance.xsl"/>
    
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p>mrf2ISO/mrf2ISOMaster.xsl</xd:p>
            <xd:p><xd:b>Created on:</xd:b> Jan 7, 2014</xd:p>
            <xd:p>Calls the gmdfileIdentifier, gmdLanguage, gmd_characterSet, parentIdentifier, hierarchySet, contact, dateStamp, StandardName </xd:p>
            <xd:p>dataSetURI, spatialRepresentationInfo and referenceSystemInfo templates</xd:p>
            <xd:p><xd:b>Author:</xd:b> Matthew McCready</xd:p>
    <xd:ul>
   <xd:li>Stylesheet                         Template                                                   Explanation                </xd:li>
<xd:li>01_gmd_fileIdentifier.xsl             gmdfileIdentifier                                          Handles the gmd:fileIdentifier element</xd:li>
<xd:li>02_gmd_language.xsl                   gmdLanguage                                                Handles the gmd:language element </xd:li>
<xd:li>03_gmd_characterSet.xsl               gmd_characterSet                                           Handles the gmd:characterSet element (duplicate)</xd:li>
<xd:li>03_gmd_characterSet.xsl               Metadata_Character_Set                                     Handles the gmd:characterSet element (duplicate)</xd:li>
<xd:li>03_gmd_characterSet.xsl               Metadata_Character_Set_CodeSpace                           Handles the code for the codespace for the 
                                                                                                         Metadata_Character_Set </xd:li>
<xd:li>03B_gmd_parentIdentifier.xsl          parentIdentifier                                           Handles the gmd:parentIdentifier element </xd:li>
<xd:li>04_gmd_hierarchySet.xsl               hierarchySet                                               Handles the gmd:hierarchyLevel element</xd:li>
<xd:li>05_gmd_contact.xsl                    contact                                                    Master template for all the contacts</xd:li>
<xd:li>05_gmd_contact.xsl                    GeographicProductsBranchPointOfContact                     Handles the contact information for the Geographic Products  
                                                                                                         Branch(GPB)when it is the contact</xd:li>
<xd:li>05_gmd_contact.xsl                    GeographicProductsBranchDistributor                        Handles the contact information for the Geographic Products  
                                                                                                         Branch(GPB)  when it is the distributor</xd:li>
<xd:li>05_gmd_contact.xsl                    GeographicProductsBranchDistributorNonDistributionSection  Handles the contact information for the Geographic Products
                                                                                                         Branch (GPB) when it is the distributor (duplicate?)  </xd:li>                
<xd:li>05_gmd_contact.xsl                    GeographicProductsBranchDistributorcitedResponsibleParty   Handles the contact information for the Geographic Products 
                                                                                                         Branch(GPB) when it is the cited responsible party</xd:li>             
<xd:li>05_gmd_contact.xsl                    GeographicProductsBranchCustodian                          Handles the contact information for the Geographic Products
                                                                                                         Branch(GPB) when it is the custodian of the records   </xd:li> 
 <xd:li>05_gmd_contact.xsl                   CartographicProductsBranchPointOfContact                   Handles the contact information for the Cartographic Products
                                                                                                         Branch(CPB) when it is the Point of Contact for the metadata</xd:li>
<xd:li>05_gmd_contact.xsl                    CartographicBrachOriginator                                Handles the contact information for Cartographic Products Branch
                                                                                                         (CPB) when it is the Originator for the metadata</xd:li>
<xd:li>05_gmd_contact.xsl                    CartographicProductsBranchCustodian                        Handles the contact information for the Cartographic Products
                                                                                                         Branch (CPB) when it is the Custodian of the records</xd:li>             
<xd:li>05_gmd_contact.xsl                    GeographyDivisionDistributor                               Handles the contact information for the Geography Division (GEO)
                                                                                                         when it is the distributor of the metadata (duplicate?)</xd:li>
<xd:li>05_gmd_contact.xsl                    GeographyDivisionDistributorNonDistributionSection         Handles the contact information for the Geography Division (GEO)
                                                                                                         when it is the distributor of the metadata (duplicate?)</xd:li>
<xd:li>05_gmd_contact.xsl                    GeographyDivisionDistributorcitedResponsibleParty          Handles the contact information for the Geography Division (GEO)
                                                                                                         when it is the distributor of the metadata (duplicate?)</xd:li>
<xd:li>05_gmd_contact.xsl                    GeographyDivisionOriginator                                Handles the contact information for the Geography Division (GEO) 
                                                                                                         when it is the originator of the metadata</xd:li>              
<xd:li>05_gmd_contact.xsl                    GeographyDivisionPointOfContact                            Handles the contact information for the Geography Division (GEO)
                                                                                                         when it is the point of contact for the metadata</xd:li>
<xd:li>05_gmd_contact.xsl                    defaultContact                                             Handles the contact information when the Branch Division could 
                                                                                                         not be determined </xd:li>
<xd:li>06_gmd_dateStamp.xsl                  dateStamp                                                  Handles the gmd:dateStamp element</xd:li>
<xd:li>06_gmd_dateStamp.xsl                  dateStampFormat                                            Handles the format for the gmd:dateStamp element</xd:li>  
<xd:li>07_gmd_metadataStandardName.xsl       StandardName                                               Handles the gmd:metadataStandardName element</xd:li>  
<xd:li>08_gmd_dataSetURI.xsl                 dataSetURI                                                 Handles the gmd:dataSetURI element </xd:li>  
<xd:li>09_gmd_spatialRepresentationInfo.xsl  SDTSListValueTemp                                          Handles the gmd:MD_GeometricObjectTypeCode element</xd:li>  
<xd:li>09_gmd_spatialRepresentationInfo.xsl  spatialRepresentationInfo                                  Handles the gmd:MD_VectorSpatialRepresentation element</xd:li> 
<xd:li>10_gmd_referenceSystemInfo.xsl        referenceSystemInfo                                        Handles the gmd:referenceSystemInfo element for the indirect 
                                                                                                         spatial reference</xd:li>
<xd:li>10_gmd_referenceSystemInfo.xsl        kmlReferenceSystemInfo                                     Handles the gmd:referenceSystemInfo element for KML files </xd:li>        
<xd:li>11_gmd_identificationInfo.xsl         identificationInfo                                         Handles the gmd:identificationInfo element </xd:li>
<xd:li>12_gmd_contentInfo.xsl                contentInfo                                                Handles the gmd:contentInfo element</xd:li> 
<xd:li>12_gmd_contentInfo.xsl                includedWithDatasetA                                       Handles the gmd:includedWithDataset element</xd:li> 
<xd:li>12_gmd_contentInfo.xsl                featureCatalogueCitationDateA                              Handles the gmd:date element</xd:li>
<xd:li>12_gmd_contentInfo.xsl                FC_CitedResponsibleParty                                   Handles the gmd:CI_ResponsibleParty element</xd:li>  
<xd:li>12_gmd_contentInfo.xsl                FCCitedResponsiblePartyList                                Handles the branch for the gmd:CI_ResponsibleParty element</xd:li>        
<xd:li>13_gmd_distributionInfo.xsl           distributionInfo                                           Handles the gmd:distributionInfo element</xd:li>
<xd:li>14_gmd_dataQualityInfo.xsl            dataQualityInfo                                            Handles the gmd:dataQualityInfo element </xd:li>
<xd:li>14_gmd_dataQualityInfo.xsl            dateTimeTemp                                               Handles the gmd:dateTime element </xd:li>  
<xd:li>15_metadataMaintenance.xsl            metadataMaintenance                                        Handles the gmd:metadataMaintenance element</xd:li>  
<xd:li>15_metadataMaintenance.xsl            metaMaintContInfo                                          Handles the contact information for the gmd:metadataMaintenance
                                                                                                         element</xd:li> 
<xd:li>distCont.xsl                          distPointofContact                                         Handles the contact information for distributionInfo section</xd:li>        
<xd:li>ExtraContent.xsl                      FeatureType                                                Handles the gmd:featureTypes for the ContentInfo section</xd:li> 
<xd:li>ExtraContent.xsl                      ContentTitle                                               Handles the gmd:title for the ContentInfo section</xd:li> 
<xd:li>ExtraDataQualityTemplate.xsl          begDateFormatTimePeriod                                    Handles the gml:beginPosition for the identificationInformation</xd:li>  
<xd:li>ExtraDataQualityTemplate.xsl          endDateFormatTimePeriod                                    Handles the gml:endPosition for the identificationInformation</xd:li>  
<xd:li>ExtraDataQualityTemplate.xsl          TemporalExtentTimePeriod                                   formats gml:id namespace</xd:li> 
<xd:li>IdPointOfContact.xsl                  CitedResponsibleParty                                      Handles the contact information for the Citation element for
                                                                                                         for the identificationInformation </xd:li>        
<xd:li>IdPointOfContact.xsl                  pointOfContact                                             Handles the contact information section for the pointOfContact 
                                                                                                         for the identificationInformation</xd:li>        
<xd:li>ISOKeywords.xsl                       ISO_TopicCategories                                        Handles the ISO Topic categories  for the identificationInformation</xd:li>
<xd:li>MD_MaintenanceFrequencyCode.xsl       MD_MaintenanceFrequencyCode                                Handles the gmd:maintenanceAndUpdateFrequency element for the
                                                                                                         identificationInformation and metadataMaintenance sections</xd:li>  
<xd:li>MD_MediumFormatCode.xsl               MD_MediumFormatCode                                        Handles the gmd:mediumFormat for the distributionInfo section</xd:li> 
<xd:li>MD_SpatialRepresentationType.xsl      spatialRepresentationType                                  Handles the gmd:spatialRepresentationType for the 
                                                                                                         identificationInformation </xd:li>
<xd:li>NGDA_Themes.xsl                       NGDAThemes                                                 Handles the the NGDA themes for the identificationInformation  </xd:li>
<xd:li>NonISOKeywords.xsl                    NonISOKeywords                                             Master template for all the other non ISO theme templates</xd:li> 
<xd:li>NonISOKeywords.xsl                    NonThemeISOKeywords                                        Template for all the non ISO keywords</xd:li>
<xd:li>NonISOKeywords.xsl                    PlaceKeywords                                              Template used to create Place theme keywords</xd:li>  
<xd:li>MD_Status.xsl                         MD_Status                                                  Handles the MD_Status element</xd:li>        
    </xd:ul>
            <xd:p>
            Initial   Date      Change Request ID   Description
            MMC      1/8/2014                       Modified to work on the MRF Format 
            MMC      2/25/2015                      Made the Entity_and_Attribute_Information, Distribution_Information and Data_Quality_Information sections optional
                                                     with an if statement.
            MMC      2/25/2016                      Inserted the xsi namespace and the schemaLocation attribute into the root element.                                                             
            </xd:p>
        </xd:desc>
    </xd:doc>
    
  <!--    <xsl:output method="xml" version="1.0" encoding="ISO-8859-1" indent="yes" omit-xml-declaration="yes"/>-->
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="no" />
    <xsl:strip-space elements="*"/>
    
   
    
    <xsl:template match="/">
        <xsl:text>&#10;</xsl:text>
        <xsl:element name="gmi:MI_Metadata">
            
            <!-- inserts the xlinx namspace -->
            <xsl:copy-of select="document('')/*/namespace::*[name()='xlink']"/>
            <!-- inserts the gmd namespace -->
            <xsl:copy-of select="document('')/*/namespace::*[name()='gmd']"/>
            <!-- inserts the gco namespace -->
            <xsl:copy-of select="document('')/*/namespace::*[name()='gco']"/>
            <!-- inserts the gml namespace -->
            <xsl:copy-of select="document('')/*/namespace::*[name()='gml']"/>
            <!-- inserts the xsi namespace -->
            <xsl:copy-of select="document('')/*/namespace::*[name()='xsi']"/>
             
            <xsl:attribute name="xsi:schemaLocation">http://www.isotc211.org/2005/gmi http://www.ngdc.noaa.gov/metadata/published/xsd/schema.xsd</xsl:attribute>
            <xsl:call-template name="gmdfileIdentifier"/>
            <xsl:call-template name="gmdLanguage"/>
            <xsl:call-template name="gmd_characterSet"/>
            <xsl:call-template name="parentIdentifier"/>
            <xsl:call-template name="hierarchySet"/>
            <xsl:call-template name="contact"/>
            <xsl:call-template name="dateStamp"/>
            <xsl:call-template name="StandardName"/>
            <xsl:call-template name="dataSetURI"/>
            <xsl:call-template name="spatialRepresentationInfo"/>
            <xsl:call-template name="referenceSystemInfo"/>
            
            <xsl:variable name="formatType" select="/MRF/Distribution_Information/Standard_Order_Process/Digital_Form/Format_Name"/>
            <!-- <xsl:comment>formatType:<xsl:value-of select="$formatType"/></xsl:comment> -->
            <xsl:choose>
                <xsl:when test="$formatType = 'KML'">
                    <xsl:call-template name="kmlReferenceSystemInfo"/>
                </xsl:when>
            </xsl:choose>
            <xsl:call-template name="spatialReferenceSystemInfo"/>
            
            <xsl:call-template name="identificationInfo"/>
            <xsl:if test="/MRF/Entity_and_Attribute_Information">
            <xsl:call-template name="contentInfo"/>
            </xsl:if>
            <xsl:if test="/MRF/Distribution_Information">
            <xsl:call-template name="distributionInfo"/>
            </xsl:if>
            <xsl:if test="/MRF/Data_Quality_Information">
            <xsl:call-template name="dataQualityInfo"/>
            </xsl:if>
            <xsl:call-template name="metadataMaintenance"/>
           
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>