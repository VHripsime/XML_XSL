<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<body>
				<xsl:apply-templates
					select="equipment/computers" />
			</body>
		</html>
	</xsl:template>

	<xsl:template match="computers/computer">
		<xsl:if
			test="software/item[@type='os']/title = 'Windows NT Server 4.0'">
			<p>
				Networkname:
				<xsl:value-of select="@networkname" />
			</p>
			<p>
				OS:
				<xsl:value-of select="software/item[@type='os']/title" />
			</p>

			<p>
				Service pack installed:
				<xsl:value-of
					select="software/item[@type='os']/servicepacks/servicepack/@name" />
			</p>

			<xsl:choose>
				<xsl:when test="hardware/drives/drive/@type='cd'">
					<p>CDROM drive: yes</p>
				</xsl:when>
				<xsl:otherwise>
					<p>CDROM drive: no</p>
				</xsl:otherwise>
			</xsl:choose>

		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
