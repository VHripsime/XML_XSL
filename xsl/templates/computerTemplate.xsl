<?xml version="1.0"?>
<xsl:stylesheet version="1.0"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="equipment">
		<xsl:for-each select="computers/*">
			<xsl:if
				test="software/item[@type = 'os']/title = 'Windows NT Server 4.0'">

				<ul>
					<xsl:call-template name="networkName" />
					<xsl:apply-templates select="software" />
					<xsl:apply-templates select="hardware" />
				</ul>

			</xsl:if>
		</xsl:for-each>
	</xsl:template>


	<xsl:template name="networkName">
		<li>
			Name:
			<xsl:value-of select="@networkname" />
		</li>
	</xsl:template>


	<xsl:template match="software">
		<li>
			OS:	<xsl:value-of select="item[@type = 'os']/title" />
		</li>

		<li>
			Service pack installed:
			<xsl:choose>				
				
				<xsl:when test="item[@type = 'os']/servicepacks/servicepack[last()]/@name">
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
			
			<xsl:variable name="flag">
				<xsl:for-each select="drives/*">					
										
					<xsl:if test="@type = 'cd'">
						<xsl:text>true</xsl:text>
					</xsl:if>				
				
				</xsl:for-each>
			</xsl:variable>

			<xsl:choose>
				<xsl:when test="$flag='true'"> Yes </xsl:when>
				<xsl:otherwise>	No </xsl:otherwise>
			</xsl:choose>

		</li>
	</xsl:template>

</xsl:stylesheet>