<?xml version="1.0" encoding="UTF-8"?>
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
    xmlns:ci="http://www.isotc211.org/schemas/2012/ci"
    exclude-result-prefixes="fn grp xs xsi xsl xd" xmlns="http://www.isotc211.org/2005/gfc">

    <xsl:import href="../mrf2ISO/NGDA_Themes.xsl"/>
    <xsl:import href="../mrf2ISO/IdPointOfContact.xsl"/>
    <xsl:import href="../mrf2ISO/MD_SpatialRepresentationType.xsl"/>
    <xsl:import href="../mrf2ISO/03_gmd_characterSet.xsl"/>
    <xsl:import href="../mrf2ISO/MD_MaintenanceFrequencyCode.xsl"/>
    <xsl:import href="../mrf2ISO/ISOTopicCategoryKeywords.xsl"/>
    <xsl:import href="../mrf2ISO/NonISOKeywords.xsl"/>
    <xsl:import href="../mrf2ISO/ExtraDataQualityTemplate.xsl"/>
    <xsl:import href="../mrf2ISO/MD_Status.xsl"/>
    <xsl:import href="../mrf2ISO/CI_PresentationForm.xsl"/>
    <xsl:import href="../mrf2ISO/spatialResolution.xsl"/>

    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Apr 18, 2016</xd:p>
            <xd:p><xd:b>Author:</xd:b> mccre004</xd:p>
            <xd:p/>
        </xd:desc>
    </xd:doc>

    <xsl:template name="graphicOverview">
        <xsl:variable name="title" select="/MRF/Identification_Information/Citation/Title"/>
        <xsl:variable name="postComma1" select="substring-after($title,',')"/>
        <xsl:variable name="postComma2" select="substring-after($postComma1,',')"/>
        <xsl:variable name="levelOfGeo" select="substring-before($postComma2,',')"/>
        <xsl:variable name="theme" select="substring-after($postComma2,',')"/>

        <xsl:choose>
            <xsl:when test="contains($levelOfGeo,'nation')">
                <xsl:element name="gmd:graphicOverview">
                <xsl:element name="gmd:MD_BrowseGraphic">
                    <xsl:element name="gmd:fileName">
                        <xsl:call-template name="browseUrl"/>
                    </xsl:element>
                    <xsl:call-template name="fileDescriptionType"/>
                </xsl:element>
                </xsl:element>
            </xsl:when>
            <xsl:when test="contains($levelOfGeo,'state')">
                <!-- state level files that act like national files -->
                <xsl:choose>
                    <xsl:when test="contains($theme,'ANRC')">
                        <xsl:element name="gmd:graphicOverview">
                        <xsl:element name="gmd:MD_BrowseGraphic">
                        <xsl:element name="gmd:fileName">
                            <xsl:element name="gco:CharacterString">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer?REQUEST=GetMap&amp;SERVICE=WMS&amp;VERSION=1.3.0&amp;LAYERS=Alaska Native Regional Corporations,Alaska Native Regional Corporations Labels&amp;STYLES=default,default&amp;FORMAT=image/svg+xml&amp;BGCOLOR=0xFFFFFF&amp;TRANSPARENT=TRUE&amp;CRS=EPSG:4326&amp;BBOX=54.1892034,-168.6121122,65.2203912,-150.1686423&amp;WIDTH=1090&amp;HEIGHT=751</xsl:element>
                        </xsl:element>
                        <xsl:call-template name="fileDescriptionType"/>
                        </xsl:element>
                        </xsl:element>
                    </xsl:when>
                    <xsl:when test="contains($theme,'Estate')">
                        <xsl:element name="gmd:graphicOverview">
                        <xsl:element name="gmd:MD_BrowseGraphic">
                            <xsl:element name="gmd:fileName">
                        <xsl:element name="gco:CharacterString">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer?REQUEST=GetMap&amp;SERVICE=WMS&amp;VERSION=1.3.0&amp;LAYERS=Estates,Estates Labels&amp;STYLES=default,default&amp;FORMAT=image/svg+xml&amp;BGCOLOR=0xFFFFFF&amp;TRANSPARENT=TRUE&amp;CRS=EPSG:4326&amp;BBOX=18.3366,-64.9147,18.3539,-64.8332&amp;WIDTH=891&amp;HEIGHT=751</xsl:element>
                            </xsl:element>
                            <xsl:call-template name="fileDescriptionType"/>
                        </xsl:element>
                            </xsl:element>
                    </xsl:when>
                    <xsl:when test="contains($theme,'Subbarrio')">
                        <xsl:element name="gmd:graphicOverview">
                        <xsl:element name="gmd:MD_BrowseGraphic">
                            <xsl:element name="gmd:fileName">
                                <xsl:element name="gco:CharacterString">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer?REQUEST=GetMap&amp;SERVICE=WMS&amp;VERSION=1.3.0&amp;LAYERS=Subbarrios,Subbarrios Labels,Counties,Counties Labels&amp;STYLES=default,default,default,default&amp;FORMAT=image/svg+xml&amp;BGCOLOR=0xFFFFFF&amp;TRANSPARENT=TRUE&amp;CRS=EPSG:4326&amp;BBOX=18.4271,-66.0859,18.4618,-66.0430&amp;WIDTH=891&amp;HEIGHT=751</xsl:element>
                            </xsl:element>
                        </xsl:element></xsl:element>
                        
                        </xsl:when>
                </xsl:choose>
            </xsl:when>

        </xsl:choose>
    </xsl:template>

    <xsl:template name="browseUrl">
        <!-- national files -->
        <xsl:variable name="title" select="/MRF/Identification_Information/Citation/Title"/>
        <xsl:variable name="postComma1" select="substring-after($title,',')"/>
        <xsl:variable name="postComma2" select="substring-after($postComma1,',')"/>
        <xsl:variable name="levelOfGeo" select="substring-before($postComma2,',')"/>
        <xsl:variable name="theme" select="substring-after($postComma2,',')"/>
        <xsl:choose>
            <xsl:when test="contains($theme,'AIANNH')">
                <xsl:element name="gco:CharacterString">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer?REQUEST=GetMap&amp;SERVICE=WMS&amp;VERSION=1.3.0&amp;LAYERS=Off-Reservation Trust Lands,Off-Reservation Trust Lands Labels,State American Indian Reservations,State American Indian Reservations Labels,Hawaiian Home Lands,Hawaiian Home Lands Labels,Alaska Native Village Statistical Areas,Alaska Native Village Statistical Areas Labels,Federal American Indian Reservations,Federal American Indian Reservations Labels,Tribal Subdivisions,Tribal Subdivisions Labels,Oklahoma Tribal Statistical Areas,Oklahoma Tribal Statistical Areas Labels&amp;STYLES=default,default,default,default,default,default,default,default,default,default,default,default,default,default&amp;FORMAT=image/svg+xml&amp;BGCOLOR=0xFFFFFF&amp;TRANSPARENT=TRUE&amp;CRS=EPSG:4326&amp;BBOX=+31.7134386,-112.0355607,+32.17347503,-111.6407790&amp;WIDTH=891&amp;HEIGHT=751</xsl:element>
            </xsl:when>
            <xsl:when test="contains($theme,'American Indian Tribal Subdivision')">
                <xsl:element name="gco:CharacterString">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer?REQUEST=GetMap&amp;SERVICE=WMS&amp;VERSION=1.3.0&amp;LAYERS=Tribal Subdivisions,Tribal Subdivisions Labels,Oklahoma Tribal Statistical Areas,Oklahoma Tribal Statistical Areas Labels&amp;STYLES=default,default,default,default&amp;FORMAT=image/svg+xml&amp;BGCOLOR=0xFFFFFF&amp;TRANSPARENT=TRUE&amp;CRS=EPSG:4326&amp;BBOX=+31.7134386,-112.0355607,+32.17347503,-111.6407790&amp;WIDTH=891&amp;HEIGHT=751</xsl:element>
            </xsl:when>
            <xsl:when test="contains($theme,'CBSA')">
                <xsl:element name="gco:CharacterString">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer?REQUEST=GetMap&amp;SERVICE=WMS&amp;VERSION=1.3.0&amp;LAYERS=Metropolitan Statistical Areas,Metropolitan Statistical Areas Labels,Micropolitan Statistical Areas,Micropolitan Statistical Areas Labels&amp;STYLES=default,default,default,default&amp;FORMAT=image/svg+xml&amp;BGCOLOR=0xFFFFFF&amp;TRANSPARENT=TRUE&amp;CRS=EPSG:4326&amp;BBOX=41.187053,-73.508142,42.88679,-69.858861&amp;WIDTH=891&amp;HEIGHT=751</xsl:element>
            </xsl:when>
            <xsl:when test="contains($theme,'Congressional District')">
                <xsl:element name="gco:CharacterString">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer?REQUEST=GetMap&amp;SERVICE=WMS&amp;VERSION=1.3.0&amp;LAYERS=115th Congressional Districts,115th Congressional Districts Labels&amp;STYLES=default,default&amp;FORMAT=image/svg+xml&amp;BGCOLOR=0xFFFFFF&amp;TRANSPARENT=TRUE&amp;CRS=EPSG:4326&amp;BBOX=32.860571,-113.5097542,46.389131,-113.509754&amp;WIDTH=1090&amp;HEIGHT=751</xsl:element>
            </xsl:when>
            <xsl:when test="contains($theme,'CNECTA')">
                <xsl:element name="gco:CharacterString">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer?REQUEST=GetMap&amp;SERVICE=WMS&amp;VERSION=1.3.0&amp;LAYERS=Combined New England City and Town Areas,Combined New England City and Town Areas Labels&amp;STYLES=default,default&amp;FORMAT=image/svg+xml&amp;BGCOLOR=0xFFFFFF&amp;TRANSPARENT=TRUE&amp;CRS=EPSG:4326&amp;BBOX= 41.143086,-72.115419,42.131168,-68.9292064&amp;WIDTH=891&amp;HEIGHT=751</xsl:element>
            </xsl:when>
            <xsl:when test="contains($theme,'Current County and Equivalent')">
                <xsl:element name="gco:CharacterString">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer?REQUEST=GetMap&amp;SERVICE=WMS&amp;VERSION=1.3.0&amp;LAYERS=Counties,Counties Labels&amp;STYLES=default,default&amp;FORMAT=image/svg+xml&amp;BGCOLOR=0xFFFFFF&amp;TRANSPARENT=TRUE&amp;CRS=EPSG:4326&amp;BBOX=41.187053,-73.508142,42.88679,-69.858861&amp;WIDTH=891&amp;HEIGHT=751</xsl:element>
            </xsl:when>
            <xsl:when test="contains($theme,'CSA')">
                <xsl:element name="gco:CharacterString">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer?REQUEST=GetMap&amp;SERVICE=WMS&amp;VERSION=1.3.0&amp;LAYERS=Combined Statistical Areas,Combined Statistical Areas Labels&amp;STYLES=default,default&amp;FORMAT=image/svg+xml&amp;BGCOLOR=0xFFFFFF&amp;TRANSPARENT=TRUE&amp;CRS=EPSG:4326&amp;BBOX=32.860571,-114.5097542,46.389131,-110.509754&amp;WIDTH=891&amp;HEIGHT=751</xsl:element>
            </xsl:when>
            <xsl:when test="contains($theme,'Metropolitan Division')">
                <xsl:element name="gco:CharacterString">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer?REQUEST=GetMap&amp;SERVICE=WMS&amp;VERSION=1.3.0&amp;LAYERS=Counties,Counties Labels,Metropolitan Divisions,Metropolitan Divisions Labels&amp;STYLES=default, default, default, default&amp;FORMAT=image/svg+xml&amp;BGCOLOR=0xFFFFFF&amp;TRANSPARENT=TRUE&amp;CRS=EPSG:4326&amp;BBOX=41.187053,-73.508142,42.88679,-69.858861&amp;WIDTH=891&amp;HEIGHT=751</xsl:element>
            </xsl:when>
            <xsl:when test="contains($theme,'Current New England City and Town Area')">
                <xsl:element name="gco:CharacterString">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer?REQUEST=GetMap&amp;SERVICE=WMS&amp;VERSION=1.3.0&amp;LAYERS=Micropolitan New England City and Town Areas,Micropolitan New England City and Town Areas Labels,Metropolitan New England City and Town Areas,Metropolitan New England City and Town Areas Labels&amp;STYLES=default,default,default,default&amp;FORMAT=image/svg+xml&amp;BGCOLOR=0xFFFFFF&amp;TRANSPARENT=TRUE&amp;CRS=EPSG:4326&amp;BBOX=41.187053,-72.508142,42.88679,-69.858861&amp;WIDTH=891&amp;HEIGHT=751</xsl:element>
            </xsl:when>
            <xsl:when test="contains($theme,'NECTA Division')">
                <xsl:element name="gco:CharacterString">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer?REQUEST=GetMap&amp;SERVICE=WMS&amp;VERSION=1.3.0&amp;LAYERS=New England City and Town Area Divisions,New England City and Town Area  Divisions Labels&amp;STYLES=default,default&amp;FORMAT=image/svg+xml&amp;BGCOLOR=0xFFFFFF&amp;TRANSPARENT=TRUE&amp;CRS=EPSG:4326&amp;BBOX=41.187053,-72.508142,42.88679,-69.858861&amp;WIDTH=891&amp;HEIGHT=751</xsl:element>
            </xsl:when>
            <xsl:when test="contains($theme,'Primary Roads')">
                <xsl:element name="gco:CharacterString">https://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_PhysicalFeatures/MapServer/WmsServer?REQUEST=GetMap&amp;SERVICE=WMS&amp;VERSION=1.3.0&amp;LAYERS=Primary Roads&amp;STYLES= default&amp;FORMAT=image/svg+xml&amp;BGCOLOR=0xFFFFFF&amp;TRANSPARENT=FALSE&amp;CRS=EPSG:4326&amp;BBOX=+46.4885652,-123.7376480, +47.8731709, -121.8063833,&amp;WIDTH=891&amp;HEIGHT=751</xsl:element>
            </xsl:when>
            <xsl:when test="contains($theme,'Current State and Equivalent')">
                <xsl:element name="gco:CharacterString">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer?REQUEST=GetMap&amp;SERVICE=WMS&amp;VERSION=1.3.0&amp;LAYERS=States,States Labels&amp;STYLES=default,default&amp;FORMAT=image/svg+xml&amp;BGCOLOR=0xFFFFFF&amp;TRANSPARENT=TRUE&amp;CRS=EPSG:4326&amp;BBOX=32.860571,-113.5097542,46.389131,-113.509754&amp;WIDTH=891&amp;HEIGHT=751</xsl:element>                 
            </xsl:when>
            <xsl:when test="contains($theme,'Tribal Block Group')">
                <xsl:element name="gco:CharacterString">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer?REQUEST=GetMap&amp;SERVICE=WMS&amp;VERSION=1.3.0&amp;LAYERS=Tribal Block Groups,Tribal Block Groups Labels&amp;STYLES=default,default&amp;FORMAT=image/svg+xml&amp;BGCOLOR=0xFFFFFF&amp;TRANSPARENT=TRUE&amp;CRS=EPSG:4326&amp;BBOX=32.501202,-112.203736,32.65104,-111.448354&amp;WIDTH=1090&amp;HEIGHT=751</xsl:element>
            </xsl:when>
            <xsl:when test="contains($theme,'Tribal Census Tract')">
                <xsl:element name="gco:CharacterString">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer?REQUEST=GetMap&amp;SERVICE=WMS&amp;VERSION=1.3.0&amp;LAYERS=Tribal Census Tracts,Tribal Census Tracts Labels&amp;STYLES=default, default&amp;FORMAT=image/svg+xml&amp;BGCOLOR=0xFFFFFF&amp;TRANSPARENT=TRUE&amp;CRS=EPSG:4326&amp;BBOX= 32.501202,-112.203736,33.466104,-110.448354&amp;WIDTH=1090&amp;HEIGHT=751</xsl:element>
            </xsl:when>
            <xsl:when test="contains($theme,'Census  Urban Area')">
                <xsl:element name="gco:CharacterString">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Current/MapServer/WmsServer?REQUEST=GetMap&amp;SERVICE=WMS&amp;VERSION=1.3.0&amp;LAYERS=States,States Labels,2010 Census Urban Clusters,2010 Census Urban Clusters Labels&amp;STYLES=default,default,default,default&amp;FORMAT=image/svg+xml&amp;BGCOLOR=0xFFFFFF&amp;TRANSPARENT=TRUE&amp;CRS=EPSG:4326&amp;BBOX=41.187053,-72.508142,41.28679,-71.858861&amp;WIDTH=891&amp;HEIGHT=751</xsl:element>
            </xsl:when>
            <xsl:when test="contains($theme,'ZCTA5')">
                <xsl:element name="gco:CharacterString">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/tigerWMS_Census2010/MapServer/WmsServer?REQUEST=GetMap&amp;SERVICE=WMS&amp;VERSION=1.3.0&amp;LAYERS=Zip Code Tabulation Areas,Zip Code Tabulation Areas Labels&amp;STYLES=default,default&amp;FORMAT=image/svg+xml&amp;BGCOLOR=0xFFFFFF&amp;TRANSPARENT=FALSE&amp;CRS=EPSG:4326&amp;BBOX=42.299053,-71.408142,42.35679,-70.798861&amp;WIDTH=891&amp;HEIGHT=751 </xsl:element>
            </xsl:when>
            
        </xsl:choose>
    </xsl:template>

    <xsl:template name="fileDescriptionType">
        <xsl:element name="gmd:fileDescription">
            <xsl:element name="gco:CharacterString">URL for the TigerWeb Web Mapping Service</xsl:element>
        </xsl:element>
        <xsl:element name="gmd:fileType">
            <xsl:element name="gco:CharacterString">URL for the TigerWeb Web Mapping Service</xsl:element>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>
