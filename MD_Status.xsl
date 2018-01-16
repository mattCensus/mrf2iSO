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
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Feb 27, 2015</xd:p>
            <xd:p><xd:b>Author:</xd:b>Matthew McCready</xd:p>
            <xd:p>mrf2ISO/MD_Status.xsl</xd:p>
            <xd:p>called by the mrf2ISO/11_gmd_identificationInfo.xsl template</xd:p>
            <xd:p>
                Initial   Date         Description
                MMC       2/27/2014    Created to handle the MD_Status element
            </xd:p>
        </xd:desc>
    </xd:doc>
    
    <xsl:template name="MD_Status" match="/">
        <xsl:variable name="progress" select="/MRF/Identification_Information/Status/Progress"></xsl:variable>
        <xsl:choose>
            <xsl:when test="$progress='Complete'">
                <xsl:element name="gmd:status">
                    <xsl:element name="gmd:MD_ProgressCode">
                        <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_ProgressCode</xsl:attribute>
                        <xsl:attribute name="codeListValue">completed</xsl:attribute>
                        completed
                    </xsl:element>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$progress='In work'">
                <xsl:element name="gmd:status">
                    <xsl:element name="gmd:MD_ProgressCode">
                        <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_ProgressCode</xsl:attribute>
                        <xsl:attribute name="codeListValue">onGoing</xsl:attribute>
                        onGoing
                    </xsl:element>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$progress='Planned'">
                <xsl:element name="gmd:status">
                    <xsl:element name="gmd:MD_ProgressCode">
                        <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_ProgressCode</xsl:attribute>
                        <xsl:attribute name="codeListValue">planned</xsl:attribute>
                        planned
                    </xsl:element>
                </xsl:element>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
     

</xsl:stylesheet>