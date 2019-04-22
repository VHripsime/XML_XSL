<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:import href="network.xsl" />

	<xsl:template match="/">
		<html>
			<body>
				<xsl:apply-templates />
				<br />
				<xsl:call-template name="peripherals" />
				<br />
				<xsl:call-template name="computers" />
			</body>
		</html>
	</xsl:template>

	<xsl:template name="peripherals">
		<h2>Peripherals</h2>
		<table border='1' cellpadding="8">
			<tr bgcolor="#F0F0F0">
				<th align="center">#</th>
				<th>Name</th>
				<th>Type</th>
				<th>Location</th>
			</tr>
			<xsl:for-each select="equipment/peripherals/*/*">
				<tr>
					<td align="center">
						<xsl:number value="position()" />
					</td>
					<td>
						<xsl:choose>
							<xsl:when test="@networkname">
								<xsl:value-of select="@networkname" />
							</xsl:when>
							<xsl:otherwise>
								N/A
							</xsl:otherwise>
						</xsl:choose>
					</td>
					<td>
						<xsl:value-of select="type" />
					</td>
					<td>
						<xsl:value-of select="location" />
					</td>
				</tr>
			</xsl:for-each>
		</table>
	</xsl:template>


	<xsl:template name="computers">
		<h2>Computers</h2>
		<table border='1' cellpadding="6">
			<tr bgcolor="#F0F0F0">
				<th align="center">#</th>
				<th>Name</th>
				<th>Type</th>
				<th>Hardware</th>
				<th>Software</th>
			</tr>
			<xsl:for-each select="equipment/computers/*">
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
		</table>
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