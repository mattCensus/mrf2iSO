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
   
   <xsl:import href="../mrf2ISO/distCont.xsl"/>
   <xsl:import href="../mrf2ISO/MD_MediumFormatCode.xsl"/>
   <xsl:import href="../mrf2ISO/WMSDist.xsl"/>
   <xsl:import href="../mrf2ISO/ESRIRestPoint.xsl"/>
   
   
   <xd:doc scope="stylesheet">
      <xd:p>mrf2ISO/13_gmd_distributionInfo.xsl</xd:p>
      <xd:p>called by the mrf2ISO/mrf2ISOMaster.xsl template</xd:p>
      <xd:p>calls the followin/g templates:
         Template                                     Stylesheet/File
         MD_MediumFormatCode                          MD_MediumFormatCode.xsl
      </xd:p>
      <xd:ul>
         <xd:li></xd:li>
      </xd:ul>
      <xd:desc>
         <xd:p><xd:b>Created on:</xd:b> Jan 7, 2014</xd:p>
         <xd:p><xd:b>Author:</xd:b> Matthew McCready</xd:p>
         <xd:ul>
            <xd:li>Template                   Explanation                             </xd:li>
            <xd:li>distributionInfo           Handles the gmd:distributionInfo element</xd:li>  
         </xd:ul>
         <xd:p>
            Initial   Date           Description
            MMC       12/12/13       Inserted the gmd:fileDecompressionTechnique element. This is represented by File_Decompression_Technique in the MIF file.
            MMC       1/8/2014       Modified to work on the MRF Format
            MMC       1/7/2015       Modified the gmd:online element to have a choice structure to accomadate KML files.         
            MMC       1/8/2014       Modified to work on the MRF Format. 
            MMC       2/2/2015       Modified the if to work with version 2.0 
            MMC       4/13/2015      Modified to include the "html" format type and a new transferOptions element that links to the cartographic boundary page.
            MMC       5/4/2015       Modified to include a choose structure to handle the main page for the TIGER and Cartographic Pages. Added the cartFiles
                                      and tigerFiles templates
            MMC       4/20/2016      Modified to include the WMS and Rest Point URLS for the NGDA files
            MMC       6/13/2016      Modified to include the  Spatial Products Software Branch 
            MMC       2/8/2017       Modified to update the URLS for "https". Also corrected the puncuation for "HTML" and "HTTP"
            MMC       2/10/2017      Inserted the ascii code for ® (&#174;)
            MMC/      1/19/2018      replaced "http://www.census.gov/geo/maps-data/data/tiger-line.html" with "https://www.census.gov/geo/maps-data/data/tiger-line.html"
            MMC       5/23/19        replaced "https://www.census.gov/geo/maps-data/data/tiger-line.html" with "https://www.census.gov/geographies/mapping-files/time-series/geo/tiger-line-file.html"
         </xd:p>
      </xd:desc>
   </xd:doc>
   
   
   <xsl:output method="xml" version="1.0" encoding="ISO-8859-1" indent="yes"/>


   <xsl:template name="distributionInfo" match="/">
   <xsl:variable name="FileType" select="/MRF/Identification_Information/Citation/Title"/>
      <!--  <xsl:comment>FileType:<xsl:value-of select="$FileType"/></xsl:comment>-->
      <xsl:element name="gmd:distributionInfo">
         <xsl:element name="gmd:MD_Distribution">
            
            <!-- Distribution Format begins here!!!!!!!!!!!!!!!! -->
            <xsl:element name="gmd:distributionFormat">   
               <xsl:element name="gmd:MD_Format">
                  <xsl:element name="gmd:name">
                     <xsl:element name="gco:CharacterString">
                        <xsl:value-of select="/MRF/Distribution_Information/Standard_Order_Process/Digital_Form/Format_Name"/>
                     </xsl:element><!-- gco:CharacterString -->
                  </xsl:element><!-- gmd:name -->

                  <xsl:choose>
                     <xsl:when test="/MRF/Distribution_Information/Standard_Order_Process/Digital_Form/Format_Version">
                        <xsl:element name="gmd:version">
                           <xsl:element name="gco:CharacterString">
                              <xsl:value-of select="/MRF/Distribution_Information/Standard_Order_Process/Digital_Form/Format_Version"/>
                           </xsl:element><!-- gco:CharacterString -->
                        </xsl:element><!-- gmd:version -->
                     </xsl:when>

                     <xsl:when test="/MRF/Distribution_Information/Standard_Order_Process/Digital_Form/Format_Version_Date">
                        <xsl:element name="gmd:version">
                           <xsl:element name="gco:CharacterString">
                              <xsl:value-of select="/MRF/Distribution_Information/Standard_Order_Process/Digital_Form/Format_Version_Date"/>
                           </xsl:element> <!-- gco:CharacterString -->
                        </xsl:element>  <!-- gmd:version -->
                     </xsl:when>

                     <xsl:otherwise>
                        <xsl:element name="gmd:version">
                           <xsl:attribute name="gco:nilReason">unknown</xsl:attribute>
                        </xsl:element>
                     </xsl:otherwise>
                  </xsl:choose>

                  <xsl:choose>
                     <xsl:when test="/MRF/Distribution_Information/Standard_Order_Process/Digital_Form/File_Decompression_Technique">
                        <xsl:element name="gmd:fileDecompressionTechnique">
                           <xsl:element name="gco:CharacterString">
                              <xsl:value-of select="/MRF/Distribution_Information[1]/Standard_Order_Process[1]/Digital_Form[1]/File_Decompression_Technique[1]"/>
                           </xsl:element>
                        </xsl:element>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:element name="gmd:fileDecompressionTechnique">
                           <xsl:attribute name="nilReason">missing</xsl:attribute>
                        </xsl:element>
                     </xsl:otherwise>
                  </xsl:choose>

               </xsl:element> <!-- gmd:MD_Format -->
            </xsl:element><!-- gmd:distributionFormat -->
            <!-- Distribution Format ends here!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
            
            <xsl:element name="gmd:distributionFormat">   
               <xsl:element name="gmd:MD_Format">
                  <xsl:element name="gmd:name">
                     <xsl:element name="gco:CharacterString">HTML</xsl:element><!-- gco:CharacterString -->
                  </xsl:element><!-- gmd:name -->
                  
                  <xsl:element name="gmd:version">
                     <xsl:attribute name="gco:nilReason">unknown</xsl:attribute>
                  </xsl:element>
               </xsl:element>
            </xsl:element>
            
            <xsl:variable name="NgdaCheck" select="/MRF/Identification_Information[1]/Keywords[1]/Theme[1]/Theme_Keyword_Thesaurus[1]"/>
            <!--   <xsl:comment><xsl:value-of select="$NgdaCheck"/></xsl:comment>-->
            <xsl:if test="contains($NgdaCheck,'NGDA Portfolio Themes')">
               <xsl:element name="gmd:distributionFormat">   
                  <xsl:element name="gmd:MD_Format">
                     
                     <xsl:element name="gmd:name">
                        <xsl:element name="gco:CharacterString">WMS</xsl:element>
                     </xsl:element>
                     
                     <xsl:element name="gmd:version">
                        <xsl:element name="gco:CharacterString">1.3.0</xsl:element>
                     </xsl:element>
               
                  </xsl:element>
               </xsl:element>
               
               <xsl:element name="gmd:distributionFormat">   
                  <xsl:element name="gmd:MD_Format">
                     
                     <xsl:element name="gmd:name">
                        <xsl:element name="gco:CharacterString">REST</xsl:element>
                     </xsl:element>
                     
                     <xsl:element name="gmd:version">
                        <xsl:attribute name="gco:nilReason">unknown</xsl:attribute>
                     </xsl:element>
                     
                  </xsl:element>
               </xsl:element>
               
            </xsl:if>
            
            <xsl:element name="gmd:distributor">
               <xsl:element name="gmd:MD_Distributor">
                  <!--  <xsl:comment>calling the template</xsl:comment>--> 
                  <xsl:call-template name="distPointofContact"/>
                  <xsl:element name="gmd:distributionOrderProcess">
                     <!---<xsl:element name="gmd:MD_StandardOrderProcess"> -->
                     <xsl:element name="gmd:MD_StandardOrderProcess">
                        <xsl:element name="gmd:fees">
                           <xsl:element name="gco:CharacterString">
                              <xsl:value-of select="/MRF/Distribution_Information/Standard_Order_Process/Fees"/>
                           </xsl:element><!-- gco:CharacterString -->
                        </xsl:element><!-- gmd:fees -->

                        <xsl:if test="/MRF/Distribution_Information/Standard_Order_Process/Ordering_Instructions">
                           <xsl:element name="gmd:orderingInstructions">
                              <xsl:element name="gco:CharacterString">
                                 <xsl:value-of select="/MRF/Distribution_Information/Standard_Order_Process/Ordering_Instructions"/>
                              </xsl:element><!-- gco:CharacterString -->
                           </xsl:element><!-- gmd:orderingInstructions -->
                        </xsl:if>
                     </xsl:element>
                     <!--</xsl:element> gmd:MD_StandardOrderProcess -->
                  </xsl:element><!-- gmd:distributionOrderProcess -->

               </xsl:element>
               <!-- gmd:MD_Distributor -->
            </xsl:element>
            <!-- gmd:distributor -->

            <!-- online -->
            <xsl:element name="gmd:transferOptions">
               <xsl:element name="gmd:MD_DigitalTransferOptions">
                  
                  <xsl:variable name="formatType" select="/MRF/Distribution_Information/Standard_Order_Process/Digital_Form/Format_Name"/>
                 <!-- <xsl:comment>formatType:<xsl:value-of select="$formatType"/></xsl:comment> -->
                  
                  <xsl:choose>
                     <xsl:when test="$formatType = 'KML'">
                      <!--  <xsl:comment>This is where the KML format goes!!!!!!!!!!!!!!</xsl:comment> -->
                        <xsl:element name="gmd:onLine">
                           <xsl:element name="gmd:CI_OnlineResource">
                              
                              <xsl:element name="gmd:linkage">
                                 <xsl:element name="gmd:URL">
                                    <xsl:value-of select="/MRF/Distribution_Information/Standard_Order_Process/Digital_Form/Digital_Transfer_Option/Network_Resource_Name"/>
                                 </xsl:element> <!-- gmd:URL -->
                              </xsl:element> <!--gmd:linkage  -->
                          
                        
                           <xsl:element name="gmd:protocol">
                              <xsl:element name="gco:CharacterString">HTTP</xsl:element>
                           </xsl:element>
                           
                           <xsl:element name="gmd:applicationProfile">
                              <xsl:element name="gco:CharacterString">Google Earth</xsl:element>
                           </xsl:element>
                           
                           <xsl:element name="gmd:name">
                              <xsl:element name="gco:CharacterString">Keyhole Markup Language (KML)</xsl:element>
                           </xsl:element>
                           
                           <xsl:element name="gmd:description">
                              <xsl:choose>
                                 <xsl:when test="/MRF/Distribution_Information/Standard_Order_Process/Digital_Form/Online_Description">
                                    <xsl:element name="gco:CharacterString">
                                       <xsl:value-of select="/MRF/Distribution_Information/Standard_Order_Process/Digital_Form/Online_Description"/>
                                    </xsl:element>
                                 </xsl:when>
                                 <xsl:when test="/MRF/Distribution_Information[1]/Technical_Prerequisites[1]">
                                    <xsl:element name="gco:CharacterString">
                                       <xsl:value-of select="/MRF/Distribution_Information[1]/Technical_Prerequisites"/>
                                    </xsl:element>
                                 </xsl:when>
                                 <xsl:otherwise>
                                    <xsl:element name="gco:CharacterString">These are the KML files to be used in Google Earth</xsl:element>
                                 </xsl:otherwise>
                              </xsl:choose>
                             
                           </xsl:element>
                           
                           <xsl:element name="gmd:function">
                              <xsl:element name="gmd:CI_OnLineFunctionCode">
                                 <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#CI_OnLineFunctionCode</xsl:attribute>
                                 <xsl:attribute name="codeListValue">download</xsl:attribute>download</xsl:element><!-- gmd:CI_OnLineFunctionCode  --> 
                           </xsl:element><!-- gmd:function  -->
                           </xsl:element> <!-- gmd:CI_OnlineResource -->
                        </xsl:element><!-- gmd:onLine -->
                     </xsl:when>
                   <xsl:otherwise>
                    <xsl:element name="gmd:onLine">
                     <xsl:element name="gmd:CI_OnlineResource">
                        <xsl:element name="gmd:linkage">
                           <xsl:element name="gmd:URL">
                              <xsl:value-of select="/MRF/Distribution_Information/Standard_Order_Process/Digital_Form/Digital_Transfer_Option/Network_Resource_Name"/>
                           </xsl:element> <!-- gmd:URL -->
                        </xsl:element><!-- gmd:linkage -->
                        <xsl:element name="gmd:name">
                              <xsl:element name="gco:CharacterString">Shapefile Zip File</xsl:element>
                        </xsl:element>
                          
                        
                        
                     </xsl:element>
                     <!-- gmd:CI_OnlineResource -->
                  </xsl:element>
                  <!-- gmd:onLine -->
                  </xsl:otherwise>
                  </xsl:choose>
               </xsl:element><!-- gmd:MD_DigitalTransferOptions -->
            </xsl:element><!-- gmd:transferOptions -->
           
           <xsl:choose>
              <xsl:when test="contains($FileType,'Cartographic')">
                 <xsl:call-template name="cartFiles"/>
              </xsl:when>
              <xsl:when test="contains($FileType,'TIGER')">
                 <xsl:call-template name="tigerFiles"/>
              </xsl:when>
           </xsl:choose>
            
             <!--<xsl:element name="gmd:transferOptions">
               <xsl:element name="gmd:MD_DigitalTransferOptions">
                 <xsl:element name="gmd:onLine">
                  <xsl:element name="gmd:CI_OnlineResource">
                     <xsl:element name="gmd:linkage">
                        <xsl:element name="gmd:URL">http://www.census.gov/geo/maps-data/data/tiger-cart-boundary.html</xsl:element>
                     </xsl:element>
                       <xsl:element name="gmd:name">
                        <xsl:element name="gco:CharacterString">Cartographic Boundary Shapefiles</xsl:element>
                     </xsl:element>
                     <xsl:element name="gmd:description">
                        <xsl:element name="gco:CharacterString">Simplified representations of selected geographic areas from the Census Bureau&apos;s MAF/TIGER geographic database</xsl:element>
                     </xsl:element>
                  </xsl:element>
                  </xsl:element>
                  
               </xsl:element>
            </xsl:element>-->
            

            <xsl:if test="/MRF/Recording_Format">
               <xsl:element name="gmd:transferOptions">
                  <xsl:element name="gmd:MD_DigitalTransferOptions">

                     <xsl:element name="gmd:offLine"> <!-- offline -->
                        <xsl:element name="gmd:MD_Medium">

                           <xsl:element name="gmd:name"> </xsl:element>
                           <!-- gmd:name -->

                           <xsl:if test="/MIF/Recording_Format">
                              <!--  <xsl:comment>IN the recording Format </xsl:comment>-->
                              <xsl:call-template name="MD_MediumFormatCode"/>
                           </xsl:if>


                        </xsl:element>
                        <!-- gmd:MD_Medium -->
                     </xsl:element>
                     <!-- gmd:offLine -->
                     <!-- </xsl:if> -->

                  </xsl:element>
                  <!-- gmd:MD_DigitalTransferOptions -->
               </xsl:element>
               <!-- gmd:transferOptions -->
            </xsl:if>

            <!-- ending the elements -->
         </xsl:element>
         <!-- gmd:MD_Distribution -->
      </xsl:element>
      <!-- gmd:distributionInfo -->

   </xsl:template>
   
   <xsl:template name="cartFiles">
      <xsl:element name="gmd:transferOptions">
         <xsl:element name="gmd:MD_DigitalTransferOptions">
            <xsl:element name="gmd:onLine">
               <xsl:element name="gmd:CI_OnlineResource">
                  <xsl:element name="gmd:linkage">
                     <xsl:element name="gmd:URL">https://www.census.gov/geo/maps-data/data/tiger-cart-boundary.html</xsl:element>
                  </xsl:element>
                  <xsl:element name="gmd:name">
                     <xsl:element name="gco:CharacterString">Cartographic Boundary Shapefiles</xsl:element>
                  </xsl:element>
                  <xsl:element name="gmd:description">
                     <xsl:element name="gco:CharacterString">Simplified representations of selected geographic areas from the Census Bureau&apos;s MAF/TIGER geographic database</xsl:element>
                  </xsl:element>
               </xsl:element>
            </xsl:element>
            
         </xsl:element>
      </xsl:element>
   </xsl:template>
   
   <xsl:template name="tigerFiles">
      <xsl:element name="gmd:transferOptions">
         <xsl:element name="gmd:MD_DigitalTransferOptions">
            <xsl:element name="gmd:onLine">
               <xsl:element name="gmd:CI_OnlineResource">
                  <xsl:element name="gmd:linkage">
                     <xsl:element name="gmd:URL">https://www.census.gov/geographies/mapping-files/time-series/geo/tiger-line-file.html</xsl:element>
                  </xsl:element>
                  <xsl:element name="gmd:name">
                     <xsl:element name="gco:CharacterString">TIGER/Line&#174; Shapefiles</xsl:element>
                  </xsl:element>
                  <xsl:element name="gmd:description">
                     <xsl:element name="gco:CharacterString">Should be used for most mapping projects--this is our most comprehensive dataset. Designed for use with GIS
                                                            (geographic information systems).</xsl:element>
                  </xsl:element>
               </xsl:element>
            </xsl:element>
            
         </xsl:element>
      </xsl:element>
      
      <xsl:variable name="NgdaCheck" select="/MRF/Identification_Information[1]/Keywords[1]/Theme[1]/Theme_Keyword_Thesaurus[1]"/>
      <!--   <xsl:comment><xsl:value-of select="$NgdaCheck"/></xsl:comment>-->
      <xsl:if test="contains($NgdaCheck,'NGDA Portfolio Themes')">
         <!--  <xsl:comment>calling the WMS and Rest Point Templates</xsl:comment>-->
         <xsl:call-template name="WMSDist"/>
         <xsl:call-template name="EsriRest"/>
      </xsl:if>
   </xsl:template>
   
   
</xsl:stylesheet>
