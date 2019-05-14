<?xml version="1.1" encoding="UTF-8" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
 xmlns:gco="http://www.isotc211.org/2005/gco" xmlns:gfc="http://www.isotc211.org/2005/gfc"
 xmlns:gmd="http://www.isotc211.org/2005/gmd" xmlns:gmx="http://www.isotc211.org/2005/gmx"
 xmlns:gsr="http://www.isotc211.org/2005/gsr" xmlns:gss="http://www.isotc211.org/2005/gss"
 xmlns:gts="http://www.isotc211.org/2005/gts" xmlns:gml="http://www.opengis.net/gml/3.2"
 xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xs="http://www.w3.org/2001/XMLSchema"
 xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" exclude-result-prefixes="xd">
 
 <xsl:import href="../mrf2ISO/NGDA_Themes.xsl"/>
 
 <xd:doc scope="stylesheet">
  <xd:desc>
   <xd:p>mrf2ISO/NonISOKeywords.xsl</xd:p>
   <xd:p>called by the mrf2ISO/11_gmd_identificationInfo.xsl template</xd:p>
   <xd:p><xd:b>Created on:</xd:b>October 12, 2011</xd:p>
   <xd:p><xd:b>Author:</xd:b> Matthew McCready</xd:p>
   <xd:p>  XSLT stylesheet that transforms the values stored in the Theme_Keyword and Place_Keyword MIF elements to the gmd:descriptiveKeywords element. This 
    stylesheet consists of three templates: NonISOKeywords, NonThemeISOKeywords and PlaceKeywords. The NonISOKeywords template is the template called by the
    11_gmd:identificationInfo.xsl stylesheet. This template consists of two other templates: NonThemeISOKeywords and PlaceKeywords. The NonThemeISOKeywords template
    takes all the values in the MIF/Theme_Keyword element that are not ISO Topic Category Keywords and transforms them into the 
    gmd:descriptiveKeywords/gmd:MD_Keywords/gmd:keyword/gco:CharacterString ISO element. It also provides the correct value of 'theme' for the MD_KeywordTypeCode
    codelist. The PlaceKeywords template takes all the values in the MIF/Place_Keyword  element and transforms it into the
    gmd:descriptiveKeywords/gmd:MD_Keywords/gmd:keyword/gco:CharacterString ISO element. It also provides the correct value of 'place' for the MD_KeywordTypeCode codelist</xd:p>
   <xd:ul>
    <xd:li>Template                    Explanation                                              </xd:li>
    <xd:li>NonISOKeywords              Master template for all the other non ISO theme templates</xd:li> 
    <xd:li>NonThemeISOKeywords         Template for all the non ISO keywords                    </xd:li>
    <xd:li>PlaceKeywords               Template used to create Place theme keywords             </xd:li>    
   </xd:ul>
   <xd:p>
    MMC        4/23/2013                    Changed the formatting on the gmd:keyword/gco:characterstring element so that the entire element appear on one line.
    MMC        1/8/2014                     Modified to work on the MRF Format      </xd:p>
  </xd:desc> </xd:doc>
 
 
 
 <xsl:output method="xml" version="1.0" encoding="ISO-8859-1" indent="yes"/>
 <xsl:variable name="MetDate" select="//metadata/metainfo/metd"/>

 <xsl:template name="NonISOKeywords">
  <!-- <xsl:comment>In the non iso keywords template</xsl:comment> -->
  <xsl:call-template name="NonThemeISOKeywords"/>
  <xsl:call-template name="PlaceKeywords"/>
  <xsl:call-template name="Place_INCITSB"/>
 </xsl:template>

 <xsl:template name="NonThemeISOKeywords">
  <!--  <xsl:comment>In the NonThemeISOKeywords Template</xsl:comment>-->
  <xsl:variable name="CodeListLoc">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_KeywordTypeCode</xsl:variable>
  <xsl:variable name="NonISOKeywordsTheme"  select="/MRF/Identification_Information/Keywords/Theme/Theme_Keyword_Thesaurus"/>



  <xsl:for-each select="/MRF/Identification_Information/Keywords/Theme">


   <xsl:variable name="NonISOKeywordsThemeA" select="./Theme_Keyword_Thesaurus"/>





   <xsl:element name="gmd:descriptiveKeywords">
    <xsl:element name="gmd:MD_Keywords">

      <!-- <xsl:comment>before the keyword</xsl:comment> -->
     <xsl:for-each select="./Theme_Keyword">
      <xsl:element name="gmd:keyword">
       <xsl:element name="gco:CharacterString">
        <xsl:value-of select="normalize-space(.)"/>
       </xsl:element>
      </xsl:element>
     </xsl:for-each>

     <xsl:element name="gmd:type">
      <xsl:element name="gmd:MD_KeywordTypeCode">
       <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_KeywordTypeCode</xsl:attribute>
       <xsl:attribute name="codeListValue">theme</xsl:attribute>
       <xsl:attribute name="codeSpace">005</xsl:attribute> theme </xsl:element>
     </xsl:element>


<xsl:choose>
 <xsl:when test="contains($NonISOKeywordsThemeA,'NGDA Portfolio Themes')">
 <xsl:call-template name="thesTypeName"/>
 </xsl:when>
<xsl:otherwise>
     <xsl:element name="gmd:thesaurusName">
      <xsl:element name="gmd:CI_Citation">

       <xsl:element name="gmd:title">
        <xsl:element name="gco:CharacterString">
         <xsl:value-of select="normalize-space($NonISOKeywordsThemeA)"/>
         <!--  <xsl:value-of select="normalize($NonISOKeywordsThemeA)"/>-->
        </xsl:element>
       </xsl:element>

       <xsl:element name="gmd:date">
        <xsl:attribute name="gco:nilReason">unknown</xsl:attribute>
       </xsl:element>

      </xsl:element>
     </xsl:element>
 </xsl:otherwise>
</xsl:choose>

    </xsl:element>
   </xsl:element>

  </xsl:for-each>

 </xsl:template>


 <xsl:template name="PlaceKeywords">

  <!-- <xsl:comment> In the Place Keywords Template </xsl:comment> -->

  <xsl:for-each select="/MRF/Identification_Information/Keywords/Place">
   <xsl:element name="gmd:descriptiveKeywords">
    <xsl:element name="gmd:MD_Keywords">

     <xsl:for-each select="/MRF/Identification_Information/Keywords/Place/Place_Keyword">

      <xsl:element name="gmd:keyword">
       <xsl:element name="gco:CharacterString">
        <!--  <xsl:value-of select="."/>-->
        <xsl:value-of select="normalize-space(.)"/>
       </xsl:element>

      </xsl:element>
     </xsl:for-each>
     
  


     <xsl:element name="gmd:type">
      <xsl:element name="gmd:MD_KeywordTypeCode">
       <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_KeywordTypeCode</xsl:attribute>
       <xsl:attribute name="codeListValue">place</xsl:attribute>
       <xsl:attribute name="codeSpace">002</xsl:attribute> place </xsl:element>
      <!-- gmd:MD_KeywordTypeCode -->
     </xsl:element>
     <!-- gmd:type -->
     <xsl:element name="gmd:thesaurusName">
      <xsl:element name="gmd:CI_Citation">
       <xsl:element name="gmd:title">
        <!-- <xsl:element name="gco:CharacterString"> -->

        <xsl:element name="gco:CharacterString">
         <!-- /MIF/Place_Keyword_Thesaurus[1]
         <xsl:value-of select="."/> -->
         <xsl:variable name="PlaceThesGID" select="/MRF/Identification_Information/Keywords/Place/Place_Keyword_Thesaurus"/>
         <!--  <xsl:value-of select="$PlaceThesGID"/>-->
         <xsl:value-of select="normalize-space($PlaceThesGID)"/>
       
        </xsl:element>
        <!-- gco:CharacterString -->

       </xsl:element>
       <!-- gmd:title -->
       <xsl:element name="gmd:date">
        <xsl:attribute name="gco:nilReason">unknown</xsl:attribute>
       </xsl:element>
       <!-- gmd:date -->
      </xsl:element>
      <!-- gmd:CI_Citation -->
     </xsl:element>
     <!-- gmd:thesaurusName -->
    </xsl:element>
    <!-- gmd:descriptiveKeywords -->
   </xsl:element>
   <!-- gmd:MD_Keywords -->
  </xsl:for-each>

 </xsl:template>
 
 <xsl:template name="Place_INCITSB">
  
  <!-- <xsl:comment> In the Place Keywords Template </xsl:comment> -->
  
  <xsl:for-each select="/MRF/Identification_Information/Keywords/Place_INCITSB">
   <xsl:element name="gmd:descriptiveKeywords">
    <xsl:element name="gmd:MD_Keywords">
     <!-- /MRF/Identificati -->
     
     <xsl:for-each select="./Place_Keyword">
      
      <xsl:element name="gmd:keyword">
       <xsl:element name="gco:CharacterString">
        <xsl:value-of select="normalize-space(.)"/>
       </xsl:element>
       
      </xsl:element>
     </xsl:for-each>
     
     
     
     
     <xsl:element name="gmd:type">
      <xsl:element name="gmd:MD_KeywordTypeCode">
       <xsl:attribute name="codeList"
        >http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_KeywordTypeCode</xsl:attribute>
       <xsl:attribute name="codeListValue">place</xsl:attribute>
       <xsl:attribute name="codeSpace">002</xsl:attribute> place </xsl:element>
      <!-- gmd:MD_KeywordTypeCode -->
     </xsl:element>
     <!-- gmd:type -->
     <xsl:element name="gmd:thesaurusName">
      <xsl:element name="gmd:CI_Citation">
       <xsl:element name="gmd:title">
        <!-- <xsl:element name="gco:CharacterString"> -->
        <xsl:element name="gco:CharacterString">
         <xsl:variable name="PlaceThesGID" select="/MRF/Identification_Information/Keywords/Place_INCITSB/Place_Keyword_Thesaurus"/>
         <xsl:value-of select="$PlaceThesGID"/>
        </xsl:element>
        <!-- gco:CharacterString -->
        
       </xsl:element>
       <!-- gmd:title -->
       <xsl:element name="gmd:date">
        <xsl:attribute name="gco:nilReason">unknown</xsl:attribute>
       </xsl:element>
       <!-- gmd:date -->
      </xsl:element>
      <!-- gmd:CI_Citation -->
     </xsl:element>
     <!-- gmd:thesaurusName -->
    </xsl:element>
    <!-- gmd:descriptiveKeywords -->
   </xsl:element>
   <!-- gmd:MD_Keywords -->
  </xsl:for-each>
  
 </xsl:template>
 

</xsl:stylesheet>
