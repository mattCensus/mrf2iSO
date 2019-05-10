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
            <xd:p>gpm2iso/10_spatialRepresentationInfo.xsl</xd:p>
            <xd:p><xd:b>Created on:</xd:b> Jan 6, 2017</xd:p>
            <xd:p><xd:b>Author:</xd:b> mccre004</xd:p>
            <xd:p></xd:p>
        </xd:desc>
    </xd:doc>
    
    <xsl:template name="gpm2GmdSpatialRepresentationInfo">
        <xsl:element name="gmd:spatialRepresentationInfo">
            <xsl:element name="gmd:MD_VectorSpatialRepresentation">
                <xsl:element name="gmd:geometricObjects">
                    <xsl:element name="gmd:MD_GeometricObjects">
                        <xsl:element name="gmd:geometricObjectType">
                            <xsl:element name="gmd:MD_GeometricObjectTypeCode">
                                <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_GeometricObjectTypeCode</xsl:attribute>
                               
                                    <!-- <xsl:value-of select="/GPM/Spatial_Data_Organization_Information/SDTS_Terms_Description/SDTS_Point_and_Vector_Object_Type"/> -->
                                    <xsl:variable name="SDTSVAR" select="/GPM/Spatial_Data_Organization_Information/SDTS_Terms_Description/SDTS_Point_and_Vector_Object_Type"/>
                                    <xsl:choose>
                                        <xsl:when test="$SDTSVAR = 'Point'"> 
                                            <xsl:attribute name="codeListValue">point</xsl:attribute>
                                        </xsl:when>
                                        <xsl:when test="$SDTSVAR = 'Entity point'">
                                            <xsl:attribute name="codeListValue">point</xsl:attribute>
                                        </xsl:when>
                                        <xsl:when test="$SDTSVAR = 'Label point'">
                                            <xsl:attribute name="codeListValue">point</xsl:attribute>
                                        </xsl:when>
                                        <xsl:when test="$SDTSVAR = 'Area point'">
                                            <xsl:attribute name="codeListValue">point</xsl:attribute>
                                        </xsl:when>
                                        <xsl:when test="$SDTSVAR ='Node, planar graph'">
                                            <xsl:attribute name="codeListValue">point</xsl:attribute>
                                        </xsl:when>
                                        <xsl:when test="$SDTSVAR ='Node, network'">
                                            <xsl:attribute name="codeListValue">point</xsl:attribute>
                                        </xsl:when>
                                        <xsl:when test="$SDTSVAR='String'">
                                            <xsl:attribute name="codeListValue">composite</xsl:attribute>
                                        </xsl:when>
                                        <xsl:when test="$SDTSVAR='Link'">
                                            <xsl:attribute name="codeListValue">curve</xsl:attribute>
                                        </xsl:when>
                                        <xsl:when test="$SDTSVAR='Complete chain'">
                                            <xsl:attribute name="codeListValue">composite</xsl:attribute>
                                        </xsl:when>
                                        <xsl:when test="$SDTSVAR='Area chain'">
                                            <xsl:attribute name="codeListValue">composite</xsl:attribute>
                                        </xsl:when>
                                        <xsl:when test="$SDTSVAR='Network chain, planar graph'">
                                            <xsl:attribute name="codeListValue">composite</xsl:attribute>
                                        </xsl:when>
                                        <xsl:when test="$SDTSVAR='Circular arc, three point center'">
                                            <xsl:attribute name="codeListValue">composite</xsl:attribute>
                                        </xsl:when>
                                        <xsl:when test="$SDTSVAR='Elliptical arc'">
                                            <xsl:attribute name="codeListValue">curve</xsl:attribute>
                                        </xsl:when>
                                        <xsl:when test="$SDTSVAR='Uniform B-spline'">
                                            <xsl:attribute name="codeListValue">curve</xsl:attribute>
                                        </xsl:when>
                                        <xsl:when test="$SDTSVAR='Piecewise Bezier'">
                                            <xsl:attribute name="codeListValue">curve</xsl:attribute>
                                        </xsl:when>
                                        <xsl:when test="$SDTSVAR='Ring with mixed composition'">
                                            <xsl:attribute name="codeListValue">curve</xsl:attribute>
                                        </xsl:when>
                                        <xsl:when test="$SDTSVAR='Ring composed of strings'">
                                            <xsl:attribute name="codeListValue">curve</xsl:attribute>
                                        </xsl:when>
                                        <xsl:when test="$SDTSVAR='Ring composed of chains'">
                                            <xsl:attribute name="codeListValue">curve</xsl:attribute>
                                        </xsl:when>
                                        <xsl:when test="$SDTSVAR='Ring composed of arcs'">
                                            <xsl:attribute name="codeListValue">curve</xsl:attribute>
                                        </xsl:when>
                                        <xsl:when test="$SDTSVAR='G-polygon'">
                                            <xsl:attribute name="codeListValue">surface</xsl:attribute>
                                        </xsl:when>
                                        <xsl:when test="$SDTSVAR='GT-polygon composed of rings'">
                                            <xsl:attribute name="codeListValue">surface</xsl:attribute>
                                        </xsl:when>
                                        <xsl:when test="$SDTSVAR='GT-polygon composed of chain'">
                                            <xsl:attribute name="codeListValue">surface</xsl:attribute>
                                        </xsl:when>
                                        <xsl:when test="$SDTSVAR='Universe polygon composed of rings'">
                                            <xsl:attribute name="codeListValue">surface</xsl:attribute>
                                        </xsl:when>
                                        <xsl:when test="$SDTSVAR='Universe polygon composed of chains'">
                                            <xsl:attribute name="codeListValue">surface</xsl:attribute>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="$SDTSVAR"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                
                            </xsl:element>
                        </xsl:element>
                        <xsl:element name="gmd:geometricObjectCount">
                            <xsl:element name="gco:Integer"><xsl:value-of select="/GPM/Spatial_Data_Organization_Information/SDTS_Terms_Description/Point_and_Vector_Object_Count"/></xsl:element>
                        </xsl:element>
                    </xsl:element>
                </xsl:element>
            </xsl:element>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>