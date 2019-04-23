<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">

		<html>
			<head>
				<title> Computers</title>
			</head>
			<body>
				<xsl:apply-templates select="equipment" />
			</body>
		</html>
	</xsl:template>

	<xsl:template match="equipment">
		<xsl:for-each select="computers/*">
			<xsl:if test="software/*/title = 'Windows NT Server 4.0'">
				<p style="color:#1216BF">
					Name:
					<xsl:value-of select="@networkname" />
				</p>
				<p style="color:#E61E99">
					OS:
					<xsl:value-of select="software/*/title" />
				</p>


				<p style="color:#8CBB25">
					Service Pack Installed:
					<xsl:choose>
						<xsl:when test="software/*/*/*[last()]/@name !='' ">
							<xsl:value-of select="software/*/*/*[last()]/@name" />
						</xsl:when>

						<xsl:otherwise>
							Not installed:
						</xsl:otherwise>

					</xsl:choose>
				</p>

				<p style="color:#F24526">
					CDROM drive:
					<xsl:apply-templates select="hardware/drives" />
				</p>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>



	<xsl:template match="hardware/drives">
		<xsl:choose>
			<xsl:when test="/*/@type ='cd'">
				Yes:
			</xsl:when>

			<xsl:otherwise>
				No:
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>


</xsl:stylesheet>

