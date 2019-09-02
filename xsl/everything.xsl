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

	<!-- Computers -->
	<xsl:template match="computers/computer">
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
				MHZ:
				<xsl:value-of select="hardware/cpu/@mhzclock" />
				<br />
				RAM:
				<xsl:value-of select="hardware/ram/@amount" />
				<br />
				Storage:
				<xsl:value-of select="hardware/storage/@space" />
				<br />
				<xsl:if test="hardware/drives/drive[@type = 'floppy']">
					Floppy:Yes
					<br />
				</xsl:if>

				<xsl:if test="hardware/drives/drive[@type = 'cd']">
					CD:Yes
					<br />
				</xsl:if>

				<xsl:if test="hardware/soundcard">
					SoundCard:
					<xsl:value-of select="hardware/soundcard" />
				</xsl:if>
			</td>
			
			<td>
				<xsl:if test="software/item[@type='os']">
				OS:<xsl:value-of select="software/item[@type='os']/title" />
				<br />
				</xsl:if>
				
				<xsl:if test="software/item[@type='antivirus']">
				Antivirus:<xsl:value-of select="software/item[@type='antivirus']/title" />
				<br />
				</xsl:if>
				
				<xsl:if test="software/item[@type='development']">
				Development:<xsl:value-of select="software/item[@type='development']/title" />
				<br />
				</xsl:if>
				
				<xsl:if test="software/item[@type='rational']">
				Rational:<xsl:value-of select="software/item[@type='rational']/title" />
				<br />
				</xsl:if>
				
				<xsl:if test="software/item[@type='db']">
				DB:<xsl:value-of select="software/item[@type='db']/title" />
				<br />
				</xsl:if>
			

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

	



