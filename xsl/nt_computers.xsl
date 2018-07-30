<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<body>

				<xsl:for-each select="equipment/computers/computer">
					<xsl:if test="software/item/title = 'Windows NT Server 4.0'">
						<p>
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
									Not installed
								</xsl:otherwise>
							</xsl:choose>
							<br />
							CDROM drive:
							<xsl:choose>
								<xsl:when test="hardware/drives/*/@type = 'cd'">
									Yes
								</xsl:when>
								<xsl:otherwise>
									No
								</xsl:otherwise>
							</xsl:choose>
						</p>
					</xsl:if>
				</xsl:for-each>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>