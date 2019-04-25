<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<html>
			<body>
				<h2>Computers</h2>

				<xsl:apply-templates
					select="equipment/computers/computer" />
			</body>
		</html>
	</xsl:template>


	<xsl:template match="computer">
		<xsl:if	test="software/item[@type = 'os']/title = 'Windows NT Server 4.0'">
			<ul>
				<li>
					Name:
					<xsl:value-of select="@networkname" />
				</li>

				<xsl:apply-templates select="software" />
				<xsl:apply-templates select="hardware" />
			</ul>
		</xsl:if>
	</xsl:template>


	<xsl:template match="software">
		<li>
			OS:
			<xsl:value-of select="item[@type = 'os']/title" />
		</li>
		<li>
			Service pack installed:
			<xsl:choose>

				<xsl:when test="item[@type = 'os']/servicepacks">
					<xsl:value-of select="item[@type = 'os']/servicepacks/servicepack[last()]/@name" />
				</xsl:when>

				<xsl:otherwise>
					Not installed
				</xsl:otherwise>

			</xsl:choose>
		</li>
	</xsl:template>


	<xsl:template match="hardware">
		<li>
			CDROM drive:
 
 			<xsl:choose>
				<xsl:when test="drives/drive/@type = 'cd'">
					Yes
				</xsl:when>
				<xsl:otherwise>
					No
				</xsl:otherwise>
			</xsl:choose>

		</li>
	</xsl:template>


</xsl:stylesheet>