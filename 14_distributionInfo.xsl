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
    <xsl:import href="../gpm2iso/06_contact.xsl"/>
    <xsl:import href="../gpm2iso/NGDAWebServices.xsl"/>
    <xsl:import href="../gpm2iso/RESTServices.xsl"/>
    
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p>gpm2iso/14_distributionInfo.xsl</xd:p>
            <xd:p><xd:b>Created on:</xd:b> Jan 17, 2017</xd:p>
            <xd:p><xd:b>Author:</xd:b> mccre004</xd:p>
            <xd:p></xd:p>
        </xd:desc>
    </xd:doc>
    
    <xsl:template name="gpm2GmdDistributionInfo">
        <xsl:element name="gmd:distributionInfo">
            <xsl:element name="gmd:MD_Distribution">
            <xsl:for-each select="/GPM/Distribution_Information/Standard_Order_Process/Digital_Form/Format_Name">
                <xsl:element name="gmd:distributionFormat">
                    <xsl:element name="gmd:MD_Format">
                    <xsl:element name="gmd:name">
                        <xsl:element name="gco:CharacterString"><xsl:value-of select="."/></xsl:element>
                    </xsl:element>
                    
               
                <xsl:choose>
                    <xsl:when test="../Format_Version_Date">
                        <xsl:element name="gmd:version">
                            <xsl:element name="gco:CharacterString"> <xsl:value-of select="../Format_Version_Date"/></xsl:element>
                        </xsl:element>
                    </xsl:when>
                    <xsl:when test="../Format_Version_Number">
                        <xsl:element name="gmd:version">
                            <xsl:element name="gco:CharacterString"> <xsl:value-of select="../Format_Version_Number"/></xsl:element>
                        </xsl:element>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:element name="gmd:version">
                            <xsl:attribute name="gco:nilReason">unknown</xsl:attribute>
                        </xsl:element>
                    </xsl:otherwise>
                </xsl:choose>
                    </xsl:element>
                </xsl:element>
            </xsl:for-each>
                <xsl:element name="gmd:distributor">
                    <xsl:element name="gmd:MD_Distributor">
                        <xsl:call-template name="gpm2GmdDisContact"/>
                        <xsl:element name="gmd:distributionOrderProcess">
                            <xsl:element name="gmd:MD_StandardOrderProcess">
                                <xsl:element name="gmd:fees">
                                    <xsl:element name="gco:CharacterString"><xsl:value-of select="/GPM/Distribution_Information[1]/Standard_Order_Process/Fees"/></xsl:element>
                                </xsl:element>
                                <xsl:if test="/GPM/Distribution_Information[1]/Standard_Order_Process[1]/Ordering_Instructions[1]">
                                <xsl:element name="gmd:orderingInstructions">
                                    <xsl:element name="gco:CharacterString"><xsl:value-of select="/GPM/Distribution_Information/Standard_Order_Process/Ordering_Instructions"/></xsl:element>
                                </xsl:element>
                                </xsl:if>
                            </xsl:element>
                        </xsl:element>
                    </xsl:element>
                </xsl:element>    
             <!--   <xsl:comment>In the for each!!!!!!!!!!!!!!!!</xsl:comment> --> 
                <xsl:for-each select="/GPM/Distribution_Information/Standard_Order_Process/Digital_Form">
                    <xsl:element name="gmd:transferOptions">
                        <xsl:element name="gmd:MD_DigitalTransferOptions">
                            <xsl:if test="./Transfer_Size">
                                <xsl:element name="gmd:transferSize">
                                    <xsl:element name="gco:Real"><xsl:value-of select="./Transfer_Size"/> </xsl:element>
                                </xsl:element>
                            </xsl:if>
                            <xsl:element name="gmd:onLine">
                                <xsl:element name="gmd:CI_OnlineResource">
                                    <xsl:element name="gmd:linkage">
                                        <xsl:element name="gmd:URL"> <xsl:value-of select="./Network_Address/Network_Resource_Name[1]"/></xsl:element>
                                    </xsl:element>
                                    <xsl:if test="./Network_Address/Network_Resource_Description">
                                        <xsl:element name="gmd:description">
                                            <xsl:element name="gco:CharacterString"><xsl:value-of select="../Network_Resource_Description"/></xsl:element>
                                        </xsl:element>
                                    </xsl:if>
                                    <xsl:element name="gmd:function">
                                        <xsl:element name="gmd:CI_OnLineFunctionCode">
                                            <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#CI_OnlineFunctionCode</xsl:attribute>
                                            <xsl:attribute name="codeListValue">download</xsl:attribute>download
                                        </xsl:element>
                                    </xsl:element>
                                </xsl:element>
                            </xsl:element>
                        </xsl:element>
                    </xsl:element>
                </xsl:for-each>
              <!--  <xsl:comment>outside the for each loop!!!!!!!!!!!!!!!!</xsl:comment> -->
                
                <xsl:if test="/GPM/FGDC_Required[1]/NGDA_Info[1]/GETMAP_URL[1]">
                <xsl:call-template name="WMSNGDA"/>
                </xsl:if>
                
                <xsl:if test="/GPM/FGDC_Required[1]/NGDA_Info[1]/REST_URL[1]">
                    <xsl:call-template name="RestNGDA"/>
                </xsl:if>
                
        </xsl:element>
        </xsl:element>
    </xsl:template>
    
</xsl:stylesheet>