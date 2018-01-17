# mrf2iSO
All the xslts needed to transform the Census MRF standard into an ISO 19115 file

Here is a list of all the templates and the files they are in.

 Stylesheet                         Template                                                   Explanation                
01_gmd_fileIdentifier.xsl             gmdfileIdentifier                                          Handles the gmd:fileIdentifier element
02_gmd_language.xsl                   gmdLanguage                                                Handles the gmd:language element
03_gmd_characterSet.xsl               gmd_characterSet                                           Handles the gmd:characterSet element (duplicate)
03_gmd_characterSet.xsl               Metadata_Character_Set                                     Handles the gmd:characterSet element (duplicate)
03_gmd_characterSet.xsl               Metadata_Character_Set_CodeSpace                           Handles the code for the                                     codespace for the                                                                                                                  Metadata_Character_Set 
03B_gmd_parentIdentifier.xsl          parentIdentifier                                           Handles the gmd:parentIdentifier element
<xd:li>04_gmd_hierarchySet.xsl               hierarchySet                                               Handles the gmd:hierarchyLevel element</xd:li>
<xd:li>05_gmd_contact.xsl                    contact                                                    Master template for all the contacts</xd:li>
<xd:li>05_gmd_contact.xsl                    GeographicProductsBranchPointOfContact                     Handles the contact information for the Geographic Products  
                                                                                                         Branch(GPB)when it is the contact</xd:li>
<xd:li>05_gmd_contact.xsl                    GeographicProductsBranchDistributor                        Handles the contact information for the Geographic Products  
                                                                                                         Branch(GPB)  when it is the distributor</xd:li>
<xd:li>05_gmd_contact.xsl                    GeographicProductsBranchDistributorNonDistributionSection  Handles the contact information for the Geographic Products
                                                                                                         Branch (GPB) when it is the distributor (duplicate?)  </xd:li>                
<xd:li>05_gmd_contact.xsl                    GeographicProductsBranchDistributorcitedResponsibleParty   Handles the contact information for the Geographic Products 
                                                                                                         Branch(GPB) when it is the cited responsible party</xd:li>             
<xd:li>05_gmd_contact.xsl                    GeographicProductsBranchCustodian                          Handles the contact information for the Geographic Products
                                                                                                         Branch(GPB) when it is the custodian of the records   </xd:li> 
 <xd:li>05_gmd_contact.xsl                   CartographicProductsBranchPointOfContact                   Handles the contact information for the Cartographic Products
                                                                                                         Branch(CPB) when it is the Point of Contact for the metadata</xd:li>
<xd:li>05_gmd_contact.xsl                    CartographicBrachOriginator                                Handles the contact information for Cartographic Products Branch
                                                                                                         (CPB) when it is the Originator for the metadata</xd:li>
<xd:li>05_gmd_contact.xsl                    CartographicProductsBranchCustodian                        Handles the contact information for the Cartographic Products
                                                                                                         Branch (CPB) when it is the Custodian of the records</xd:li>             
<xd:li>05_gmd_contact.xsl                    GeographyDivisionDistributor                               Handles the contact information for the Geography Division (GEO)
                                                                                                         when it is the distributor of the metadata (duplicate?)</xd:li>
<xd:li>05_gmd_contact.xsl                    GeographyDivisionDistributorNonDistributionSection         Handles the contact information for the Geography Division (GEO)
                                                                                                         when it is the distributor of the metadata (duplicate?)</xd:li>
<xd:li>05_gmd_contact.xsl                    GeographyDivisionDistributorcitedResponsibleParty          Handles the contact information for the Geography Division (GEO)
                                                                                                         when it is the distributor of the metadata (duplicate?)</xd:li>
<xd:li>05_gmd_contact.xsl                    GeographyDivisionOriginator                                Handles the contact information for the Geography Division (GEO) 
                                                                                                         when it is the originator of the metadata</xd:li>              
<xd:li>05_gmd_contact.xsl                    GeographyDivisionPointOfContact                            Handles the contact information for the Geography Division (GEO)
                                                                                                         when it is the point of contact for the metadata</xd:li>
<xd:li>05_gmd_contact.xsl                    defaultContact                                             Handles the contact information when the Branch Division could 
                                                                                                         not be determined </xd:li>
<xd:li>06_gmd_dateStamp.xsl                  dateStamp                                                  Handles the gmd:dateStamp element</xd:li>
<xd:li>06_gmd_dateStamp.xsl                  dateStampFormat                                            Handles the format for the gmd:dateStamp element</xd:li>  
<xd:li>07_gmd_metadataStandardName.xsl       StandardName                                               Handles the gmd:metadataStandardName element</xd:li>  
<xd:li>08_gmd_dataSetURI.xsl                 dataSetURI                                                 Handles the gmd:dataSetURI element </xd:li>  
<xd:li>09_gmd_spatialRepresentationInfo.xsl  SDTSListValueTemp                                          Handles the gmd:MD_GeometricObjectTypeCode element</xd:li>  
<xd:li>09_gmd_spatialRepresentationInfo.xsl  spatialRepresentationInfo                                  Handles the gmd:MD_VectorSpatialRepresentation element</xd:li> 
<xd:li>10_gmd_referenceSystemInfo.xsl        referenceSystemInfo                                        Handles the gmd:referenceSystemInfo element for the indirect 
                                                                                                         spatial reference</xd:li>
<xd:li>10_gmd_referenceSystemInfo.xsl        kmlReferenceSystemInfo                                     Handles the gmd:referenceSystemInfo element for KML files </xd:li>        
<xd:li>11_gmd_identificationInfo.xsl         identificationInfo                                         Handles the gmd:identificationInfo element </xd:li>
<xd:li>12_gmd_contentInfo.xsl                contentInfo                                                Handles the gmd:contentInfo element</xd:li> 
<xd:li>12_gmd_contentInfo.xsl                includedWithDatasetA                                       Handles the gmd:includedWithDataset element</xd:li> 
<xd:li>12_gmd_contentInfo.xsl                featureCatalogueCitationDateA                              Handles the gmd:date element</xd:li>
<xd:li>12_gmd_contentInfo.xsl                FC_CitedResponsibleParty                                   Handles the gmd:CI_ResponsibleParty element</xd:li>  
<xd:li>12_gmd_contentInfo.xsl                FCCitedResponsiblePartyList                                Handles the branch for the gmd:CI_ResponsibleParty element</xd:li>        
<xd:li>13_gmd_distributionInfo.xsl           distributionInfo                                           Handles the gmd:distributionInfo element</xd:li>
<xd:li>14_gmd_dataQualityInfo.xsl            dataQualityInfo                                            Handles the gmd:dataQualityInfo element </xd:li>
<xd:li>14_gmd_dataQualityInfo.xsl            dateTimeTemp                                               Handles the gmd:dateTime element </xd:li>  
<xd:li>15_metadataMaintenance.xsl            metadataMaintenance                                        Handles the gmd:metadataMaintenance element</xd:li>  
<xd:li>15_metadataMaintenance.xsl            metaMaintContInfo                                          Handles the contact information for the gmd:metadataMaintenance
                                                                                                         element</xd:li> 
<xd:li>distCont.xsl                          distPointofContact                                         Handles the contact information for distributionInfo section</xd:li>        
<xd:li>ExtraContent.xsl                      FeatureType                                                Handles the gmd:featureTypes for the ContentInfo section</xd:li> 
<xd:li>ExtraContent.xsl                      ContentTitle                                               Handles the gmd:title for the ContentInfo section</xd:li> 
<xd:li>ExtraDataQualityTemplate.xsl          begDateFormatTimePeriod                                    Handles the gml:beginPosition for the identificationInformation</xd:li>  
<xd:li>ExtraDataQualityTemplate.xsl          endDateFormatTimePeriod                                    Handles the gml:endPosition for the identificationInformation</xd:li>  
<xd:li>ExtraDataQualityTemplate.xsl          TemporalExtentTimePeriod                                   formats gml:id namespace</xd:li> 
<xd:li>IdPointOfContact.xsl                  CitedResponsibleParty                                      Handles the contact information for the Citation element for
                                                                                                         for the identificationInformation </xd:li>        
<xd:li>IdPointOfContact.xsl                  pointOfContact                                             Handles the contact information section for the pointOfContact 
                                                                                                         for the identificationInformation</xd:li>        
<xd:li>ISOKeywords.xsl                       ISO_TopicCategories                                        Handles the ISO Topic categories  for the identificationInformation</xd:li>
<xd:li>MD_MaintenanceFrequencyCode.xsl       MD_MaintenanceFrequencyCode                                Handles the gmd:maintenanceAndUpdateFrequency element for the
                                                                                                         identificationInformation and metadataMaintenance sections</xd:li>  
<xd:li>MD_MediumFormatCode.xsl               MD_MediumFormatCode                                        Handles the gmd:mediumFormat for the distributionInfo section</xd:li> 
<xd:li>MD_SpatialRepresentationType.xsl      spatialRepresentationType                                  Handles the gmd:spatialRepresentationType for the 
                                                                                                         identificationInformation </xd:li>
<xd:li>NGDA_Themes.xsl                       NGDAThemes                                                 Handles the the NGDA themes for the identificationInformation  </xd:li>
<xd:li>NonISOKeywords.xsl                    NonISOKeywords                                             Master template for all the other non ISO theme templates</xd:li> 
<xd:li>NonISOKeywords.xsl                    NonThemeISOKeywords                                        Template for all the non ISO keywords</xd:li>
<xd:li>NonISOKeywords.xsl                    PlaceKeywords                                              Template used to create Place theme keywords</xd:li>  
<xd:li>MD_Status.xsl                         MD_Status                                                  Handles the MD_Status element</xd:li>        
