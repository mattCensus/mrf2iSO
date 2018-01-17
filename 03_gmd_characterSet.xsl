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
        <xd:p>mrf2ISO/03_gmd_characterSet.xsl</xd:p>
        <xd:p>called by the mrf2ISO/mrf2ISOMaster.xsl template</xd:p>
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Jan 7, 2014</xd:p>
            <xd:p><xd:b>Author:</xd:b> Matthew McCready</xd:p>
            <xd:ul>
                <xd:li>Template                              Explanation                                                       </xd:li>
                <xd:li>gmd_characterSet                      Handles the gmd:characterSet element (duplicate)                  </xd:li>
                <xd:li>Metadata_Character_Set                Handles the gmd:characterSet element (duplicate)                  </xd:li>
                <xd:li>Metadata_Character_Set_CodeSpace      Handles the code for the codespace for the Metadata_Character_Set </xd:li>
            </xd:ul>
            <xd:p>
                Initial   Date      Change Request ID   Description
                MMC      1/8/2014                       Modified to work on the MRF Format. 
                MMC      6/17/2015                      Modified the codeListValue from 8859part1 to utf8
            </xd:p>
        </xd:desc>
    </xd:doc>

    <xsl:template name="gmd_characterSet">
        <xsl:comment>In the gmd_characterSet template!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!</xsl:comment>
         <xsl:variable name="CharSet" select="/MRF/Metadata_Reference_Information/Metadata_Character_Set"/>
         <xsl:comment> CharSet <xsl:value-of select="$CharSet"/></xsl:comment>             
        <xsl:choose>
            <xsl:when test="/MRF/Metadata_Reference_Information[1]/Metadata_Character_Set[1]">
                <xsl:comment> In the when!!!!!!!!!!!!!!!!!</xsl:comment>
                <!--  <xsl:attribute name="codeListValue"><xsl:value-of select="/MRF/Identification_Information/Data_Set_Character_Set"/></xsl:attribute>-->
                <xsl:element name="gmd:characterSet">
                    <xsl:element name="gmd:MD_CharacterSetCode">
                        <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_CharacterSetCode</xsl:attribute>
                        <xsl:attribute name="codeListValue"><xsl:value-of select="/MRF/Metadata_Reference_Information[1]/Metadata_Character_Set[1]"/></xsl:attribute>
                         <xsl:attribute name="codeSpace"><xsl:call-template name="Metadata_Character_Set_CodeSpace"/></xsl:attribute>
                        <xsl:value-of select="/MRF/Metadata_Reference_Information[1]/Metadata_Character_Set[1]"/>
                    </xsl:element>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="gmd:characterSet">
                    <xsl:element name="gmd:MD_CharacterSetCode">
                        <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_CharacterSetCode</xsl:attribute>
                        <xsl:attribute name="codeListValue">utf8</xsl:attribute>
                        <xsl:attribute name="codeSpace">006</xsl:attribute>
                    </xsl:element>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template name="Metadata_Character_Set">
        <xsl:comment>In the Metadata_Character_Set template!!!!!!!!!!!!!!!!!!!!!!!!!!</xsl:comment>
        <xsl:choose>
            <xsl:when test="/MRF/Identification_Information/Data_Set_Character_Set">
                <xsl:element name="gmd:characterSet">
                    <xsl:element name="gmd:MD_CharacterSetCode">
                        <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_CharacterSetCode</xsl:attribute>
                        <xsl:attribute name="codeListValue"><xsl:value-of select="/MRF/Identification_Information/Data_Set_Character_Set"/></xsl:attribute>
                        <xsl:attribute name="codeSpace"><xsl:call-template name="Metadata_Character_Set_CodeSpace"/></xsl:attribute>
                        
                    </xsl:element>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="gmd:characterSet">
                    <xsl:element name="gmd:MD_CharacterSetCode">
                        <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_CharacterSetCode</xsl:attribute>
                        <xsl:attribute name="codeListValue">utf8</xsl:attribute>
                        <xsl:attribute name="codeSpace">004</xsl:attribute>
                    </xsl:element>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template name="Metadata_Character_Set_CodeSpace">
        <xsl:comment>In the Metadata_Character_Set_CodeSpace template!!!!!!!!!!!!!!!!!!!!!!!!!!!!!</xsl:comment>
        <xsl:variable name="CharSet" select="/MRF/Metadata_Reference_Information/Metadata_Character_Set"/>
        <xsl:comment> CharSet <xsl:value-of select="$CharSet"/></xsl:comment>
        <xsl:choose>
            
            <xsl:when test="$CharSet = 'ucs2'">
                <xsl:attribute name="codeSpace">001</xsl:attribute>
            </xsl:when>
            
            <xsl:when test="$CharSet = 'ucs4'">
                <xsl:attribute name="codeSpace">002</xsl:attribute>
            </xsl:when>
            
            <xsl:when test="$CharSet = 'utf7'">
                <xsl:attribute name="codeSpace">003</xsl:attribute>
            </xsl:when>
            
            <xsl:when test="$CharSet = 'utf8'">
                <xsl:attribute name="codeSpace">004</xsl:attribute>
            </xsl:when>
            
            <xsl:when test="$CharSet='UTF-8'">
                <xsl:attribute name="codeSpace">004</xsl:attribute>
            </xsl:when>
            
            <xsl:when test="$CharSet = 'utf16'">
                <xsl:attribute name="codeSpace">005</xsl:attribute>
            </xsl:when>
            
            <xsl:when test="$CharSet = '8859part1'">
                <xsl:attribute name="codeSpace">006</xsl:attribute>
            </xsl:when>
            
            <xsl:when test="$CharSet = '8859part2'">
                <xsl:attribute name="codeSpace">007</xsl:attribute>
            </xsl:when>
            
            <xsl:when test="$CharSet = '8859part3'">
                <xsl:attribute name="codeSpace">008</xsl:attribute>
            </xsl:when>
            
            <xsl:when test="$CharSet = '8859part4'">
                <xsl:attribute name="codeSpace">009</xsl:attribute>
            </xsl:when>
            
            <xsl:when test="$CharSet = '8859part5'">
                <xsl:attribute name="codeSpace">010</xsl:attribute>
            </xsl:when>
            
            <xsl:when test="$CharSet = '8859part6'">
                <xsl:attribute name="codeSpace">011</xsl:attribute>
            </xsl:when>
            
            <xsl:when test="$CharSet = '8859part7'">
                <xsl:attribute name="codeSpace">012</xsl:attribute>
            </xsl:when>
            
            <xsl:when test="$CharSet = '8859part8'">
                <xsl:attribute name="codeSpace">013</xsl:attribute>
            </xsl:when>
            
            <xsl:when test="$CharSet = '8859part9'">
                <xsl:attribute name="codeSpace">014</xsl:attribute>
            </xsl:when>
            
            <xsl:when test="$CharSet = '8859part10'">
                <xsl:attribute name="codeSpace">015</xsl:attribute>
            </xsl:when>
            
            <xsl:when test="$CharSet = '8859part11'">
                <xsl:attribute name="codeSpace">016</xsl:attribute>
            </xsl:when>
            
            <xsl:when test="$CharSet = '8859part13'">
                <xsl:attribute name="codeSpace">018</xsl:attribute>
            </xsl:when>
            
            <xsl:when test="$CharSet = '8859part14'">
                <xsl:attribute name="codeSpace">019</xsl:attribute>
            </xsl:when>
            
            <xsl:when test="$CharSet = '8859part15'">
                <xsl:attribute name="codeSpace">020</xsl:attribute>
            </xsl:when>
            
            <xsl:when test="$CharSet = '8859part16'">
                <xsl:attribute name="codeSpace">021</xsl:attribute>
            </xsl:when>
            
            <xsl:when test="$CharSet = 'jis'">
                <xsl:attribute name="codeSpace">022</xsl:attribute>
            </xsl:when>
            
            <xsl:when test="$CharSet = 'shiftJIS'">
                <xsl:attribute name="codeSpace">023</xsl:attribute>
            </xsl:when>
            
            <xsl:when test="$CharSet = 'eucJP'">
                <xsl:attribute name="codeSpace">024</xsl:attribute>
            </xsl:when>
            
            <xsl:when test="$CharSet = 'usAscii'">
                <xsl:attribute name="codeSpace">025</xsl:attribute>
            </xsl:when>
            
            <xsl:when test="$CharSet = 'ebcdic'">
                <xsl:attribute name="codeSpace">026</xsl:attribute>
            </xsl:when>
            
            <xsl:when test="$CharSet = 'eucKR'">
                <xsl:attribute name="codeSpace">027</xsl:attribute>
            </xsl:when>
            
            <xsl:when test="$CharSet = 'big5'">
                <xsl:attribute name="codeSpace">028</xsl:attribute>
            </xsl:when>
            
            <xsl:when test="$CharSet = 'GB2312'">
                <xsl:attribute name="codeSpace">029</xsl:attribute>
            </xsl:when>
            
            <xsl:otherwise>
                <xsl:attribute name="codeSpace">999</xsl:attribute>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template name="gmd_characterSetMeta">
         <xsl:variable name="CharSet" select="/MRF/Metadata_Reference_Information/Metadata_Character_Set"/>
            <xsl:comment> CharSet <xsl:value-of select="$CharSet"/></xsl:comment>
        <xsl:choose>
           
            <xsl:when test="$CharSet = 'ucs2'">
                <xsl:element name="gmd:characterSet">
                    <xsl:element name="gmd:MD_CharacterSetCode">
                        <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_CharacterSetCode</xsl:attribute>
                        <xsl:attribute name="codeListValue"><xsl:value-of select="/MRF/Metadata_Reference_Information[1]/Metadata_Character_Set[1]"/></xsl:attribute>
                        <xsl:attribute name="codeSpace">001</xsl:attribute>
                    </xsl:element>
                </xsl:element>
            </xsl:when>
            
            <xsl:when test="$CharSet = 'ucs4'">
                <xsl:element name="gmd:characterSet">
                    <xsl:element name="gmd:MD_CharacterSetCode">
                        <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_CharacterSetCode</xsl:attribute>
                        <xsl:attribute name="codeListValue"><xsl:value-of select="/MRF/Metadata_Reference_Information[1]/Metadata_Character_Set[1]"/></xsl:attribute>
                        <xsl:attribute name="codeSpace">002</xsl:attribute>
                    </xsl:element>
                </xsl:element>
            </xsl:when>
            
            <xsl:when test="$CharSet = 'utf7'">
                <xsl:element name="gmd:characterSet">
                    <xsl:element name="gmd:MD_CharacterSetCode">
                        <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_CharacterSetCode</xsl:attribute>
                        <xsl:attribute name="codeListValue"><xsl:value-of select="/MRF/Metadata_Reference_Information[1]/Metadata_Character_Set[1]"/></xsl:attribute>
                        <xsl:attribute name="codeSpace">003</xsl:attribute>
                    </xsl:element>
                </xsl:element>
            </xsl:when>
            
            <xsl:when test="$CharSet = 'utf8'">
                <xsl:element name="gmd:characterSet">
                    <xsl:element name="gmd:MD_CharacterSetCode">
                        <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_CharacterSetCode</xsl:attribute>
                        <xsl:attribute name="codeListValue"><xsl:value-of select="/MRF/Metadata_Reference_Information[1]/Metadata_Character_Set[1]"/></xsl:attribute>
                        <xsl:attribute name="codeSpace">004</xsl:attribute>
                    </xsl:element>
                </xsl:element>
            </xsl:when>
            
            <xsl:when test="$CharSet='UTF-8'">
                <xsl:element name="gmd:characterSet">
                    <xsl:element name="gmd:MD_CharacterSetCode">
                        <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_CharacterSetCode</xsl:attribute>
                        <xsl:attribute name="codeListValue"><xsl:value-of select="/MRF/Metadata_Reference_Information[1]/Metadata_Character_Set[1]"/></xsl:attribute>
                        <xsl:attribute name="codeSpace">004</xsl:attribute>
                    </xsl:element>
                </xsl:element>
            </xsl:when>
            
            <xsl:when test="$CharSet = 'utf16'">
                <xsl:element name="gmd:characterSet">
                    <xsl:element name="gmd:MD_CharacterSetCode">
                        <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_CharacterSetCode</xsl:attribute>
                        <xsl:attribute name="codeListValue"><xsl:value-of select="/MRF/Metadata_Reference_Information[1]/Metadata_Character_Set[1]"/></xsl:attribute>
                        <xsl:attribute name="codeSpace">005</xsl:attribute>
                    </xsl:element>
                </xsl:element>
            </xsl:when>
            
            <xsl:when test="$CharSet = '8859part1'">
                <xsl:element name="gmd:characterSet">
                    <xsl:element name="gmd:MD_CharacterSetCode">
                        <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_CharacterSetCode</xsl:attribute>
                        <xsl:attribute name="codeListValue"><xsl:value-of select="/MRF/Metadata_Reference_Information[1]/Metadata_Character_Set[1]"/></xsl:attribute>
                        <xsl:attribute name="codeSpace">006</xsl:attribute>
                    </xsl:element>
                </xsl:element>
            </xsl:when>
            
            <xsl:when test="$CharSet = '8859part2'">
                <xsl:element name="gmd:characterSet">
                    <xsl:element name="gmd:MD_CharacterSetCode">
                        <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_CharacterSetCode</xsl:attribute>
                        <xsl:attribute name="codeListValue"><xsl:value-of select="/MRF/Metadata_Reference_Information[1]/Metadata_Character_Set[1]"/></xsl:attribute>
                        <xsl:attribute name="codeSpace">007</xsl:attribute>
                    </xsl:element>
                </xsl:element>
            </xsl:when>
            
            <xsl:when test="$CharSet = '8859part3'">
                <xsl:element name="gmd:characterSet">
                    <xsl:element name="gmd:MD_CharacterSetCode">
                        <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_CharacterSetCode</xsl:attribute>
                        <xsl:attribute name="codeListValue"><xsl:value-of select="/MRF/Metadata_Reference_Information[1]/Metadata_Character_Set[1]"/></xsl:attribute>
                        <xsl:attribute name="codeSpace">008</xsl:attribute>
                    </xsl:element>
                </xsl:element>
            </xsl:when>
            
            <xsl:when test="$CharSet = '8859part4'">
                <xsl:element name="gmd:characterSet">
                    <xsl:element name="gmd:MD_CharacterSetCode">
                        <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_CharacterSetCode</xsl:attribute>
                        <xsl:attribute name="codeListValue"><xsl:value-of select="/MRF/Metadata_Reference_Information[1]/Metadata_Character_Set[1]"/></xsl:attribute>
                        <xsl:attribute name="codeSpace">009</xsl:attribute>
                    </xsl:element>
                </xsl:element>
            </xsl:when>
            
            <xsl:when test="$CharSet = '8859part5'">
                <xsl:element name="gmd:characterSet">
                    <xsl:element name="gmd:MD_CharacterSetCode">
                        <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_CharacterSetCode</xsl:attribute>
                        <xsl:attribute name="codeListValue"><xsl:value-of select="/MRF/Metadata_Reference_Information[1]/Metadata_Character_Set[1]"/></xsl:attribute>
                        <xsl:attribute name="codeSpace">010</xsl:attribute>
                    </xsl:element>
                </xsl:element>
            </xsl:when>
            
            <xsl:when test="$CharSet = '8859part6'">
                <xsl:element name="gmd:characterSet">
                    <xsl:element name="gmd:MD_CharacterSetCode">
                        <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_CharacterSetCode</xsl:attribute>
                        <xsl:attribute name="codeListValue"><xsl:value-of select="/MRF/Metadata_Reference_Information[1]/Metadata_Character_Set[1]"/></xsl:attribute>
                        <xsl:attribute name="codeSpace">011</xsl:attribute>
                    </xsl:element>
                </xsl:element>
            </xsl:when>
            
            <xsl:when test="$CharSet = '8859part7'">
                <xsl:element name="gmd:characterSet">
                    <xsl:element name="gmd:MD_CharacterSetCode">
                        <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_CharacterSetCode</xsl:attribute>
                        <xsl:attribute name="codeListValue"><xsl:value-of select="/MRF/Metadata_Reference_Information[1]/Metadata_Character_Set[1]"/></xsl:attribute>
                        <xsl:attribute name="codeSpace">012</xsl:attribute>
                    </xsl:element>
                </xsl:element>
            </xsl:when>
            
            <xsl:when test="$CharSet = '8859part8'">
                <xsl:element name="gmd:characterSet">
                    <xsl:element name="gmd:MD_CharacterSetCode">
                        <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_CharacterSetCode</xsl:attribute>
                        <xsl:attribute name="codeListValue"><xsl:value-of select="/MRF/Metadata_Reference_Information[1]/Metadata_Character_Set[1]"/></xsl:attribute>
                        <xsl:attribute name="codeSpace">013</xsl:attribute>
                    </xsl:element>
                </xsl:element>
            </xsl:when>
            
            <xsl:when test="$CharSet = '8859part9'">
                <xsl:element name="gmd:characterSet">
                    <xsl:element name="gmd:MD_CharacterSetCode">
                        <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_CharacterSetCode</xsl:attribute>
                        <xsl:attribute name="codeListValue"><xsl:value-of select="/MRF/Metadata_Reference_Information[1]/Metadata_Character_Set[1]"/></xsl:attribute>
                        <xsl:attribute name="codeSpace">014</xsl:attribute>
                    </xsl:element>
                </xsl:element>
            </xsl:when>
            
            <xsl:when test="$CharSet = '8859part10'">
                <xsl:element name="gmd:characterSet">
                    <xsl:element name="gmd:MD_CharacterSetCode">
                        <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_CharacterSetCode</xsl:attribute>
                        <xsl:attribute name="codeListValue"><xsl:value-of select="/MRF/Metadata_Reference_Information[1]/Metadata_Character_Set[1]"/></xsl:attribute>
                        <xsl:attribute name="codeSpace">015</xsl:attribute>
                    </xsl:element>
                </xsl:element>
            </xsl:when>
            
            <xsl:when test="$CharSet = '8859part11'">
                <xsl:element name="gmd:characterSet">
                    <xsl:element name="gmd:MD_CharacterSetCode">
                        <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_CharacterSetCode</xsl:attribute>
                        <xsl:attribute name="codeListValue"><xsl:value-of select="/MRF/Metadata_Reference_Information[1]/Metadata_Character_Set[1]"/></xsl:attribute>
                        <xsl:attribute name="codeSpace">016</xsl:attribute>
                    </xsl:element>
                </xsl:element>
            </xsl:when>
            
            <xsl:when test="$CharSet = '8859part13'">
                <xsl:element name="gmd:characterSet">
                    <xsl:element name="gmd:MD_CharacterSetCode">
                        <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_CharacterSetCode</xsl:attribute>
                        <xsl:attribute name="codeListValue"><xsl:value-of select="/MRF/Metadata_Reference_Information[1]/Metadata_Character_Set[1]"/></xsl:attribute>
                        <xsl:attribute name="codeSpace">018</xsl:attribute>
                    </xsl:element>
                </xsl:element>
            </xsl:when>
            
            <xsl:when test="$CharSet = '8859part14'">
                <xsl:element name="gmd:characterSet">
                    <xsl:element name="gmd:MD_CharacterSetCode">
                        <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_CharacterSetCode</xsl:attribute>
                        <xsl:attribute name="codeListValue"><xsl:value-of select="/MRF/Metadata_Reference_Information[1]/Metadata_Character_Set[1]"/></xsl:attribute>
                        <xsl:attribute name="codeSpace">019</xsl:attribute>
                    </xsl:element>
                </xsl:element>
            </xsl:when>
            
            <xsl:when test="$CharSet = '8859part15'">
                <xsl:element name="gmd:characterSet">
                    <xsl:element name="gmd:MD_CharacterSetCode">
                        <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_CharacterSetCode</xsl:attribute>
                        <xsl:attribute name="codeListValue"><xsl:value-of select="/MRF/Metadata_Reference_Information[1]/Metadata_Character_Set[1]"/></xsl:attribute>
                        <xsl:attribute name="codeSpace">020</xsl:attribute>
                    </xsl:element>
                </xsl:element>
            </xsl:when>
            
            <xsl:when test="$CharSet = '8859part16'">
                <xsl:element name="gmd:characterSet">
                    <xsl:element name="gmd:MD_CharacterSetCode">
                        <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_CharacterSetCode</xsl:attribute>
                        <xsl:attribute name="codeListValue"><xsl:value-of select="/MRF/Metadata_Reference_Information[1]/Metadata_Character_Set[1]"/></xsl:attribute>
                        <xsl:attribute name="codeSpace">021</xsl:attribute>
                    </xsl:element>
                </xsl:element>
            </xsl:when>
            
            <xsl:when test="$CharSet = 'jis'">
                <xsl:element name="gmd:characterSet">
                    <xsl:element name="gmd:MD_CharacterSetCode">
                        <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_CharacterSetCode</xsl:attribute>
                        <xsl:attribute name="codeListValue"><xsl:value-of select="/MRF/Metadata_Reference_Information[1]/Metadata_Character_Set[1]"/></xsl:attribute>
                        <xsl:attribute name="codeSpace">022</xsl:attribute>
                    </xsl:element>
                </xsl:element>
            </xsl:when>
            
            <xsl:when test="$CharSet = 'shiftJIS'">
                <xsl:element name="gmd:characterSet">
                    <xsl:element name="gmd:MD_CharacterSetCode">
                        <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_CharacterSetCode</xsl:attribute>
                        <xsl:attribute name="codeListValue"><xsl:value-of select="/MRF/Metadata_Reference_Information[1]/Metadata_Character_Set[1]"/></xsl:attribute>
                        <xsl:attribute name="codeSpace">023</xsl:attribute>
                    </xsl:element>
                </xsl:element>
            </xsl:when>
            
            <xsl:when test="$CharSet = 'eucJP'">
                <xsl:element name="gmd:characterSet">
                    <xsl:element name="gmd:MD_CharacterSetCode">
                        <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_CharacterSetCode</xsl:attribute>
                        <xsl:attribute name="codeListValue"><xsl:value-of select="/MRF/Metadata_Reference_Information[1]/Metadata_Character_Set[1]"/></xsl:attribute>
                        <xsl:attribute name="codeSpace">024</xsl:attribute>
                    </xsl:element>
                </xsl:element>
            </xsl:when>
            
            <xsl:when test="$CharSet = 'usAscii'">
                <xsl:element name="gmd:characterSet">
                    <xsl:element name="gmd:MD_CharacterSetCode">
                        <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_CharacterSetCode</xsl:attribute>
                        <xsl:attribute name="codeListValue"><xsl:value-of select="/MRF/Metadata_Reference_Information[1]/Metadata_Character_Set[1]"/></xsl:attribute>
                        <xsl:attribute name="codeSpace">025</xsl:attribute>
                    </xsl:element>
                </xsl:element>
            </xsl:when>
            
            <xsl:when test="$CharSet = 'ebcdic'">
                <xsl:element name="gmd:characterSet">
                    <xsl:element name="gmd:MD_CharacterSetCode">
                        <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_CharacterSetCode</xsl:attribute>
                        <xsl:attribute name="codeListValue"><xsl:value-of select="/MRF/Metadata_Reference_Information[1]/Metadata_Character_Set[1]"/></xsl:attribute>
                        <xsl:attribute name="codeSpace">026</xsl:attribute>
                    </xsl:element>
                </xsl:element>
            </xsl:when>
            
            <xsl:when test="$CharSet = 'eucKR'">
                <xsl:element name="gmd:characterSet">
                    <xsl:element name="gmd:MD_CharacterSetCode">
                        <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_CharacterSetCode</xsl:attribute>
                        <xsl:attribute name="codeListValue"><xsl:value-of select="/MRF/Metadata_Reference_Information[1]/Metadata_Character_Set[1]"/></xsl:attribute>
                        <xsl:attribute name="codeSpace">027</xsl:attribute>
                    </xsl:element>
                </xsl:element>
            </xsl:when>
            
            <xsl:when test="$CharSet = 'big5'">
                <xsl:element name="gmd:characterSet">
                    <xsl:element name="gmd:MD_CharacterSetCode">
                        <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_CharacterSetCode</xsl:attribute>
                        <xsl:attribute name="codeListValue"><xsl:value-of select="/MRF/Metadata_Reference_Information[1]/Metadata_Character_Set[1]"/></xsl:attribute>
                        <xsl:attribute name="codeSpace">028</xsl:attribute>
                    </xsl:element>
                </xsl:element>
            </xsl:when>
            
            <xsl:when test="$CharSet = 'GB2312'">
                <xsl:element name="gmd:characterSet">
                    <xsl:element name="gmd:MD_CharacterSetCode">
                        <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_CharacterSetCode</xsl:attribute>
                        <xsl:attribute name="codeListValue"><xsl:value-of select="/MRF/Metadata_Reference_Information[1]/Metadata_Character_Set[1]"/></xsl:attribute>
                        <xsl:attribute name="codeSpace">029</xsl:attribute>
                    </xsl:element>
                </xsl:element>
            </xsl:when>
            
            <xsl:otherwise>
                <xsl:element name="gmd:characterSet">
                    <xsl:element name="gmd:MD_CharacterSetCode">
                        <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_CharacterSetCode</xsl:attribute>
                        <xsl:attribute name="codeListValue"><xsl:value-of select="/MRF/Metadata_Reference_Information[1]/Metadata_Character_Set[1]"/></xsl:attribute>
                        <xsl:attribute name="codeSpace">999</xsl:attribute>
                    </xsl:element>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
        
    </xsl:template>
</xsl:stylesheet>
