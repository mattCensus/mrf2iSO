<?xml version="1.0" encoding="UTF-8"?>
    
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:gco="http://www.isotc211.org/2005/gco" xmlns:gfc="http://www.isotc211.org/2005/gfc"
    xmlns:gmd="http://www.isotc211.org/2005/gmd" xmlns:gmx="http://www.isotc211.org/2005/gmx"
    xmlns:gsr="http://www.isotc211.org/2005/gsr" xmlns:gss="http://www.isotc211.org/2005/gss"
    xmlns:gts="http://www.isotc211.org/2005/gts" xmlns:gml="http://www.opengis.net/gml/3.2"
    xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" exclude-result-prefixes="xd">

    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p>mrf2ISO/MD_SpatialRepresentationType.xsl</xd:p>
            <xd:p>called by the mrf2ISO/11_gmd_identificationInfo.xsl template</xd:p>
            <xd:p><xd:b>Created on:</xd:b> Dec 12, 2013</xd:p>
            <xd:p><xd:b>Author:</xd:b> Matthew McCready</xd:p>
            <xd:p> This stylesheet translates the Direct_Spatial_Reference_Method of the MRF file into the spatialRepresentationType ISO element. This element provides
            information about the objects used to represent geographic information.</xd:p>
            <xd:ul>
                <xd:li>Template                    Explanation                                                                 </xd:li>
                <xd:li>spatialRepresentationType   Handles the gmd:spatialRepresentationType for the identificationInformation </xd:li>
            </xd:ul>
            <xd:p>
        Initial   Date      Change Request ID   Description
        MMC      1/8/2014                        Modified to work on the MRF Format </xd:p>
    </xd:desc> </xd:doc>

    <xsl:template name="spatialRepresentationType">
        <xsl:element name="gmd:spatialRepresentationType">
            <xsl:choose>
                <xsl:when test="/MRF/Spatial_Data_Organization_Information/Direct_Spatial_Reference_Method">
                    <xsl:element name="gmd:MD_SpatialRepresentationTypeCode">
                        <xsl:variable name="SpatRepType"
                            select="/MRF/Spatial_Data_Organization_Information/Direct_Spatial_Reference_Method"/>
                        <xsl:attribute name="codeList"
                            >http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_SpatialRepresentationTypeCode</xsl:attribute>
                        <xsl:attribute name="codeListValue">

                            <xsl:choose>
                                <xsl:when test="$SpatRepType='Vector'">vector</xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="/MRF/Spatial_Data_Organization_Information/Direct_Spatial_Reference_Method"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:attribute>
                        <!-- <xsl:comment>getting the value for the element!!!!!!!!!!!</xsl:comment> -->
                        <xsl:choose>
                            <xsl:when test="$SpatRepType='Vector'">vector</xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="/MRF/Spatial_Data_Organization_Information/Direct_Spatial_Reference_Method"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:element>
                </xsl:when>
              <!--  <xsl:otherwise>
                    <xsl:attribute name="nilReason">missing</xsl:attribute>
                </xsl:otherwise> -->
            </xsl:choose>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>
