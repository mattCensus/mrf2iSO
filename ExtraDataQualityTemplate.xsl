<?xml version="1.1" encoding="UTF-8" ?>

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
         <xd:p>mrf2ISO/ExtraDataQualityTemplate.xsl</xd:p>
         <xd:p>called by the mrf2ISO/11_gmd_identificationInfo.xsl template</xd:p>
         <xd:p><xd:b>Created on:</xd:b> Dec 12, 2013</xd:p>
         <xd:p><xd:b>Author:</xd:b> Matthew McCready</xd:p>
         <xd:p> This template is called by the 11_gmd_identificationInfo.xsl stylesheet. The begDateFormat and the endDateFormat templates format the date for the
            gml:beginPosition and gml:endPosition elements respectively. These elements are called by templates located under the gml:TimePeriod element.
            The TemporalExtentTimePeriod formats gml:id namespace.</xd:p>
         <xd:ul>
            <xd:li>Template                    Explanation                                                    </xd:li>
            <xd:li>begDateFormatTimePeriod     Handles the gml:beginPosition for the identificationInformation</xd:li>  
            <xd:li>endDateFormatTimePeriod     Handles the gml:endPosition for the identificationInformation  </xd:li>  
            <xd:li>TemporalExtentTimePeriod    formats gml:id namespace                                       </xd:li> 
         </xd:ul>
         <xd:p>
            Initial   Date      Change Request ID   Description
            MMC       07/08/2011                      Inserted gco:CharacterString under the gmd:organisationName element.
            MMC       10/27/2011                      Inserted a choose structure for begdates with a value of 'Unknown' for the gml:id attribute of the
                                                       gmd:EX_TemporalExtent/gmd:extent element. The value for this element is a combination of the beginning date, ending date,
                                                       title and origin FGDC elements.
            MMC      1/8/2014                        Modified to work on the MRF Format </xd:p>
      </xd:desc> </xd:doc>

   <xsl:strip-space elements="*"/>
   <xsl:template name="begDateFormatTimePeriod">
      <!-- <xsl:comment>calling the begDateFormat template </xsl:comment> -->
      <xsl:variable name="BegDate"
         select="/MRF/Identification_Information/Time_Period_of_Content/Beginning_Date"/>
      <xsl:variable name="BegYear" select="substring($BegDate,1,4)"/>
      <xsl:variable name="BegMonth" select="substring($BegDate,5,2)"/>
      <xsl:variable name="BegMonthLength" select="string-length($BegMonth)"/>
      <xsl:variable name="BegDay" select="substring($BegDate,7,2)"/>
      <xsl:variable name="BegDayLength" select="string-length($BegDay)"/>

      <xsl:choose>

         <xsl:when test="$BegDayLength>0">
            <xsl:variable name="dateFormat" select="concat($BegYear, '-',$BegMonth,'-',$BegDay)"/>
            <xsl:element name="gml:beginPosition">
               <xsl:value-of select="$dateFormat"/>
            </xsl:element>
            <!-- gml:beginPosition -->
         </xsl:when>

         <xsl:when test="$BegMonthLength >0">
            <xsl:variable name="dateFormat" select="concat($BegYear, '-',$BegMonth)"/>
            <xsl:element name="gml:beginPosition">
               <xsl:value-of select="$dateFormat"/>
            </xsl:element>
            <!-- gml:beginPosition -->
         </xsl:when>

         <xsl:otherwise>
            <xsl:variable name="dateFormat" select="$BegYear"/>
            <xsl:element name="gml:beginPosition">
               <xsl:value-of select="$dateFormat"/>
            </xsl:element>
            <!-- gml:beginPosition -->
         </xsl:otherwise>
      </xsl:choose>

   </xsl:template>


   <xsl:template name="endDateFormatTimePeriod">
      <xsl:variable name="EndDate"
         select="/MRF/Identification_Information/Time_Period_of_Content/Ending_Date"/>
      <xsl:variable name="EndYear" select="substring($EndDate,1,4)"/>
      <xsl:variable name="EndMonth" select="substring($EndDate,5,2)"/>
      <xsl:variable name="EndMonthLength" select="string-length($EndMonth)"/>
      <xsl:variable name="EndDay" select="substring($EndDate,7,2)"/>
      <xsl:variable name="EndDayLength" select="string-length($EndDay)"/>

      <xsl:choose>

         <xsl:when test="$EndDayLength>0">
            <xsl:variable name="dateFormat" select="concat($EndYear, '-',$EndMonth,'-',$EndDay)"/>
            <xsl:element name="gml:endPosition">
               <xsl:value-of select="$dateFormat"/>
            </xsl:element>
            <!-- gml:beginPosition -->
         </xsl:when>

         <xsl:when test="$EndMonthLength >0">
            <xsl:variable name="dateFormat" select="concat($EndYear, '-',$EndMonth)"/>
            <xsl:element name="gml:endPosition">
               <xsl:value-of select="$dateFormat"/>
            </xsl:element>
            <!-- gml:beginPosition -->
         </xsl:when>

         <xsl:otherwise>
            <xsl:variable name="dateFormat" select="$EndYear"/>
            <xsl:element name="gml:endPosition">
               <xsl:value-of select="$dateFormat"/>
            </xsl:element>
            <!-- gml:beginPosition -->
         </xsl:otherwise>
      </xsl:choose>

   </xsl:template>


   <xsl:template name="TemporalExtentTimePeriod">

      <!-- <xsl:variable name="$beginning"/> -->
      <xsl:variable name="BegDate"
         select="/MRF/Identification_Information/Time_Period_of_Content/Beginning_Date"/>
      <xsl:variable name="BegYear" select="substring($BegDate,1,4)"/>
      <xsl:variable name="BegMonth" select="substring($BegDate,5,2)"/>
      <xsl:variable name="BegMonthLength" select="string-length($BegMonth)"/>
      <xsl:variable name="BegDay" select="substring($BegDate,7,2)"/>
      <xsl:variable name="BegDayLength" select="string-length($BegDay)"/>

      <xsl:variable name="EndDate"
         select="/MRF/Identification_Information/Time_Period_of_Content/Ending_Date"/>
      <xsl:variable name="EndYear" select="substring($EndDate,1,4)"/>
      <xsl:variable name="EndMonth" select="substring($EndDate,5,2)"/>
      <xsl:variable name="EndMonthLength" select="string-length($EndMonth)"/>
      <xsl:variable name="EndDay" select="substring($EndDate,7,2)"/>
      <xsl:variable name="EndDayLength" select="string-length($EndDay)"/>
      <xsl:variable name="beginning"/>
      <xsl:variable name="ending"/>

      <xsl:choose>


         <xsl:when test="$BegDate ='Unknown'">
            <xsl:variable name="origin" select="srccite/citeinfo/origin"/>
            <xsl:variable name="originA" select="substring($origin,1,4)"/>
            <xsl:variable name="Citetitle" select="srccite/citeinfo/title"/>
            <xsl:variable name="CitetitleA" select="substring($Citetitle,1,5)"/>
            <xsl:variable name="GMLID"
               select="concat('tp',$beginning,$EndDate,$originA, $CitetitleA)"/>
            <xsl:attribute name="gml:id">
               <xsl:value-of select="$GMLID"/>
            </xsl:attribute>




         </xsl:when>

         <xsl:when test="$BegDayLength>0">
            <xsl:variable name="beginningA" select="concat($BegYear,$BegMonth,$BegDay)"/>


            <xsl:choose>
               <xsl:when test="$EndDayLength>0">
                  <!-- <xsl:comment> right here!!!!!!!!!!!!!!!!!!!!</xsl:comment> -->
                  <xsl:variable name="endingA" select="concat($EndYear,$EndMonth,$EndDay,'endDay')"/>
               </xsl:when>
               <xsl:when test="$EndMonthLength >0">
                  <xsl:variable name="endingB" select="concat($EndYear,$EndMonth,'00','endMonth')"/>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:variable name="endingC" select="concat($EndYear,'0000','endYear')"/>
               </xsl:otherwise>
            </xsl:choose>

            <!-- /metadata/dataqual[1]/lineage[1]/srcinfo[4]/srccite[1]/citeinfo[1]/title[1] -->
            <!-- /metadata/dataqual[1]/lineage[1]/srcinfo[2]/srccite[1]/citeinfo[1]/origin[1] -->
            <xsl:variable name="origin" select="srccite/citeinfo/origin"/>
            <xsl:variable name="originA" select="translate($origin,' ', '_')"/>
            <xsl:variable name="originB" select="translate($originA,'(' ,'_')"/>
            <xsl:variable name="originC" select="translate($originB,')' ,'_')"/>
            <xsl:variable name="originD" select="translate($originC,',' ,'_')"/>
            <xsl:variable name="GMLID" select="concat('tp',$beginning,$EndDate,$originD,'month')"/>
            <xsl:attribute name="gml:id">
               <xsl:value-of select="$GMLID"/>
            </xsl:attribute>

         </xsl:when>

         <xsl:when test="$BegMonthLength >0">
            <xsl:variable name="beginningE" select="concat($BegYear,$BegMonth,'00')"/>

            <xsl:choose>
               <xsl:when test="$EndDayLength>0">
                  <xsl:variable name="endingF" select="concat($EndYear,$EndMonth,$EndDay)"/>
               </xsl:when>
               <xsl:when test="$EndMonthLength >0">
                  <xsl:variable name="endingG" select="concat($EndYear,$EndMonth,'00')"/>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:variable name="endingH" select="concat($EndYear,'0000')"/>
               </xsl:otherwise>
            </xsl:choose>
            <xsl:variable name="origin" select="srccite/citeinfo/origin"/>
            <xsl:variable name="originA" select="translate($origin,' ', '_')"/>
            <xsl:variable name="originB" select="translate($originA,'(' ,'_')"/>
            <xsl:variable name="originC" select="translate($originB,')' ,'_')"/>
            <xsl:variable name="originD" select="translate($originC,',' ,'_')"/>
            <xsl:variable name="GMLID" select="concat('tp',$beginning,$EndDate,$originD,'month')"/>
            <xsl:attribute name="gml:id">
               <xsl:value-of select="$GMLID"/>
            </xsl:attribute>

         </xsl:when>


         <xsl:otherwise>
            <xsl:variable name="beginningB" select="concat($BegYear,'0000')"/>
            <xsl:choose>
               <xsl:when test="$EndDayLength>0">
                  <xsl:variable name="endingI" select="concat($EndYear,$EndMonth,$EndDay)"/>
               </xsl:when>
               <xsl:when test="$EndMonthLength >0">
                  <xsl:variable name="endingJ" select="concat($EndYear,$EndMonth,'00')"/>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:variable name="endingK" select="concat($EndYear,'0000')"/>
               </xsl:otherwise>
            </xsl:choose>

            <xsl:variable name="origin" select="srccite/citeinfo/origin"/>
            <xsl:variable name="originA" select="translate($origin,' ', '_')"/>
            <xsl:variable name="originB" select="translate($originA,'(' ,'_')"/>
            <xsl:variable name="originC" select="translate($originB,')' ,'_')"/>
            <xsl:variable name="originD" select="translate($originC,',' ,'_')"/>
            <xsl:variable name="GMLID" select="concat('tp',$beginning,$EndDate,$originD,'month')"/>
            <xsl:attribute name="gml:id">
               <xsl:value-of select="$GMLID"/>
            </xsl:attribute>

         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

</xsl:stylesheet>
