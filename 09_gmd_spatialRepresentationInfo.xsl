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
        <!-- <xsl:variable name="SDTSPntVot" select="//metadata/spdoinfo/ptvctinf/sdtsterm/sdtstype"/> -->

        <xd:doc scope="stylesheet">
                <xd:p>mrf2ISO/09_gmd_spatialRepresentationInfo.xsl</xd:p>
                <xd:p>called by the mrf2ISO/mrf2ISOMaster.xsl template</xd:p>
                <xd:desc>
                        <xd:p><xd:b>Created on:</xd:b> Jan 7, 2014</xd:p>
                        <xd:p><xd:b>Author:</xd:b> Matthew McCready</xd:p>
                        <xd:ul>
                                <xd:li>Template                      Explanation                                           </xd:li>
                                <xd:li>SDTSListValueTemp             Handles the gmd:MD_GeometricObjectTypeCode element    </xd:li>  
                                <xd:li>spatialRepresentationInfo     Handles the gmd:MD_VectorSpatialRepresentation element</xd:li> 
                        </xd:ul>
                                <xd:p>
                                        Initial   Date         Description
                                        MMC      1/8/2014      Modified to work on the MRF Format. 
                                        MMC      2/2/2015      Modified the if to work with version 2.0 
                                        MMC      2/9/2017      Modified so that the comment does not appear for dbf files, which do not have a SDTS_Terms_Description element
                                </xd:p>
                </xd:desc>
        </xd:doc>

        <xsl:template name="SDTSListValueTemp">
                <xsl:variable name="SDTSPntVot"
                        select="/MRF/Spatial_Data_Organization_Information/SDTS_Terms_Description/SDTS_Point_and_Vector_Object_Type"/>
                <xsl:choose>
                        <xsl:when test="$SDTSPntVot='Point'">
                                <xsl:element name="gmd:geometricObjectType">
                                        <xsl:element name="gmd:MD_GeometricObjectTypeCode">
                                                <xsl:attribute name="codeList"
                                                  >http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_GeometricObjectTypeCode</xsl:attribute>
                                                <xsl:attribute name="codeListValue">point</xsl:attribute>
                                                <xsl:attribute name="codeSpace">004</xsl:attribute>
                                                point </xsl:element>
                                        <!-- gmd:geometricObjectsTypeCode -->
                                </xsl:element>
                                <!-- gmd:geometricObjectType -->
                        </xsl:when>
                        <xsl:when test="$SDTSPntVot='Entity point'">
                                <xsl:element name="gmd:geometricObjectType">
                                        <xsl:element name="gmd:MD_GeometricObjectTypeCode">
                                                <xsl:attribute name="codeList"
                                                  >http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_GeometricObjectTypeCode</xsl:attribute>
                                                <xsl:attribute name="codeListValue"
                                                  >point</xsl:attribute>
                                                <xsl:attribute name="codeSpace">004</xsl:attribute>
                                                point </xsl:element>
                                        <!-- gmd:geometricObjectsTypeCode -->
                                </xsl:element>
                                <!-- gmd:geometricObjectType -->
                        </xsl:when>
                        <xsl:when test="$SDTSPntVot='Label point'">
                                <xsl:element name="gmd:geometricObjectType">
                                        <xsl:element name="gmd:MD_GeometricObjectTypeCode">
                                                <xsl:attribute name="codeList"
                                                  >http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_GeometricObjectTypeCode</xsl:attribute>
                                                <xsl:attribute name="codeListValue"
                                                  >point</xsl:attribute>
                                                <xsl:attribute name="codeSpace">004</xsl:attribute>
                                                point </xsl:element>
                                        <!-- gmd:geometricObjectsTypeCode -->
                                </xsl:element>
                                <!-- gmd:geometricObjectType -->
                        </xsl:when>
                        <xsl:when test="$SDTSPntVot='Area Point'">
                                <xsl:element name="gmd:geometricObjectType">
                                        <xsl:element name="gmd:MD_GeometricObjectTypeCode">
                                                <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_GeometricObjectTypeCode</xsl:attribute>
                                                <xsl:attribute name="codeListValue">point</xsl:attribute>
                                                <xsl:attribute name="codeSpace">004</xsl:attribute>point </xsl:element>
                                        <!-- gmd:geometricObjectsTypeCode -->
                                </xsl:element>
                                <!-- gmd:geometricObjectType -->
                        </xsl:when>
                        <xsl:when test="$SDTSPntVot='Node, planar graph'">
                                <xsl:element name="gmd:geometricObjectType">
                                        <xsl:element name="gmd:MD_GeometricObjectTypeCode">
                                                <xsl:attribute name="codeList"
                                                  >http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_GeometricObjectTypeCode</xsl:attribute>
                                                <xsl:attribute name="codeListValue"
                                                  >surface</xsl:attribute>
                                                <xsl:attribute name="codeSpace">006</xsl:attribute>
                                                surface </xsl:element>
                                        <!-- gmd:geometricObjectsTypeCode -->
                                </xsl:element>
                                <!-- gmd:geometricObjectType -->

                        </xsl:when>
                        <xsl:when test="$SDTSPntVot='Node, network'">
                                <xsl:element name="gmd:geometricObjectType">
                                        <xsl:element name="gmd:MD_GeometricObjectTypeCode">
                                                <xsl:attribute name="codeList"
                                                  >http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_GeometricObjectTypeCode</xsl:attribute>
                                                <xsl:attribute name="codeListValue"
                                                  >surface</xsl:attribute>
                                                <xsl:attribute name="codeSpace">006</xsl:attribute>
                                                surface </xsl:element>
                                        <!-- gmd:geometricObjectsTypeCode -->
                                </xsl:element>
                                <!-- gmd:geometricObjectType -->
                        </xsl:when>
                        <xsl:when test="$SDTSPntVot='String'">
                                <xsl:element name="gmd:geometricObjectType">
                                        <xsl:element name="gmd:MD_GeometricObjectTypeCode">
                                                <xsl:attribute name="codeList"
                                                  >http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_GeometricObjectTypeCode</xsl:attribute>
                                                <xsl:attribute name="codeListValue"
                                                  >curve</xsl:attribute>
                                                <xsl:attribute name="codeSpace">003</xsl:attribute>
                                                curve </xsl:element>
                                        <!-- gmd:geometricObjectsTypeCode -->
                                </xsl:element>
                                <!-- gmd:geometricObjectType -->

                        </xsl:when>
                        <xsl:when test="$SDTSPntVot='LINK'">
                                <xsl:element name="gmd:geometricObjectType">
                                        <xsl:element name="gmd:MD_GeometricObjectTypeCode">
                                                <xsl:attribute name="codeList"
                                                  >http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_GeometricObjectTypeCode</xsl:attribute>
                                                <xsl:attribute name="codeListValue"
                                                  >curve</xsl:attribute>
                                                <xsl:attribute name="codeSpace">003</xsl:attribute>
                                                curve </xsl:element>
                                        <!-- gmd:geometricObjectsTypeCode -->
                                </xsl:element>
                                <!-- gmd:geometricObjectType -->
                        </xsl:when>
                        <xsl:when test="$SDTSPntVot='Complete chain'">
                                <xsl:element name="gmd:geometricObjectType">
                                        <xsl:element name="gmd:MD_GeometricObjectTypeCode">
                                                <xsl:attribute name="codeList"
                                                  >http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_GeometricObjectTypeCode</xsl:attribute>
                                                <xsl:attribute name="codeListValue"
                                                  >curve</xsl:attribute>
                                                <xsl:attribute name="codeSpace">003</xsl:attribute>
                                                curve </xsl:element>
                                        <!-- gmd:geometricObjectsTypeCode -->
                                </xsl:element>
                                <!-- gmd:geometricObjectType -->
                        </xsl:when>
                        <xsl:when test="$SDTSPntVot='Area chain'">
                                <xsl:element name="gmd:geometricObjectType">
                                        <xsl:element name="gmd:MD_GeometricObjectTypeCode">
                                                <xsl:attribute name="codeList"
                                                  >http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_GeometricObjectTypeCode</xsl:attribute>
                                                <xsl:attribute name="codeListValue"
                                                  >composite</xsl:attribute>
                                                <xsl:attribute name="codeSpace">002</xsl:attribute>
                                                curve </xsl:element>
                                        <!-- gmd:geometricObjectsTypeCode -->
                                </xsl:element>
                                <!-- gmd:geometricObjectType -->
                        </xsl:when>
                        <xsl:when test="$SDTSPntVot='Network chain, planar graph'">
                                <xsl:element name="gmd:geometricObjectType">
                                        <xsl:element name="gmd:MD_GeometricObjectTypeCode">
                                                <xsl:attribute name="codeList"
                                                  >http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_GeometricObjectTypeCode</xsl:attribute>
                                                <xsl:attribute name="codeListValue"
                                                  >surface</xsl:attribute>
                                                <xsl:attribute name="codeSpace">006</xsl:attribute>
                                                surface </xsl:element>
                                        <!-- gmd:geometricObjectsTypeCode -->
                                </xsl:element>
                                <!-- gmd:geometricObjectType -->
                        </xsl:when>
                        <xsl:when test="$SDTSPntVot='Network chain, nonplanar graph'">
                                <xsl:element name="gmd:geometricObjectType">
                                        <xsl:element name="gmd:MD_GeometricObjectTypeCode">
                                                <xsl:attribute name="codeList"
                                                  >http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_GeometricObjectTypeCode</xsl:attribute>
                                                <xsl:attribute name="codeListValue"
                                                  >composite</xsl:attribute>
                                                <xsl:attribute name="codeSpace">002</xsl:attribute>
                                                composite </xsl:element>
                                        <!-- gmd:geometricObjectsTypeCode -->
                                </xsl:element>
                                <!-- gmd:geometricObjectType -->

                        </xsl:when>
                        <xsl:when test="$SDTSPntVot='Circular arc, three point center'">
                                <xsl:element name="gmd:geometricObjectType">
                                        <xsl:element name="gmd:MD_GeometricObjectTypeCode">
                                                <xsl:attribute name="codeList"
                                                  >http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_GeometricObjectTypeCode</xsl:attribute>
                                                <xsl:attribute name="codeListValue"
                                                  >composite</xsl:attribute>
                                                <xsl:attribute name="codeSpace">002</xsl:attribute>
                                                composite </xsl:element>
                                        <!-- gmd:geometricObjectsTypeCode -->
                                </xsl:element>
                                <!-- gmd:geometricObjectType -->
                        </xsl:when>
                        <xsl:when test="$SDTSPntVot='Elliptical arc'">
                                <xsl:element name="gmd:geometricObjectType">
                                        <xsl:element name="gmd:MD_GeometricObjectTypeCode">
                                                <xsl:attribute name="codeList"
                                                  >http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_GeometricObjectTypeCode</xsl:attribute>
                                                <xsl:attribute name="codeListValue">curve</xsl:attribute>
                                                <xsl:attribute name="codeSpace">003</xsl:attribute>
                                                curve </xsl:element>
                                        <!-- gmd:geometricObjectsTypeCode -->
                                </xsl:element>
                                <!-- gmd:geometricObjectType -->

                        </xsl:when>
                        <xsl:when test="$SDTSPntVot='Uniform B-spline'">
                                <xsl:element name="gmd:geometricObjectType">
                                        <xsl:element name="gmd:MD_GeometricObjectTypeCode">
                                                <xsl:attribute name="codeList"
                                                  >http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_GeometricObjectTypeCode</xsl:attribute>
                                                <xsl:attribute name="codeListValue">curve</xsl:attribute>
                                                <xsl:attribute name="codeSpace">003</xsl:attribute>
                                                curve </xsl:element>
                                        <!-- gmd:geometricObjectsTypeCode -->
                                </xsl:element>
                                <!-- gmd:geometricObjectType -->

                        </xsl:when>
                        <xsl:when test="$SDTSPntVot='Piecewise Bezier'">
                                <xsl:element name="gmd:geometricObjectType">
                                        <xsl:element name="gmd:MD_GeometricObjectTypeCode">
                                                <xsl:attribute name="codeList"
                                                  >http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_GeometricObjectTypeCode</xsl:attribute>
                                                <xsl:attribute name="codeListValue"
                                                  >curve</xsl:attribute>
                                                <xsl:attribute name="codeSpace">003</xsl:attribute>
                                                curve </xsl:element>
                                        <!-- gmd:geometricObjectsTypeCode -->
                                </xsl:element>
                                <!-- gmd:geometricObjectType -->
                        </xsl:when>
                        <xsl:when test="$SDTSPntVot='Ring with mixed composition'">
                                <xsl:element name="gmd:geometricObjectType">
                                        <xsl:element name="gmd:MD_GeometricObjectTypeCode">
                                                <xsl:attribute name="codeList"
                                                  >http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_GeometricObjectTypeCode</xsl:attribute>
                                                <xsl:attribute name="codeListValue"
                                                  >composite</xsl:attribute>
                                                <xsl:attribute name="codeSpace">002</xsl:attribute>
                                                composite </xsl:element>
                                        <!-- gmd:geometricObjectsTypeCode -->
                                </xsl:element>
                                <!-- gmd:geometricObjectType -->
                        </xsl:when>
                        <xsl:when test="$SDTSPntVot='Ring composed of strings'">
                                <xsl:element name="gmd:geometricObjectType">
                                        <xsl:element name="gmd:MD_GeometricObjectTypeCode">
                                                <xsl:attribute name="codeList"
                                                  >http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_GeometricObjectTypeCode</xsl:attribute>
                                                <xsl:attribute name="codeListValue"
                                                  >composite</xsl:attribute>
                                                <xsl:attribute name="codeSpace">002</xsl:attribute>
                                                composite </xsl:element>
                                        <!-- gmd:geometricObjectsTypeCode -->
                                </xsl:element>
                                <!-- gmd:geometricObjectType -->

                        </xsl:when>
                        <xsl:when test="$SDTSPntVot='Ring composed of chains'">
                                <xsl:element name="gmd:geometricObjectType">
                                        <xsl:element name="gmd:MD_GeometricObjectTypeCode">
                                                <xsl:attribute name="codeList"
                                                  >http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_GeometricObjectTypeCode</xsl:attribute>
                                                <xsl:attribute name="codeListValue"
                                                  >composite</xsl:attribute>
                                                <xsl:attribute name="codeSpace">002</xsl:attribute>
                                                composite </xsl:element>
                                        <!-- gmd:geometricObjectsTypeCode -->
                                </xsl:element>
                                <!-- gmd:geometricObjectType -->
                        </xsl:when>
                        <xsl:when test="$SDTSPntVot='Ring composed of arcs'">
                                <xsl:element name="gmd:geometricObjectType">
                                        <xsl:element name="gmd:MD_GeometricObjectTypeCode">
                                                <xsl:attribute name="codeList"
                                                  >http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_GeometricObjectTypeCode</xsl:attribute>
                                                <xsl:attribute name="codeListValue"
                                                  >composite</xsl:attribute>
                                                <xsl:attribute name="codeSpace">002</xsl:attribute>
                                                composite </xsl:element>
                                        <!-- gmd:geometricObjectsTypeCode -->
                                </xsl:element>
                                <!-- gmd:geometricObjectType -->

                        </xsl:when>
                        <xsl:when test="$SDTSPntVot='G-polygon'">
                                <xsl:element name="gmd:geometricObjectType">
                                        <xsl:element name="gmd:MD_GeometricObjectTypeCode">
                                                <xsl:attribute name="codeList"
                                                  >http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_GeometricObjectTypeCode</xsl:attribute>
                                                <xsl:attribute name="codeListValue"
                                                  >complex</xsl:attribute>
                                                <xsl:attribute name="codeSpace">001</xsl:attribute>
                                                complex </xsl:element>
                                        <!-- gmd:geometricObjectsTypeCode -->
                                </xsl:element>
                                <!-- gmd:geometricObjectType -->
                        </xsl:when>
                        <xsl:when test="$SDTSPntVot='GT-polygon composed of rings'">
                                <xsl:element name="gmd:geometricObjectType">
                                        <xsl:element name="gmd:MD_GeometricObjectTypeCode">
                                                <xsl:attribute name="codeList"
                                                  >http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_GeometricObjectTypeCode</xsl:attribute>
                                                <xsl:attribute name="codeListValue"
                                                  >complex</xsl:attribute>
                                                <xsl:attribute name="codeSpace">001</xsl:attribute>
                                                complex </xsl:element>
                                        <!-- gmd:geometricObjectsTypeCode -->
                                </xsl:element>
                                <!-- gmd:geometricObjectType -->

                        </xsl:when>
                        <xsl:when test="$SDTSPntVot='GT-polygon composed of chains'">
                                <xsl:element name="gmd:geometricObjectType">
                                        <xsl:element name="gmd:MD_GeometricObjectTypeCode">
                                                <xsl:attribute name="codeList"
                                                  >http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_GeometricObjectTypeCode</xsl:attribute>
                                                <xsl:attribute name="codeListValue"
                                                  >complex</xsl:attribute>
                                                <xsl:attribute name="codeSpace">001</xsl:attribute>
                                                complex </xsl:element>
                                        <!-- gmd:geometricObjectsTypeCode -->
                                </xsl:element>
                                <!-- gmd:geometricObjectType -->
                        </xsl:when>
                        <xsl:when test="$SDTSPntVot='Universe polygon composed of rings'">
                                <xsl:element name="gmd:geometricObjectType">
                                        <xsl:element name="gmd:MD_GeometricObjectTypeCode">
                                                <xsl:attribute name="codeList"
                                                  >http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_GeometricObjectTypeCode</xsl:attribute>
                                                <xsl:attribute name="codeListValue"
                                                  >complex</xsl:attribute>
                                                <xsl:attribute name="codeSpace">001</xsl:attribute>
                                                complex </xsl:element>
                                        <!-- gmd:geometricObjectsTypeCode -->
                                </xsl:element>
                                <!-- gmd:geometricObjectType -->
                        </xsl:when>
                        <xsl:when test="$SDTSPntVot='Universe polygon composed of chains'">
                                <xsl:element name="gmd:geometricObjectType">
                                        <xsl:element name="gmd:MD_GeometricObjectTypeCode">
                                                <xsl:attribute name="codeList"
                                                  >http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_GeometricObjectTypeCode</xsl:attribute>
                                                <xsl:attribute name="codeListValue"
                                                  >complex</xsl:attribute>
                                                <xsl:attribute name="codeSpace">001</xsl:attribute>
                                                complex </xsl:element>
                                        <!-- gmd:geometricObjectsTypeCode -->
                                </xsl:element>
                                <!-- gmd:geometricObjectType -->
                        </xsl:when>
                </xsl:choose>
        </xsl:template>

        <xsl:template name="spatialRepresentationInfo" match="/">
                
                <xsl:if test="/MRF/Spatial_Data_Organization_Information/SDTS_Terms_Description">
                        <xsl:text>&#10;</xsl:text>
                        <xsl:comment> This is the ptvctinf/sdtsterm/sdtstype from section 3 of the FGDC Standard (Spatial Data Organization) </xsl:comment>
                        <xsl:text>&#10;</xsl:text>
                <xsl:element name="gmd:spatialRepresentationInfo">
                        <!-- <xsl:comment> comment 1  </xsl:comment> -->
                        <xsl:element name="gmd:MD_VectorSpatialRepresentation">
                                <!-- <xsl:comment> comment 2  </xsl:comment> -->
                                <xsl:element name="gmd:geometricObjects">

                                        <!-- getting the values for the codeListValue and codeSpace attributes -->
                                        <!-- These values are based on the SDTS Point and Vector Object Type FGDC element (spdoinfo/ptvctinf/sdtstype) -->
                                        <!-- MD_GeometricObjects -->

                                        <xsl:element name="gmd:MD_GeometricObjects">

                                                <xsl:if
                                                  test="/MRF/Spatial_Data_Organization_Information/SDTS_Terms_Description/SDTS_Point_and_Vector_Object_Type">
                                                  <xsl:call-template name="SDTSListValueTemp"/>
                                                </xsl:if>

                                                <xsl:if
                                                  test="/MRF/Spatial_Data_Organization_Information/SDTS_Terms_Description/Point_and_Vector_Object_Count">
                                                  <xsl:element name="gmd:geometricObjectCount">
                                                  <xsl:element name="gco:Integer">
                                                  <xsl:apply-templates
                                                  select="/MRF/Spatial_Data_Organization_Information/SDTS_Terms_Description/Point_and_Vector_Object_Count"
                                                  />
                                                  </xsl:element>
                                                  <!-- gco:Integer -->
                                                  </xsl:element>
                                                  <!-- gmd:geometricObjectCount -->
                                                </xsl:if>

                                        </xsl:element>
                                        <!-- gmd:geometricObjectsType -->


                                </xsl:element>
                                <!-- gmd:geometricObjects -->
                        </xsl:element>
                        <!-- gmd:MD_VectorSpatialRepresentation -->
                </xsl:element>
                <!-- gmd:spatialRepresentationInfo -->

</xsl:if>
        </xsl:template>
</xsl:stylesheet>
