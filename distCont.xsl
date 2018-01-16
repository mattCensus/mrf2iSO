<?xml version="1.0" encoding="UTF-8"?>
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

    

    <xsl:import href="../mrf2ISO/05_gmd_contact.xsl"/>
    
    <xd:doc scope="stylesheet">
        <xd:p>mrf2ISO/distCont.xsl</xd:p>
        <xd:p>called by the mrf2ISO/13_gmd_distributionInfo.xsl template</xd:p>
        <xd:ul>
            <xd:li>Template                  Explanation                                                            </xd:li>
            <xd:li>metadataMaintenance       Handles the gmd:metadataMaintenance element                            </xd:li>  
            <xd:li>metaMaintContInfo         Handles the contact information for the gmd:metadataMaintenance element</xd:li>  
        </xd:ul>
        <xd:p>
            Initial   Date           Description
            MMC       12/04/2013     Ensured that all calls to the ISO codelist have the correct URL. Also removed an extra space in the codeListValue attribute.
            MMC       1/10/2014      Modified to work on the MRF Format    
            MMC       2/2/2015       Modified the if to work with version 2.0
            MMC       6/13/2016      Modified to include the  Spatial Products Software Branch 
        </xd:p>
    </xd:doc>

    <xsl:template name="distPointofContact">
      <!--  <xsl:comment>In the distPointofContact template </xsl:comment> -->
        <xsl:variable name="fullOrg" select="/MRF/Distribution_Information/Distributor/Contact_Organization"/>
        <xsl:variable name="postComma1" select="substring-after($fullOrg,',')"/>
        <xsl:variable name="Division" select="substring-after($postComma1,',')"/>
        <xsl:variable name="finalDivision" select="contains($Division, 'Geo')"/>
        <xsl:variable name="hasComma" select="contains($Division,',')"/>


       <!--    <xsl:comment>fullOrg:<xsl:value-of select="$fullOrg"/></xsl:comment>
        <xsl:comment>postComma1;<xsl:value-of select="$postComma1"/></xsl:comment>
        <xsl:comment>Division:<xsl:value-of select="$Division"/></xsl:comment>
        <xsl:comment>finalDivision:<xsl:value-of select="$finalDivision"/></xsl:comment>
        <xsl:comment>hascomma<xsl:value-of select="$hasComma"/></xsl:comment>-->


        <xsl:choose>

            <xsl:when test="contains($Division,',')">
               <!--   <xsl:comment>in the comma is true section BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB</xsl:comment>-->
                <xsl:variable name="fullBranch" select="substring-after($Division,',')"/>
                <xsl:variable name="finalBranch" select="substring($fullBranch,1,4)"/>
               <!--   <xsl:comment>fullBranch:<xsl:value-of select="$fullBranch"/></xsl:comment>
                <xsl:comment>finalBranch:<xsl:value-of select="$finalBranch"/></xsl:comment>-->
                <xsl:choose>
                    <!-- <xsl:when test="$finalBranch='Geo'"> -->
                    <xsl:when test="contains($Division, 'Customer')">
                        <xsl:call-template name="GeographicProductsBranchDistributor"/>
                    </xsl:when>
                    <xsl:when test="contains($fullBranch,'Geo')">
                        <xsl:call-template name="GeographicProductsBranchDistributor"/>
                    </xsl:when>
                    <xsl:when test="contains($fullBranch,'Spat')">
                        <xsl:call-template name="SpatialDataCollectionProductsBranchDistributor"/>
                    </xsl:when>
                    <xsl:otherwise>
                            <xsl:call-template name="GeographyDivisionDistributor"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            
            <xsl:when test="contains($Division, 'Geo')">
                <xsl:comment>In the finalDivision='true'</xsl:comment>
                <xsl:element name="gmd:distributorContact">
                    <xsl:attribute name="xlink:href">https://www.ngdc.noaa.gov/docucomp/1df27e57-4768-42de-909b-52f530601fba</xsl:attribute>
                    <xsl:attribute name="xlink:title">distributor - U.S. Department of Commerce, U.S. Census Bureau, Geography Division</xsl:attribute>
                </xsl:element>
                
            <xsl:choose>                
                <xsl:when test="contains($Division,'Customer')">
                    <xsl:call-template name="GeographicProductsBranchDistributor"/>
                </xsl:when>
               <xsl:otherwise>
                <xsl:call-template name="GeographyDivisionDistributor"/>
               </xsl:otherwise>
            </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:call-template name="distDefault"/>
            </xsl:otherwise>
        </xsl:choose>




    </xsl:template>
    <xsl:template name="distDefault">
 <xsl:element name="gmd:distributorContact">

                    <xsl:element name="gmd:CI_ResponsibleParty">

                        <xsl:element name="gmd:organisationName">
                            <xsl:element name="gco:CharacterString">
                                <xsl:value-of
                                    select="/MIF/Contact_Organization[@section='distributor']"/>
                            </xsl:element>
                        </xsl:element>
                        <xsl:element name="gmd:contactInfo">
                            <xsl:element name="gmd:CI_Contact">
                                <xsl:element name="gmd:phone">

                                    <xsl:element name="gmd:CI_Telephone">

                                        <xsl:element name="gmd:voice">
                                            <xsl:element name="gco:CharacterString">
                                                <xsl:value-of select="/MIF/Contact_Voice_Telephone[@section='distributor']"/>
                                            </xsl:element>
                                        </xsl:element>

                                        <xsl:if test="/MIF/Contact_Facsimilie_Telephone[@section='distributor']">
                                            <xsl:element name="gmd:facsimile">
                                                <xsl:element name="gco:CharacterString">
                                                  <xsl:value-of
                                                  select="/MIF/Contact_Facsimilie_Telephone[@section='distributor']"/>
                                                </xsl:element>
                                            </xsl:element>
                                        </xsl:if>

                                    </xsl:element>
                                </xsl:element>

                                <xsl:element name="gmd:address">
                                    <xsl:element name="gmd:CI_Address">

                                        <xsl:element name="gmd:deliveryPoint">
                                            <xsl:element name="gco:CharacterString">
                                                <xsl:value-of select="/MIF/Address[@section='distributor']"/>
                                            </xsl:element>
                                        </xsl:element>

                                        <xsl:element name="gmd:city">
                                            <xsl:element name="gco:CharacterString">
                                                <xsl:value-of select="/MIF/City[@section='distributor']"/>
                                            </xsl:element>
                                        </xsl:element>

                                        <xsl:element name="gmd:administrativeArea">
                                            <xsl:element name="gco:CharacterString">
                                                <xsl:value-of select="/MIF/State_or_Province[@section='distributor']" />
                                            </xsl:element>
                                        </xsl:element>

                                        <xsl:element name="gmd:postalCode">
                                            <xsl:element name="gco:CharacterString">
                                                <xsl:value-of select="/MIF/Postal_Code[@section='distributor']" />
                                            </xsl:element>
                                        </xsl:element>

                                        <xsl:element name="gmd:country">
                                            <xsl:element name="gco:CharacterString">
                                                <xsl:value-of select="/MIF/Country[@section='distributor']"/>
                                            </xsl:element>
                                        </xsl:element>


                                        <xsl:variable name="distEmail" select="/metadata/distinfo/distrib/cntinfo/cntemail"/>
                                        <xsl:variable name="distEmailLength" select="string-length($distEmail)"/>
                                        <xsl:choose>
                                            <xsl:when test="$distEmailLength &gt; 0">
                                                <xsl:element name="gmd:electronicMailAddress">
                                                  <xsl:element name="gco:CharacterString">
                                                  <xsl:value-of select="/MIF/Contact_Electronic_Mail_Address[@section='distributor']"/>
                                                  </xsl:element>
                                                </xsl:element>
                                            </xsl:when>

                                            <xsl:otherwise>
                                                <xsl:element name="gmd:electronicMailAddress">
                                                  <xsl:attribute name="gco:nilReason">missing</xsl:attribute>
                                                </xsl:element>
                                            </xsl:otherwise>
                                        </xsl:choose>

                                    </xsl:element>
                                </xsl:element>

                            </xsl:element>
                        </xsl:element>

                        <xsl:element name="gmd:role">
                            <xsl:element name="gmd:CI_RoleCode">
                                <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#CI_RoleCode</xsl:attribute>
                                <xsl:attribute name="codeListValue">distributor</xsl:attribute>
                                <xsl:attribute name="codeSpace">005 </xsl:attribute>distributor
                            </xsl:element>
                        </xsl:element>
                    </xsl:element>
   </xsl:element>
    </xsl:template>
</xsl:stylesheet>
