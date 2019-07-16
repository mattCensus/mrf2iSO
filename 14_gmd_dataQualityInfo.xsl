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
   
   <xd:doc scope="stylesheet">
      <xd:p>mrf2ISO/14_gmd_dataQualityInfo.xsl</xd:p>
      <xd:p>called by the mrf2ISO/mrf2ISOMaster.xsl template</xd:p>
      <xd:p>calls the following templates:
         Template                                     Stylesheet/File
         DataQualitySource                            DataQualitySource.xsl
      </xd:p>
      <xd:ul>
         <xd:li></xd:li>
      </xd:ul>
      <xd:desc>
         <xd:p><xd:b>Created on:</xd:b> Jan 7, 2014</xd:p>
         <xd:p><xd:b>Author:</xd:b> Matthew McCready</xd:p>
         <xd:ul>
            <xd:li>Template                   Explanation                             </xd:li>
            <xd:li>dataQualityInfo            Handles the gmd:dataQualityInfo element </xd:li>
            <xd:li>dateTimeTemp               Handles the gmd:dateTime element        </xd:li>  
         </xd:ul>
         <xd:p>
            Initial   Date           Description
            MMC		07/07/2011            Added the gmd:DQ_Scope, md:level and gmd:MD_ScopeCode elements to comply with the ISO standard.
            MMC      07/07/2011            Added the gmd:DQ_CompletenessCommission to one of the gmd:report elements
            MMC		07/08/2011            Created the dateTimeTemp template to work with dates and times for the gmd:DateTime element. This element has to be in the
                                            MMDDYYYYT00:00:00 format, even when oly a year is given in the /metadata/dataqual/lineage/procstep/procdate FGDC element. To
                                            correctly format this ISO element, a default -01-01 for the month is inserted and all 0, for the time when only a year is
                                            given in the FGDC XML. 
            MMC      07/08/2011            Inserted the CI_Date package under the gmd:source/CI_Citation section. Previously, the gco:date element was not in this
                                            package.
            MMC      07/13/2011            Modified the dateTimeTemp template to include the actual time for the gmd:DateTime ISO element and not the default 
                                            01T00:00:00 for transforming FGDC files that have the Process Time element. The correct ISO format was inserted for the                                                                                           Process Date elements that do not include the month or day.
            MMC      11/1/2011             Changed the gco:Date element to the gco:DateTime element in the dateTimeTemp template to better adhere to the standard. 
            MMC      03/15/2012            Modified to transform from a MIF file to an ISO file
            MMC      04/18/2012            Modified the gmd:DateTime element so that the correct value is inserted in the correct format.  
            MMC      12/04/2013            Included the gmd:description element under LI_Source to describe the type of source media 
            MMC      1/10/2014            Modified to work on the MRF Format
            MMC      2/2/2015             Modified the if to work with version 2.0 
            MMC      5/14/2015            Modified the gmd:source element so that it includes every source listed in the MRF. This includes the source type,
                                           the title of the data source title, source data, source contributor and the source contribution.
            MMC      3/1/2016             Modified to have a for each loop for the :DQ_AbsoluteExternalPositionalAccuracy element     
            MMC      2/6/17               Modifiied to eliminate the whitespace for the  gml:BaseUnit element 
            MMC      2/15/17              Modified so that the gmd:evaluationMethodDescription appears for the CompletenessCommission
            MMC      1/19/18              Modified so that the gmd:sourceExtent element appears. This is so that date ranges can appear.
            MMC      1/26/18              Modified with a choose and  an if structure so that both date range and single dates can be handled.
            </xd:p>
      </xd:desc>
   </xd:doc>

<xsl:strip-space elements="*"/>

   <xsl:template name="dataQualityInfo" match="/">
      
      <xsl:element name="gmd:dataQualityInfo">
         <xsl:element name="gmd:DQ_DataQuality">

            <xsl:element name="gmd:scope">
               <xsl:element name="gmd:DQ_Scope">

                  <xsl:element name="gmd:level">
                     <xsl:element name="gmd:MD_ScopeCode">
                        <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_ScopeCode</xsl:attribute>
                        <xsl:attribute name="codeListValue">dataset</xsl:attribute>
                        <xsl:attribute name="codeSpace">005</xsl:attribute> dataset </xsl:element>
                     <!-- gmd:MD_ScopeCode -->
                  </xsl:element>
                  <!-- gmd:level -->

               </xsl:element>
               <!-- gmd:DQ_Scope -->
            </xsl:element>
            <!-- gmd:scope -->

            <!-- /metadata/dataqual/posacc/horizpa -->
          <!--   <xsl:if test="/MRF/Data_Quality_Inform">--> 
            <xsl:for-each select="/MRF/Data_Quality_Information[1]/Quantitative_Horizontal_Positional_Accuracy_Assessment">
              <!--      <xsl:comment>In the loop!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!</xsl:comment>-->
               <xsl:element name="gmd:report">
                  <xsl:element name="gmd:DQ_AbsoluteExternalPositionalAccuracy">

                     <xsl:element name="gmd:nameOfMeasure">
                        <xsl:element name="gco:CharacterString">Horizontal Positional Accuracy</xsl:element>
                        <!-- gco:CharacterString -->
                     </xsl:element>
                     <!-- gmd:nameOfMeasure -->

                     <!-- /metadata/dataqual/posacc/horizpa/qhorizpa/horizpae -->
                     <xsl:element name="gmd:measureDescription">
                        <xsl:element name="gco:CharacterString">
                           <xsl:value-of select="./Horizontal_Positional_Accuracy_Explanation"/>
                        </xsl:element>
                     </xsl:element>
                     <!-- gmd:measureDescription -->

                     <xsl:element name="gmd:evaluationMethodDescription">
                       <!--   <xsl:comment>This is the right description</xsl:comment>-->
                        <xsl:element name="gco:CharacterString">
                           <xsl:value-of select="/MRF/Data_Quality_Information[1]/Horizontal_Positional_Accuracy_Report"/>
                        </xsl:element>
                        <!-- gco:CharacterString -->
                     </xsl:element>
                     <!-- gmd:evaluationMethodDescription -->

                     <xsl:choose>  <!-- /MRF/Data_Quality_Information/Horizontal_Positional_Accuracy_Report -->
                        <xsl:when test="/MRF/Data_Quality_Information[1]/Quantitative_Horizontal_Positional_Accuracy_Assessment/Horizontal_Positional_Accuracy_Value">
                           <!-- <xsl:if test="/MRF/Data_Quality_Information/Quantitative_Horizontal_Positional_Accuracy_Assessment/Horizontal_Positional_Accuracy_Value"> -->
                           <xsl:element name="gmd:result">
                              <xsl:element name="gmd:DQ_QuantitativeResult">

                                 <xsl:element name="gmd:valueUnit">
                                       <xsl:variable name="AccValueA" select="./MRF/Data_Quality_Information[1]/Quantitative_Horizontal_Positional_Accuracy_Assessment[1]/Horizontal_Positional_Accuracy_Value[1]"/>
                                    <xsl:variable name="AccValue" select="normalize-space(./Horizontal_Positional_Accuracy_Value)"/>
                                       <xsl:variable name="NumOfMeters" select="substring($AccValue,0,5)"/>
                                        <xsl:variable name="postFor" select="substring-after($AccValue,'for ')"/>
                                       <xsl:variable name="ComMeters" select="concat('Meters',$NumOfMeters,'for',$postFor)"/>
                                       <xsl:variable name="ComMetersB" select="normalize-space($ComMeters)"></xsl:variable>
                                    
                                      <!--   <xsl:comment>present:<xsl:value-of select="."></xsl:value-of></xsl:comment>
                                       <xsl:comment>AccValue:<xsl:value-of select="$AccValue"/></xsl:comment>
                                       <xsl:comment>NumOfMeter:<xsl:value-of select="$NumOfMeters"/></xsl:comment>
                                       <xsl:comment>postFor:<xsl:value-of select="$postFor"/></xsl:comment> -->  
                                    <xsl:element name="gml:BaseUnit">

                                       <!--    <xsl:attribute name="gml:id">meters</xsl:attribute>-->
                                       <!-- /MRF/Data_Quality_Information[1]/Quantitative_Horizontal_Positional_Accuracy_Assessment -->
                                      
                                     
                                      
                                     
                                       <xsl:attribute name="gml:id"><xsl:value-of select="$ComMetersB"/></xsl:attribute>  
                                       
                                       <xsl:element name="gml:identifier">
                                          <xsl:attribute name="codeSpace">meters </xsl:attribute>meters</xsl:element>


                                       <xsl:element name="gml:unitsSystem">
                                          <xsl:attribute name="xlink:href">http://www.bipm.org/en/si/ </xsl:attribute>
                                       </xsl:element>
                                       <!-- gml:unitsSystem -->

                                    </xsl:element>
                                    <!-- gml:BaseUnit -->
                                 </xsl:element>
                                 <!-- gmd:valueUnit -->

                                 <!-- /metadata/dataqual/posacc/horizpa/qhorizpa/horizpav -->
                                 <xsl:choose>
                                    <!--             /MRF/Data_Quality_Information/Horizontal_Positional_Accuracy_Report -->
                                    <xsl:when test="/MRF/Data_Quality_Information/Quantitative_Horizontal_Positional_Accuracy_Assessment/Horizontal_Positional_Accuracy_Value">
                                       <xsl:element name="gmd:value">
                                          <xsl:element name="gco:Record">
                                                               <!-- /MRF/Data_Quality_Information/Horizontal_Positional_Accuracy_Report -->
                                             <xsl:value-of select="./Horizontal_Positional_Accuracy_Value" />
                                          </xsl:element>
                                          <!-- gco:Record -->
                                       </xsl:element>
                                       <!-- gmd:value -->
                                    </xsl:when>

                                    <xsl:otherwise>
                                       <!-- nilReason -->
                                       <xsl:element name="gmd:value">
                                          <xsl:attribute name="nilReason">missing</xsl:attribute>
                                       </xsl:element>
                                       <!-- gmd:value -->

                                    </xsl:otherwise>

                                 </xsl:choose>
                              </xsl:element>
                              <!-- gmd:DQ_QuantitativeResult -->
                           </xsl:element>
                           <!-- gmd:result -->
                           <!-- </xsl:if> -->
                        </xsl:when>

                        <xsl:otherwise>
                           <!-- <xsl:element name="gmd:result">
<xsl:attribute name="nilReason">missing</xsl:attribute>
</xsl:element> -->
                           <!-- gmd:result -->

                           <xsl:element name="gmd:result">
                              <xsl:element name="gmd:DQ_QuantitativeResult">
                                 <xsl:element name="gmd:valueUnit">

                                    <xsl:element name="gml:BaseUnit">

                                       <xsl:attribute name="gml:id">meters</xsl:attribute>
                                       <xsl:element name="gml:identifier">
                                          <xsl:attribute name="codeSpace">meters</xsl:attribute>meters</xsl:element>


                                       <xsl:element name="gml:unitsSystem">
                                          <xsl:attribute name="xlink:href">http://www.bipm.org/en/si/</xsl:attribute>
                                       </xsl:element>
                                       <!-- gml:unitsSystem -->

                                    </xsl:element>
                                    <!-- gml:BaseUnit -->
                                 </xsl:element>
                                 <!-- gmd:valueUnit -->


                                 <xsl:element name="gmd:value">
                                    <xsl:element name="gco:Record">Missing</xsl:element>
                                    <!-- gco:Record -->
                                 </xsl:element>
                                 <!-- gmd:value -->
                              </xsl:element>
                              <!-- gmd:DQ_QuantitativeResult -->
                           </xsl:element>
                           <!-- gmd:result -->
                        </xsl:otherwise>
                     </xsl:choose>
                  </xsl:element>
                  <!-- gmd:DQ_AbsoluteExternalPositionalAccuracy -->

               </xsl:element>
               <!-- gmd:report -->
               </xsl:for-each>
          <!--  </xsl:if> --> 
            <!-- /metadata/dataqual/posacc/horizpa -->

            <xsl:element name="gmd:report">
               <xsl:element name="gmd:DQ_CompletenessCommission">
                  <xsl:element name="gmd:evaluationMethodDescription">
                     <xsl:element name="gco:CharacterString">
                        <xsl:value-of select="/MRF/Data_Quality_Information/Completeness_Report"/>
                     </xsl:element>
                  </xsl:element>
                  <xsl:element name="gmd:result">
                     <xsl:attribute name="gco:nilReason">unknown</xsl:attribute>
                  </xsl:element>
                  <!-- gmd:result -->
               </xsl:element>
               <!-- gmd:DQ_CompletenessCommission -->
            </xsl:element>
            <!-- gmd:report -->

            <xsl:if test="/MRF/Data_Quality_Information/Completeness_Report">
               <xsl:element name="gmd:report">
                  <xsl:element name="gmd:DQ_CompletenessOmission">

                     <xsl:element name="gmd:evaluationMethodDescription">
                        <xsl:element name="gco:CharacterString">
                           <xsl:value-of select="/MRF/Data_Quality_Information/Completeness_Report"/>
                        </xsl:element>
                        <!-- gco:CharacterString -->
                     </xsl:element>
                     <!-- gmd:evaluationMethodDescription -->

                     <xsl:element name="gmd:result">
                        <xsl:attribute name="gco:nilReason">unknown</xsl:attribute>
                     </xsl:element>
                     <!-- gmd:result -->


                  </xsl:element>
                  <!-- gmd:DQ_CompletenessOmission -->
               </xsl:element>
               <!-- gmd:report -->
            </xsl:if>
            <!-- /metadata/dataqual/complete -->

            <xsl:if test="/MRF/Data_Quality_Information/Logical_Consistency_Report">
               <xsl:element name="gmd:report">

                  <xsl:element name="gmd:DQ_ConceptualConsistency">
                     <xsl:element name="gmd:measureDescription">
                        <xsl:element name="gco:CharacterString">
                           <xsl:value-of select="/MRF/Data_Quality_Information/Logical_Consistency_Report"/>
                        </xsl:element>
                        <!-- gco:CharacterString -->
                     </xsl:element>
                     <!-- gmd:measureDescription -->

                     <xsl:element name="gmd:result">
                        <xsl:attribute name="gco:nilReason">unknown</xsl:attribute>
                     </xsl:element>
                     <!-- gmd:result -->

                  </xsl:element>
                  <!-- gmd:DQ_ConceptualConsistency -->

               </xsl:element>
               <!-- gmd:report -->
            </xsl:if>
            <!-- /metadata/dataqual[1]/logic[1] -->

            <xsl:element name="gmd:lineage">
               <xsl:element name="gmd:LI_Lineage">
                  <xsl:element name="gmd:processStep">
                     <xsl:element name="gmd:LI_ProcessStep">

                        <xsl:element name="gmd:description">
                           <xsl:element name="gco:CharacterString">
                              <xsl:value-of select="/MRF/Data_Quality_Information/Process_Step/Process_Description"/>
                           </xsl:element>
                           <!-- gco:CharacterString -->
                        </xsl:element>
                        <!-- gmd:description -->

                        <xsl:element name="gmd:dateTime">
                           <!-- <xsl:comment> calling the "dateTimeTemp template for the first time</xsl:comment> -->
                           <xsl:call-template name="dateTimeTemp"/>

                           <!-- <xsl:element name="gco:DateTime"><xsl:value-of select="/metadata/dataqual/lineage/procstep/procdate"/>  </xsl:element>-->
                           <!-- gco:DateTime -->
                        </xsl:element>
                        <!-- gmd:dateTime -->
                        
                        

<!-- xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx -->

                   <xsl:for-each select="/MRF/Data_Quality_Information/Source_Information">
                      
                      <!-- for each variables   <xsl:value-of select="./Ending_Date"/> -->
                      <xsl:variable name="begDate" select="./Beginning_Date"/>
                      <xsl:variable name="endDate" select="./Ending_Date"/>
                      
                      <!--  <xsl:comment>
                         beg date: <xsl:value-of select="$begDate"/>
                         end date: <xsl:value-of select="$endDate"/>
                         
                      </xsl:comment>-->
                       <xsl:element name="gmd:source">
                               <xsl:element name="gmd:LI_Source">

                              <xsl:element name="gmd:description">
                                 <xsl:choose>
                                    <xsl:when test="./Type_of_Source_Media">
                                       <xsl:element name="gco:CharacterString">
                                          <xsl:value-of select="./Type_of_Source_Media"/>
                                       </xsl:element>
                                    </xsl:when>
                                    <xsl:otherwise>
                                       <xsl:attribute name="nilReason">missing</xsl:attribute>
                                    </xsl:otherwise>
                                 </xsl:choose>

                              </xsl:element>



                           <xsl:element name="gmd:sourceCitation">
                                 <xsl:element name="gmd:CI_Citation">
                                  
                                     <xsl:element name="gmd:title">
                                       <xsl:element name="gco:CharacterString">
                                          <xsl:value-of select="./Title"/>
                                       </xsl:element>
                                    </xsl:element> 
                                    
                                  <xsl:variable name="altTitle" select="./Source_Citation_Abbreviation"/>
                                    
                                 <xsl:choose>
                                      <xsl:when test="contains($altTitle,'None')">
                                         
                                      </xsl:when>
                                      <xsl:otherwise>
                                         <xsl:element name="gmd:alternateTitle">
                                            <xsl:element name="gco:CharacterString"><xsl:value-of select="$altTitle"/> </xsl:element>
                                            </xsl:element>
                                      </xsl:otherwise>
                                      
                                    </xsl:choose>
                                    
                                    <xsl:choose>
                                       <xsl:when test="not($begDate =$endDate)">
                                    
                                    <xsl:element name="gmd:date">
                                       <xsl:attribute name="gco:nilReason">inapplicable</xsl:attribute>
                                    </xsl:element> 
                                    <xsl:comment>See the gmd:sourceExtent element below for the date range</xsl:comment>
                                       </xsl:when>
                                       <xsl:otherwise>
                                  <xsl:element name="gmd:date">
                                        <xsl:element name="gmd:CI_Date">
                                          <!--  <xsl:variable name="endDate" select="./Ending_Date"/>-->
                                          <xsl:choose>
                                             <xsl:when test="contains($endDate,'Unknown')">
                                                <xsl:element name="gmd:date">
                                                   <xsl:attribute name="gco:nilReason">unknown</xsl:attribute>
                                                   </xsl:element>
                                             </xsl:when>
                                             <xsl:otherwise>
                                                 <xsl:element name="gmd:date">
                                                    <xsl:variable name="endDateLength" select="string-length($endDate)"/>
                                                    <xsl:element name="gco:Date">
                                            <xsl:choose>
                                               
                                               <xsl:when test="$endDateLength=6">
                                                  <xsl:variable name="year" select="substring($endDate,1,4)"/>
                                                  <xsl:variable name="month" select="substring($endDate,5,2)"/>
                                                  <xsl:variable name="corrCitDate" select="concat($year,'-',$month)"/>
                                                  <xsl:value-of select="$corrCitDate"/>
                                               </xsl:when>
                                               <xsl:otherwise>
                                                   
                                                <xsl:value-of select="$endDate"/>
                                             
                                             
                                               </xsl:otherwise>
                                            </xsl:choose>
                                                   </xsl:element>
                                          </xsl:element>
                                          
                                             </xsl:otherwise>
                                          </xsl:choose> 
                                         
                                   

                                        <xsl:element name="gmd:dateType">
                                              <xsl:element name="gmd:CI_DateTypeCode">
                                                <xsl:variable name="SorCurRef" select="./Source_Currentness_Reference"/> 
                                                 <xsl:variable name="creation">creation</xsl:variable>
                                                 <xsl:variable name="pubDate">publication</xsl:variable>
                                                <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#CI_DateTypeCode</xsl:attribute>
                                                
                                                
                                                <xsl:attribute name="codeListValue">
                                                   <xsl:choose>
                                                      <xsl:when test="contains($SorCurRef,'effective date')">
                                                         <xsl:value-of select="$creation"/> 
                                                      </xsl:when>
                                                      <xsl:when test="contains($SorCurRef,'publication date')">
                                                         <xsl:value-of select="$pubDate"/>
                                                      </xsl:when>
                                                      <xsl:otherwise>
                                                         <xsl:value-of select="./Source_Currentness_Reference[1]"/> 
                                                      </xsl:otherwise>
                                                   </xsl:choose>
                                                </xsl:attribute>
                                               
                                                 <xsl:choose>
                                                    <xsl:when test="contains($SorCurRef,'effective date')">
                                                       creation
                                                    </xsl:when>
                                                    <xsl:when test="contains($SorCurRef,'publication date')">
                                                       <xsl:value-of select="$pubDate"/>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                       <xsl:value-of select="./Source_Currentness_Reference[1]"/> 
                                                    </xsl:otherwise>
                                                 </xsl:choose>
                                            </xsl:element>
                                          </xsl:element> 
                                       </xsl:element>
                                       </xsl:element> 
                                       </xsl:otherwise>
                                    </xsl:choose>
                                   
                                    <xsl:element name="gmd:citedResponsibleParty">
                                       <xsl:element name="gmd:CI_ResponsibleParty">
                                          <xsl:element name="gmd:organisationName">
                                         
                                             <xsl:element name="gco:CharacterString"><xsl:value-of select="normalize-space(./Originator)"/></xsl:element>
                                          </xsl:element>
                                          <xsl:element name="gmd:role">
                                             <xsl:element name="gmd:CI_RoleCode">
                                                <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#CI_RoleCode</xsl:attribute>
                                                <xsl:attribute name="codeListValue">originator</xsl:attribute>originator
                                             </xsl:element>
                                          </xsl:element>
                                       </xsl:element>
                                    </xsl:element>
                                    
                                    <xsl:element name="gmd:otherCitationDetails">
                                       <xsl:element name="gco:CharacterString"> Source Contribution: <xsl:value-of select="./Source_Contribution"/></xsl:element>
                                    </xsl:element>

                                 </xsl:element>
                                
                              </xsl:element>
                             
                                  <xsl:if test="not($begDate =$endDate)">
                                  <xsl:element name="gmd:sourceExtent">
                                     <xsl:element name="gmd:EX_Extent">
                                        <xsl:element name="gmd:temporalElement">
                                           <xsl:element name="gmd:EX_TemporalExtent">
                                              <xsl:element name="gmd:extent">
                                                 <xsl:element name="gml:TimePeriod">
                                                    <xsl:variable name="Title" select="./Title[1]"/>
                                                    <xsl:variable name="TitleB" select="substring($Title,0,5)"/>
                                                    
                                                    <xsl:variable name="finalTitle" select="concat($TitleB,$begDate)"/>
                                                    <xsl:variable name="timeId" select="substring($Title,0,5)"/>
                                                    <xsl:attribute name="gml:id"><xsl:value-of select="$finalTitle"/></xsl:attribute>
                                                    <xsl:element name="gml:beginPosition"><xsl:value-of select="$begDate"/></xsl:element>
                                                    <xsl:element name="gml:endPosition"> <xsl:value-of select="$endDate"/></xsl:element>
                                                 </xsl:element>
                                              </xsl:element>
                                           </xsl:element>
                                        </xsl:element>
                                     </xsl:element>
                                  </xsl:element>
                                  </xsl:if>
                           </xsl:element>
                           
                        </xsl:element>
                        
                   </xsl:for-each>
                        <!-- xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx -->
                        
                        
                        
                        
                     </xsl:element>
                     <!-- gmd:LI_ProcessStep -->
                  </xsl:element>
                  <!-- gmd:processStep -->
                  <!-- <xsl:comment> calling the template !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!</xsl:comment> -->
                  <!-- <xsl:call-template name="DataQualitySource"/> -->

               </xsl:element>
               <!-- gmd:LI_Lineage -->
            </xsl:element>
            <!-- gmd:lineage -->

         </xsl:element>
         <!-- gmd:DQ_DataQuality -->
      </xsl:element>
      <!-- gmd:dataQualityInfo -->

   </xsl:template>

   <xsl:template name="dateTimeTemp">
      <xsl:variable name="ProcDate" select="/MRF/Data_Quality_Information/Process_Step/Process_Date"/>
      <xsl:variable name="ProcTime" select="/MRF/Data_Quality_Information/Process_Step/Process_Time"/>
      <xsl:variable name="ProcTimeLength"
         select="string-length(/MRF/Data_Quality_Information/Process_Step/Process_Time/Process_Time)"/>
      <xsl:variable name="year" select="substring($ProcDate,1,4)"/>
      <xsl:variable name="month" select="substring($ProcDate,5,2)"/>
      <xsl:variable name="monthLength" select="string-length($month)"/>
      <xsl:variable name="day" select="substring($ProcDate,7,2)"/>
      <xsl:variable name="dayLength" select="string-length($day)"/>

      <xsl:choose>
         <xsl:when test="$ProcTimeLength=0">
            <!-- <xsl:comment>Here 1!!!!!!!!!!!!!!!</xsl:comment> -->
            <xsl:choose>
               <xsl:when test="$dayLength>0">
                  <!-- <xsl:comment>Here 2!!!!!!!!!!!!!!!</xsl:comment> -->
                  <xsl:variable name="dateFormat"
                     select="concat($year, '-',$month,'-',$day ,'-','T00:00:00')"/>
                  <xsl:element name="gco:Date">
                     <xsl:value-of select="$dateFormat"/>
                  </xsl:element>
               </xsl:when>

               <xsl:when test="$monthLength >0">
                  <!-- <xsl:comment>Here 3!!!!!!!!!!!!!!!</xsl:comment> -->
                  <xsl:variable name="dateFormat"
                     select="concat($year, '-',$month,'-','01T00:00:00')"/>
                  <xsl:element name="gco:DateTime">
                     <xsl:value-of select="$dateFormat"/>
                  </xsl:element>
               </xsl:when>
               <xsl:otherwise>
                  <!-- <xsl:comment> Last Resort</xsl:comment> -->
                  <!-- <xsl:comment>Here 4!!!!!!!!!!!!!!!</xsl:comment> -->
                  <!-- YYYY-MM-DDThh:mm:ss -->
                  <xsl:variable name="dateFormatA" select="concat($year,'-','01','-','01T00:00:00')"/>

                  <xsl:element name="gco:DateTime">
                     <!--     <xsl:comment> I hope this is correct! it is!!!!!!! In the right Template</xsl:comment> -->
                     <!-- <xsl:value-of select ="$dateFormatA"/> -->
                     <xsl:value-of select="$dateFormatA"/>
                  </xsl:element>
                  <!-- <xsl:comment> End of Last Resort</xsl:comment> -->
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$ProcTimeLength>0">
            <!-- <xsl:comment>Here 5!!!!!!!!!!!!!!!</xsl:comment> -->
            <!-- Thh:mm:ss -->
            <xsl:variable name="Hour" select="substring($ProcTime,1,2)"/>
            <xsl:variable name="Min" select="substring($ProcTime,3,2)"/>
            <xsl:variable name="Sec" select="substring($ProcTime,5,2)"/>
            <xsl:variable name="dateFormatA"
               select="concat($year, '-',$month,'-',$day,'T',$Hour,':',$Min,':',$Sec )"/>
            <xsl:element name="gco:DateTime">
               <!-- <xsl:comment>Here 6!!!!!!!!!!!!!!!</xsl:comment>
     <xsl:comment> I hope this is correct! (TIME) it is!!!!!!!</xsl:comment> -->
               <xsl:value-of select="$dateFormatA"/>
            </xsl:element>
         </xsl:when>
      </xsl:choose>
   </xsl:template>

</xsl:stylesheet>
