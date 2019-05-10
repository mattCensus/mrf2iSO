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
            <xd:p>../gpm2iso/SourceInformation.xsl</xd:p>
            <xd:p><xd:b>Created on:</xd:b> Jul 10, 2018</xd:p>
            <xd:p><xd:b>Author:</xd:b> mccre004</xd:p>
            <xd:p></xd:p>
        </xd:desc>
    </xd:doc>
    
    <xsl:template name="SourceInformation">
         <xsl:element name="gmd:lineage">
             <xsl:element name="gmd:LI_Lineage">
    <xsl:for-each select="/GPM/Data_Quality_Information[1]/Process_Step">
       
        <xsl:element name="gmd:processStep">
            <xsl:element name="gmd:LI_ProcessStep">
                <xsl:element name="gmd:description">
                    <xsl:element name="gco:CharacterString"><xsl:value-of select="."/></xsl:element>
                </xsl:element>
            </xsl:element>
        </xsl:element>
       
 
    </xsl:for-each>
                 
                 <xsl:for-each select="/GPM/Data_Quality_Information[1]/Source_Information">
                     <xsl:variable name="ProperTitle" select="./Citation/Title"></xsl:variable>
                     
                     <xsl:variable name="ProperOriginator" select="./Citation/Originator"/>
                     <xsl:element name="gmd:source">
                        <!--   <xsl:comment>In the Source!!!!!!!!!!!!!!!!!!!!!!!!!!!!!</xsl:comment>-->
                         <xsl:element name="gmd:LI_Source">
                             <xsl:element name="gmd:description">
                                 <xsl:element name="gco:CharacterString"><xsl:value-of select="./Source_Contribution"/></xsl:element>
                             </xsl:element>
                     
                             <xsl:element name="gmd:sourceCitation">
                                 <xsl:element name="gmd:CI_Citation">
                                     
                                     <xsl:element name="gmd:title">
                                         <xsl:element name="gco:CharacterString">
                                             <xsl:value-of select="./Citation/Title"/>
                                             
                                         </xsl:element>
                                     </xsl:element>
                                     
                                     <xsl:if test="./Source_Citation_Abbreviation">
                                         <xsl:element name="gmd:alternateTitle">
                                             <xsl:element name="gco:CharacterString">
                                                 <xsl:value-of select="./Source_Citation_Abbreviation"/>
                                             </xsl:element>
                                         </xsl:element>
                                     </xsl:if>
                                     
                                     <xsl:element name="gmd:date">
                                         <xsl:element name="gmd:CI_Date">
                                             <xsl:variable name="DateType" select="./Citation/Publication_Date"/>
                                             <xsl:element name="gmd:date">
                                                 
                                                 <xsl:choose>
                                                     <xsl:when test="contains($DateType,'unknown')">
                                                         <xsl:attribute name="gco:nilReason">unknown</xsl:attribute>
                                                     </xsl:when>
                                                     <xsl:when test="contains($DateType,'Unknown')">
                                                         <xsl:attribute name="gco:nilReason">unknown</xsl:attribute>
                                                     </xsl:when>
                                                     <!--   <xsl:otherwise>
                                             <xsl:element name="gco:Date"> <xsl:value-of select="./Citation/Publication_Date"/> </xsl:element>
                                         </xsl:otherwise>-->
                                                     <xsl:otherwise>
                                                         <xsl:element name="gco:Date"><xsl:value-of select="./Citation/Publication_Date"/></xsl:element>
                                                     </xsl:otherwise>
                                                 </xsl:choose>
                                                 
                                                 
                                                 
                                             </xsl:element>
                                             <xsl:element name="gmd:dateType">
                                                 <xsl:element name="gmd:CI_DateTypeCode">
                                                     <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#CI_DateTypeCode</xsl:attribute>
                                                     <xsl:attribute name="codeListValue">publication date</xsl:attribute>publication date
                                                 </xsl:element>
                                             </xsl:element>
                                         </xsl:element>
                                     </xsl:element>
                                     
                                     
                                     <xsl:element name="gmd:citedResponsibleParty">
                                         <xsl:element name="gmd:CI_ResponsibleParty">
                                             <xsl:element name="gmd:organisationName">
                                                 <xsl:element name="gco:CharacterString"><xsl:value-of select="./Citation/Originator"></xsl:value-of></xsl:element>
                                             </xsl:element>
                                             <xsl:element name="gmd:role">
                                                 <xsl:element name="gmd:CI_RoleCode">
                                                     <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#CI_RoleCode</xsl:attribute>
                                                     <xsl:attribute name="codeListValue">resourceProvider</xsl:attribute>
                                                 </xsl:element>
                                             </xsl:element>
                                         </xsl:element>
                                     </xsl:element>
                                 </xsl:element>
                             </xsl:element>
                             
                             <xsl:element name="gmd:sourceExtent">
                                         <xsl:element name="gmd:EX_Extent">
                                             <xsl:element name="gmd:temporalElement">
                                                 <xsl:element name="gmd:EX_TemporalExtent">
                                                     <xsl:element name="gmd:extent">
                                                         <xsl:variable name="BegDate" select="./Time_Period_of_Content/Range_Of_Dates/Beginning_Date"/>
                                                         <xsl:variable name="EndDate" select="./Time_Period_of_Content/Range_Of_Dates/Ending_Date"/>
                                                         <xsl:variable name="TimePeriodNameA" select="./Source_Citation_Abbreviation"/>
                                                         <xsl:variable name="TimeTitle" select="./Citation/Title"></xsl:variable>
                                                         <xsl:variable name="AppCheck" select="./Source_Citation_Abbreviation"/>
                                                         <xsl:variable name="Title" select="./Citation/Title"/>
                                                         <xsl:variable name="TitleB" select="substring($Title,0,5)"/>
                                                         
                                                         <xsl:variable name="sorAbbr" select="./Source_Citation_Abbreviation[1]"/>
                                                         <xsl:variable name="SorTwo" select="translate($sorAbbr,' ','')"/>
                                                         <xsl:variable name="SorThree" select="translate($SorTwo,'-','')"/>
                                                         <xsl:comment> BegDate: <xsl:value-of select="$BegDate"></xsl:value-of></xsl:comment>
                                                         <xsl:choose>
                                                             <xsl:when test="contains($BegDate,'Unknown')">
                                                                 <xsl:variable name="finalTitle" select="concat('Source',$SorThree,$TitleB,$BegDate)"/>
                                                                 <xsl:variable name="timeId" select="substring($Title,0,5)"/>
                                                                 <xsl:element name="gml:TimeInstant">
                                                                     <xsl:choose>
                                                                         <xsl:when test="contains($Title,'Alaska ADOT')">
                                                                             <xsl:comment>Alaska</xsl:comment>
                                                                             <xsl:attribute name="gml:id">AlaskaADOT</xsl:attribute>
                                                                         </xsl:when>
                                                                         <xsl:when test="contains($finalTitle,'/')"> 
                                                                             <xsl:variable name="preSlash" select="substring-before($finalTitle,'/')"/>
                                                                             <xsl:variable name="postTitle" select="substring-after($finalTitle,'/')"/>
                                                                             <xsl:variable name="newFinalTitle" select="concat($preSlash,$postTitle)"/>    
                                                                             <xsl:attribute name="gml:id"><xsl:value-of select="$newFinalTitle"/></xsl:attribute>
                                                                         </xsl:when>
                                                                         <xsl:otherwise>
                                                                             <xsl:attribute name="gml:id"><xsl:value-of select="$finalTitle"/></xsl:attribute>
                                                                         </xsl:otherwise>
                                                                     </xsl:choose>
                                                                     <xsl:element name="gml:timePosition">
                                                                         <xsl:attribute name="indeterminatePosition">unknown</xsl:attribute>
                                                                         <xsl:value-of select="$BegDate"/></xsl:element>
                                                                     
                                                                 </xsl:element>
                                                             </xsl:when>
                                                             <xsl:when test="not($BegDate =$EndDate)">
                                                                 <xsl:comment>Two dates not equal Number 2dd</xsl:comment> 
                                                              
                                                                 
                                                                 <!--  <xsl:comment>TitleB: <xsl:value-of select="$TitleB"/></xsl:comment>-->
                                                                 <xsl:variable name="finalTitle" select="concat('Source',$SorThree,$TitleB,$BegDate)"/>
                                                                 <xsl:variable name="timeId" select="substring($Title,0,5)"/>
                                                                 <xsl:element name="gml:TimePeriod">
                                                                    
                                                                     <xsl:choose>
                                                                         <xsl:when test="contains($Title,'Alaska ADOT')">
                                                                             <xsl:comment>Alaska</xsl:comment>
                                                                             <xsl:attribute name="gml:id">AlaskaADOT</xsl:attribute>
                                                                         </xsl:when>
                                                                         <xsl:when test="contains($finalTitle,'/')"> 
                                                                             <xsl:variable name="preSlash" select="substring-before($finalTitle,'/')"/>
                                                                             <xsl:variable name="postTitle" select="substring-after($finalTitle,'/')"/>
                                                                             <xsl:variable name="newFinalTitle" select="concat($preSlash,$postTitle)"/>    
                                                                             <xsl:attribute name="gml:id"><xsl:value-of select="$newFinalTitle"/></xsl:attribute>
                                                                         </xsl:when>
                                                                         <xsl:otherwise>
                                                                              <xsl:attribute name="gml:id"><xsl:value-of select="$finalTitle"/></xsl:attribute>
                                                                         </xsl:otherwise>
                                                                     </xsl:choose>
                                                                    
                                                                     <xsl:element name="gml:beginPosition"><xsl:value-of select="$BegDate"/></xsl:element>
                                                                     <xsl:element name="gml:endPosition"> <xsl:value-of select="$EndDate"/></xsl:element>  
                                                                 </xsl:element>
                                                             </xsl:when>
                                                             <!--   
                                                                 
                                                             -->
                                                             <xsl:when test="$BegDate =$EndDate">
                                                                 <xsl:variable name="finalTitle" select="concat('Source',$SorThree,$TitleB,$BegDate)"/>
                                                                 <xsl:variable name="timeId" select="substring($Title,0,5)"/>
                                                                     <xsl:element name="gml:TimeInstant">
                                                                         <xsl:choose>
                                                                             <xsl:when test="contains($Title,'Alaska ADOT')">
                                                                                 <xsl:comment>Alaska</xsl:comment>
                                                                                 <xsl:attribute name="gml:id">AlaskaADOT</xsl:attribute>
                                                                             </xsl:when>
                                                                             <xsl:when test="contains($finalTitle,'/')"> 
                                                                                 <xsl:variable name="preSlash" select="substring-before($finalTitle,'/')"/>
                                                                                 <xsl:variable name="postTitle" select="substring-after($finalTitle,'/')"/>
                                                                                 <xsl:variable name="newFinalTitle" select="concat($preSlash,$postTitle)"/>    
                                                                                 <xsl:attribute name="gml:id"><xsl:value-of select="$newFinalTitle"/></xsl:attribute>
                                                                             </xsl:when>
                                                                             <xsl:otherwise>
                                                                                 <xsl:attribute name="gml:id"><xsl:value-of select="$finalTitle"/></xsl:attribute>
                                                                             </xsl:otherwise>
                                                                         </xsl:choose>
                                                                         <xsl:element name="gml:timePosition">
                                                                             
                                                                             <xsl:value-of select="$BegDate"/></xsl:element>
                                                                         
                                                                     </xsl:element>
                                                             </xsl:when> 
                                                             <xsl:otherwise>
                                                                <xsl:comment>In the otherwise</xsl:comment>
                                                                <xsl:element name="gml:TimePeriod">
                                                                    <xsl:attribute name="gml:id"></xsl:attribute>
                                                                </xsl:element>
                                                            </xsl:otherwise>
                                                         </xsl:choose>
                                                     </xsl:element>
                                                 </xsl:element>
                                             </xsl:element>
                                         </xsl:element>
                                     </xsl:element>
                                 
                             
                         </xsl:element>
                         
                                     
                                     
                                 
                             </xsl:element>
                        
                      
                 </xsl:for-each>
             </xsl:element>
         </xsl:element>
   
    
    
    
    
    
    </xsl:template>
    
        
   
   
           
       
   
</xsl:stylesheet>
