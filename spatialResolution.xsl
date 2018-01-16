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
    
    
    <xd:doc scope="stylesheet">
        <xd:p>mrf2ISO/spatialResolution.xsl</xd:p>
        <xd:p>called by the mrf2ISO/11_gmd_identificationInfo.xsl template</xd:p>
       
        <xd:ul>
            <xd:li></xd:li>
        </xd:ul>
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Feb 11, 2016</xd:p>
            <xd:p><xd:b>Author:</xd:b> Matthew McCready</xd:p>
            <xd:ul>
                <xd:li>Template                Explanation                                </xd:li>
                <xd:li>identificationInfo      Handles the gmd:identificationInfo element </xd:li>
            </xd:ul>
            <xd:p>
                Initial   Date         Description
                MMC       2/11/16   Created to handle the scales for cartographic files
            </xd:p>
        </xd:desc>
    </xd:doc>
    
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    
    <xsl:template name="spatialResolution">
        <xsl:variable name="Title" select="/MRF/Identification_Information[1]/Citation[1]/Title[1]"/>
        <xsl:variable name="vintage" select="substring-before($Title,',')"/>
        <xsl:variable name="postVintage" select="substring-after($Title,',')"/>
        <xsl:variable name="theme" select="substring-before($postVintage,',')"/>
        <xsl:variable name="scale" select="substring-after($postVintage,',')"/>
        
        <xsl:choose>
            <xsl:when test="contains($Title,'Cartographic')">
                <xsl:choose>
                    <xsl:when test="contains($scale,'20,000,000')">
                        <xsl:element name="gmd:spatialResolution">
                            <xsl:element name="gmd:MD_Resolution">
                                <xsl:element name="gmd:equivalentScale">
                                    <xsl:element name="gmd:MD_RepresentativeFraction">
                                        <xsl:element name="gmd:denominator">
                                            <xsl:element name="gco:Integer">20000000</xsl:element>
                                        </xsl:element>
                                    </xsl:element>
                                </xsl:element>
                            </xsl:element>
                        </xsl:element>
                    </xsl:when>
                    <xsl:when test="contains($scale,'500,000')">
                        <xsl:element name="gmd:spatialResolution">
                            <xsl:element name="gmd:MD_Resolution">
                                <xsl:element name="gmd:equivalentScale">
                                    <xsl:element name="gmd:MD_RepresentativeFraction">
                                        <xsl:element name="gmd:denominator">
                                            <xsl:element name="gco:Integer">500000</xsl:element>
                                        </xsl:element>
                                    </xsl:element>
                                </xsl:element>
                            </xsl:element>
                        </xsl:element>
                    </xsl:when>
                    <xsl:when test="contains($scale,'5,000,000')">
                        <xsl:element name="gmd:spatialResolution">
                            <xsl:element name="gmd:MD_Resolution">
                                <xsl:element name="gmd:equivalentScale">
                                    <xsl:element name="gmd:MD_RepresentativeFraction">
                                        <xsl:element name="gmd:denominator">
                                            <xsl:element name="gco:Integer">5000000</xsl:element>
                                        </xsl:element>
                                    </xsl:element>
                                </xsl:element>
                            </xsl:element>
                        </xsl:element>
                    </xsl:when>
                </xsl:choose>
                
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
</xsl:stylesheet>