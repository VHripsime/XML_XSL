<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="equipment" name='computers'>
	<h2>Computers</h2>
		<table border='1' cellpadding="4">
			<tr bgcolor="#F0F0F0">
				<th width="30px" align="center">#</th>
				<th width="80px">Name</th>
				<th width="80px">Type</th>
				<th width="285px">Hardware</th>
				<th width="220px">Software</th>
			</tr>			
			<xsl:call-template name="result" />
		</table>
	</xsl:template>


	<xsl:template name="result">
		<xsl:for-each select="computers/*">
			<tr>
				<td align="center">
					<xsl:number value="position()" />
				</td>
				<td>
					<xsl:value-of select="@networkname" />
				</td>
				<td>
					<xsl:value-of select="@type" />
				</td>
				<td>
					<xsl:for-each select="hardware/*">
						<xsl:call-template name="hardwareParameters" />
					</xsl:for-each>
				</td>
				<td valign="top">
					<xsl:for-each select="software/*">
						<xsl:call-template name="programs" />
					</xsl:for-each>
				</td>
			</tr>
		</xsl:for-each>
	</xsl:template>


	<xsl:template name="hardwareParameters">
		<xsl:choose>

			<xsl:when test="@*">
				<xsl:call-template name="withAttributes" />
			</xsl:when>

			<xsl:when test="./*">
				<xsl:call-template name="withElements" />
			</xsl:when>

			<xsl:otherwise>
				<xsl:call-template name="withValue" />
			</xsl:otherwise>

		</xsl:choose>
	</xsl:template>


	<xsl:template name="programs">
		<b>
			<xsl:value-of select="@type" />
		</b>
		<br />
		<xsl:value-of select="title" />
		<br />
		<br />
		<hr />
	</xsl:template>


	<xsl:template name="withAttributes">
		<b>
			<xsl:value-of select="name()" />
		</b>
		<br />
		<xsl:for-each select="@*">
			<xsl:value-of select="name()" />
			-
			<xsl:value-of select="." />
			<br />
		</xsl:for-each>
		<hr />
	</xsl:template>


	<xsl:template name="withElements">
		<b>
			<xsl:value-of select="name()" />
		</b>
		<br />
		<xsl:for-each select="./*">
			<xsl:for-each select="@*">
				<xsl:value-of select="name()" />
				-
				<xsl:value-of select="." />
				,
			</xsl:for-each>
			<br />
		</xsl:for-each>
	</xsl:template>


	<xsl:template name="withValue">
		<b>
			<xsl:value-of select="name()" />
		</b>
		<br />
		<xsl:value-of select="." />
		<br />
		<br />
		<hr />
	</xsl:template>

</xsl:stylesheet>