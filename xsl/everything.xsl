<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="network.xsl" />

	<xsl:template match="/">

		<h2 align="center">Computers</h2>
		<table align="center" border="1"
			font-family="arial, sans-serif;" border-collapse="collapse;"
			width="50%;" height="50%;">

			<tr bgcolor="#9acd32">
				<th>Name</th>
				<th>Type</th>
				<th>Hardware</th>
				<th>Software</th>
			</tr>
			<xsl:apply-templates select="equipment/computers" />

		</table>

		<h2 align="center">Network equipment1
		</h2>
		<xsl:apply-imports />

		<h2 align="center">Peripherals</h2>
		<table align="center" border="1"
			font-family="arial, sans-serif;" border-collapse="collapse;"
			width="50%;" height="50%;">
			<tr bgcolor="#9acd32">
				<th>Name</th>
				<th>type</th>
				<th>Location</th>
			</tr>
			<xsl:apply-templates
				select="equipment/peripherals/*" />

		</table>

	</xsl:template>

	<xsl:template match="computer">
		<tr>
			<td>
				<xsl:value-of select="@networkname" />
			</td>
			<td>
				<xsl:value-of select="@type" />
			</td>
			<td>
				<xsl:value-of select="count(hardware/*)" />
			</td>
			<td>
				<xsl:value-of select="count(software/*)" />
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="peripherals/*/*">
		<tr>
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
	</xsl:template>

</xsl:stylesheet>


