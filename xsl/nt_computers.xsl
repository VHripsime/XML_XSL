<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<html>
			<body>
				<xsl:apply-templates />
			</body>
		</html>
	</xsl:template>

	<xsl:template match="equipment">
			
		<xsl:apply-templates select="computers" />
	
	</xsl:template>

	<xsl:template match="computer">

		<xsl:if test="software/item/title='Windows NT Server 4.0'">
			
			<p>Name:<xsl:value-of select="@networkname"/></p>
			
			<xsl:apply-templates select="software/item[@type='os']" />
		
			<p>CDROM drive:<xsl:apply-templates select="hardware"/></p>
		
		</xsl:if>

	</xsl:template>
	
		
	<xsl:template match="item">
		
		<p>OS:<xsl:value-of select="title" /></p>
		<xsl:apply-templates select="servicepacks"/>
	
	</xsl:template>
	
	<xsl:template match="servicepacks">
	
	<xsl:choose>
		
		<xsl:when test="servicepack/@name != ' '">
			<p>Service pack installed:<xsl:value-of select="servicepack/@name"/></p>
		</xsl:when>
		
		<xsl:otherwise>
			<p>Not installed</p>
		</xsl:otherwise>
	
	</xsl:choose>	
	
	</xsl:template>
	
	<xsl:template match="hardware">
	
		<xsl:choose>		
			<xsl:when test="drives/drive/@type='cd'">No</xsl:when>
			<xsl:otherwise>Yes</xsl:otherwise>
		</xsl:choose>

	</xsl:template>

</xsl:stylesheet>
