<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<body>
				<xsl:for-each select="equipment/computers/computer">
					<xsl:if test="software/item/title='Windows NT Server 4.0'">
						<h4>
							Name:
							<xsl:value-of select="@networkname" />
							<br />
							OS:
							<xsl:value-of select="software/item/title" />
						</h4>
						<h4>
							Service pack installed:
							<xsl:choose>
								<xsl:when test="software/item/servicepacks">
									<xsl:value-of
										select="software/item/servicepacks/servicepack[last()]/@name" />
									<xsl:if test="software/item/servicepacks/servicepack[last()]/@type">
										<xsl:value-of select="//servicepack[last()]/@type" />
									</xsl:if>
								</xsl:when>
								<xsl:otherwise>
									<h4>Not installed</h4>
								</xsl:otherwise>
							</xsl:choose>
						</h4>
						CDROM drive:
						<xsl:choose>
							<xsl:when test="hardware/drives/*/@type = 'cd'">
								Yes
							</xsl:when>
							<xsl:otherwise>
								No
							</xsl:otherwise>
						</xsl:choose>
					</xsl:if>
				</xsl:for-each>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>