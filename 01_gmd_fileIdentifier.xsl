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
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p>mrf2ISO/01_gmd_fileIdentifier.xsl</xd:p>
            <xd:p> called by the mrf2ISO/mrf2ISOMaster.xsl template</xd:p>
            <xd:p><xd:b>Created on:</xd:b> Jan 7, 2014</xd:p>
            <xd:p><xd:b>Author:</xd:b> Matthew McCready</xd:p>
            <xd:p/>
        </xd:desc>
        <xd:ul>
            <xd:li>Template Explanation </xd:li>
            <xd:li>gmdfileIdentifier Handles the gmd:fileIdentifier element</xd:li>
        </xd:ul>
        <xd:p> Initial Date      Description
               MMc     4/13/2015 Inserted a choose structure so that KML and Shp Iso files have the correct file name. They now end in either ".shp.iso.xml" or
                                 ".kml.iso.xml". 
        </xd:p>
    </xd:doc>
    <xsl:output method="xml" version="1.0" encoding="ISO-8859-1" indent="yes"
        omit-xml-declaration="yes"/>

    <xsl:template name="gmdfileIdentifier">
        <xsl:element name="gmd:fileIdentifier">

            <xsl:variable name="mrfFileId"
                select="/MRF/Metadata_Reference_Information/Metadata_File_Identifier"/>
            <xsl:variable name="preXML" select="substring-before($mrfFileId,'.xml')"/>
            <!--  
            <xsl:comment>mrfFileId:<xsl:value-of select="$mrfFileId"/></xsl:comment>
            <xsl:comment>preXML: <xsl:value-of select="$preXML"/></xsl:comment>
            <xsl:text>         
            </xsl:text>-->

            <xsl:choose>
                <xsl:when test="/MRF/Distribution_Information[1]/Standard_Order_Process[1]/Digital_Form[1]/Format_Name[1] ='KML'">

                    <xsl:choose>
                        <xsl:when test="contains($preXML,'kml')">
                            <xsl:variable name="finalKml" select="concat($preXML,'.iso.xml')"/>
                            <xsl:element name="gco:CharacterString"><xsl:value-of select="$finalKml"/></xsl:element>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:variable name="finalKml" select="concat($preXML,'.kml.iso.xml')"/>
                            <xsl:element name="gco:CharacterString"><xsl:value-of select="$finalKml"/></xsl:element>
                        </xsl:otherwise>
                    </xsl:choose>
                   <!--   <xsl:comment>In the KML!!!!!!!!!!!!!</xsl:comment>-->
                    <xsl:text>         
                 </xsl:text>
                  
                </xsl:when>
                <xsl:otherwise>
                    <!--<xsl:comment>In the otherwise (shapefile)</xsl:comment>-->


                    <xsl:choose>
                        <xsl:when test="contains($preXML,'shp')">
                            <xsl:variable name="finalShp" select="concat($preXML, '.iso.xml')"/>
                            <xsl:element name="gco:CharacterString"><xsl:value-of select="$finalShp"/></xsl:element>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:variable name="finalShp" select="concat($preXML, '.shp.iso.xml')"/>
                            <xsl:element name="gco:CharacterString"><xsl:value-of select="$finalShp"/></xsl:element>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>
