<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">

		<html>
			<head>
				<title> Computers</title>
			</head>
			<body>
				<xsl:apply-templates
					select="equipment/computers/computer" />

			</body>
		</html>
	</xsl:template>



	<xsl:template match="computer">

		<xsl:if test="software/*/title = 'Windows NT Server 4.0'">
			Name:
			<xsl:value-of select="@networkname" />
			<br />
			<xsl:apply-templates select="software" />
			<br />
			<xsl:apply-templates select="hardware/drives" />
			<br />

		</xsl:if>

	</xsl:template>



	<xsl:template match="software">

		OS:
		<xsl:value-of select="item[@type ='os']/title" />
		<br />
		Service Pack Installed:
		<xsl:choose>

			<xsl:when test="item/servicepacks/servicepack[last()]/@name !='' ">
				<xsl:value-of select="item/servicepacks/servicepack[last()]/@name" />
			</xsl:when>

			<xsl:otherwise>
				Not installed:
			</xsl:otherwise>

		</xsl:choose>

	</xsl:template>

	<xsl:template match="drives">
	CDROM drive:
		<xsl:choose>
			<xsl:when test="*/@type ='cd'">
				Yes:
			</xsl:when>

			<xsl:otherwise>
				No:
			</xsl:otherwise>
		</xsl:choose>
		<br />
	</xsl:template>

</xsl:stylesheet>

