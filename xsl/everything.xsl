<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="network.xsl" />
	<xsl:template match="/">

		<html>
			<body>
				<h1>Computers</h1>
				<table border="1">
					<tr bgcolor="#ac5353">
						<th>#</th>
						<th>Name</th>
						<th>Type</th>
						<th>Hardware</th>
						<th>Software</th>
					</tr>
					<xsl:apply-templates
						select="equipment/computers" />
				</table>

				<!-- Network -->
				<xsl:apply-imports />

				<h1>Peripherals</h1>
				<table border="1">
					<tr bgcolor="#ac5353">
						<th>#</th>
						<th>Name</th>
						<th>Type</th>
						<th>Location</th>
					</tr>
					<xsl:apply-templates
						select="equipment/peripherals" />
				</table>

			</body>
		</html>
	</xsl:template>

	<xsl:template match="computers/*">
		<tr>
			<td>
				<xsl:number format="1" />
			</td>

			<td>
				<xsl:value-of select="@networkname" />
			</td>

			<td>
				<xsl:value-of select="@type" />
			</td>

			<td>
				<xsl:value-of select="hardware/cpu/@type" />
			</td>
			<td>
				<xsl:value-of select="software/item[1]/title" />
				,
				<xsl:value-of select="software/item[2]/title" />
				,
				<xsl:value-of select="software/item[3]/title" />

			</td>
		</tr>

	</xsl:template>

	<xsl:template match="peripherals/*/*">
		<tr>
			<td>
				<xsl:number format="1" />
			</td>
			<td>
				N/A
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

	



