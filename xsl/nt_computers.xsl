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

	<xsl:template match="computers/*">
		<p>
			Networkname:
			<xsl:value-of select="@networkname" />
		</p>

		<xsl:if test="//title = 'Windows NT Server 4.0'">
			<p>
				OS:
				<xsl:value-of select="//item[@type='os']/title" />
			</p>

			<p>
				Service pack installed:
				<xsl:value-of select="//@name" />
			</p>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
