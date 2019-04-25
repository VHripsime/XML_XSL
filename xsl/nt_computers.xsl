<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<html>
			<body>
				<h2>Computers</h2>
				<xsl:apply-templates
					select="equipment/computers/computer" />
			</body>
		</html>
	</xsl:template>

	<xsl:template match='computer'>
		<xsl:if
			test="software/item[@type='os']/title='Windows NT Server 4.0'">
			<br />
			Name:
			<xsl:value-of select="@networkname" />
			<br />

			OS:
			<xsl:value-of select="software/item/title" />
			<br />

			Service pack installed:
			<xsl:choose>
				<xsl:when test="software/item/servicepacks">
					<xsl:value-of
						select="software/item/servicepacks/servicepack[last()]/@name" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>Not installed</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
			<br />

			CDROM drive:
			<xsl:choose>
				<xsl:when test="hardware/drives/drive/@type='cd'">
					Yes
				</xsl:when>
				<xsl:otherwise>
					No
				</xsl:otherwise>
			</xsl:choose>
			<br />

		</xsl:if>
	</xsl:template>
</xsl:stylesheet>