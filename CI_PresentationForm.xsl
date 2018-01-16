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
    xmlns:ci="http://www.isotc211.org/schemas/2012/ci"
    exclude-result-prefixes="fn grp xs xsi xsl xd" xmlns="http://www.isotc211.org/2005/gfc">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p>mrf2ISO/CI_PresentationForm.xsl</xd:p>
            <xd:p>called by the mrf2ISO/11_gmd_identificationInfo.xsl template</xd:p>
            <xd:p><xd:b>Created on:</xd:b> Dec 16, 2015</xd:p>
            <xd:p><xd:b>Author:</xd:b> Matthew McCready</xd:p>
            <xd:p> This stylesheet handles the presentationForm element. There are 2 valid codes:
                mapDigital and mapHardcopy</xd:p>
            <xd:ul>
                <xd:li>Template Explanation </xd:li>
                <xd:li>PresentationForm Handles the presentationForm element for the Citation  element for the identificationInformation </xd:li>
            </xd:ul>
            <xd:p>
                Initial   Date         Description
                MMC       2/11/16      
            </xd:p>
        </xd:desc>
    </xd:doc>

    <xsl:template name="PresentationForm">
        <xsl:element name="gmd:presentationForm">
            <xsl:element name="gmd:CI_PresentationFormCode">
                <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#CI_PresentationFormCode</xsl:attribute>
                <xsl:variable name="presForm" select="/MRF/Identification_Information[1]/Citation[1]/Geospatial_Data_Presentation_Form"/>
                <xsl:choose>
                    <xsl:when test="contains($presForm,'vector digital data')">
                        <xsl:attribute name="codeListValue">mapDigital</xsl:attribute>
                    </xsl:when>
                    <xsl:when test="contains($presForm,'atlas')">
                        <xsl:attribute name="codeListValue">mapHardcopy</xsl:attribute>
                    </xsl:when>
                    <xsl:when test="contains($presForm,'globe')">
                        <xsl:attribute name="codeListValue">mapHardcopy</xsl:attribute>
                    </xsl:when>
                    <xsl:when test="contains($presForm,'map')">
                        <xsl:attribute name="codeListValue">mapHardcopy</xsl:attribute>
                    </xsl:when>
                    <xsl:when test="contains($presForm,'raster digital data')">
                        <xsl:attribute name="codeListValue">mapDigital</xsl:attribute>
                    </xsl:when>
                    <xsl:when test="contains($presForm,'remote-sensing image')">
                        <xsl:attribute name="codeListValue">imageHardcopy</xsl:attribute>
                    </xsl:when>
                    <xsl:when test="contains($presForm,'tabular digital data')">
                        <xsl:attribute name="codeListValue">tableDigital</xsl:attribute>
                    </xsl:when>
                </xsl:choose>
            </xsl:element>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>
