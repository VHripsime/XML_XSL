<?xml version="1.0" encoding="UTF-8"?>
<!-- In this task we display about coputer's software -->
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<body>
				<xsl:apply-templates select="//software" />
			</body>
		</html>
	</xsl:template>
	<xsl:template match="software">
		<p>
			<xsl:if test="item/title = 'Windows NT Server 4.0'">
				<p>
					Name:
					<xsl:value-of select="../@networkname" />
				</p>
				<p>
					OS:
					<xsl:value-of select="item/title" />
				</p>
				<p>
					Service pack installed:
					<xsl:choose>
						<xsl:when test="//servicepack[last()]/@type">
							<xsl:value-of select="item/servicepacks/servicepack[last()]/@type" />
							/
							<xsl:value-of select="item/servicepacks/servicepack[last()]/@name" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="item/servicepacks/servicepack[last()]/@name" />
						</xsl:otherwise>
					</xsl:choose>
				</p>
				<p>
					CDROM drive:
					<xsl:choose>
						<xsl:when test="..//drive/@type = 'cd'">
							Yes
						</xsl:when>
						<xsl:otherwise>
							No
						</xsl:otherwise>
					</xsl:choose>
				</p>
			</xsl:if>
			<br />
		</p>
	</xsl:template>
</xsl:stylesheet>