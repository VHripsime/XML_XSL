<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<html>
			<body>
				<xsl:apply-templates />
			</body>
		</html>
	</xsl:template>



<!-- 	<xsl:template match="equipment">
		<xsl:for-each select="computers/*">
			<ul>
				<li>
					Name:
					<xsl:value-of select="@networkname" />
				</li>
				<li>OS: </li>
			</ul>
		</xsl:for-each>
	</xsl:template> -->


	<xsl:template match="equipment">
		<xsl:for-each select="computers/computer/software/item">

			<xsl:if test="@type = 'os'">
				<xsl:value-of select="title" />
			</xsl:if>

		</xsl:for-each>
	</xsl:template>

</xsl:stylesheet>