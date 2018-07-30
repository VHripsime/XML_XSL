<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:import href="network.xsl" />

	<xsl:template match="/">
		<html>
			<body>
				<h2>Computers</h2>
				<table border="1" cellspacing="0" cellpadding="2">
					<tr>
						<th>#</th>
						<th>Name</th>
						<th>Type</th>
						<th>Hardware</th>
						<th>Software</th>
					</tr>
					<xsl:apply-templates select="equipment/computers/computer">
					</xsl:apply-templates>
				</table>

				<h2>Network equipment</h2>
				<xsl:apply-imports />

				<h2>Peripherals</h2>
				<table border="1" cellspacing="0" cellpadding="2">
					<tr>
						<th>#</th>
						<th>Name</th>
						<th>Type</th>
						<th>Location</th>
					</tr>
					<xsl:apply-templates
						select="equipment/peripherals//printer | //scanner | //copier">
					</xsl:apply-templates>
				</table>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="computer">
		<tr>
			<td>
				<xsl:value-of select="position()" />
			</td>
			<td>
				<xsl:value-of select="@networkname" />
			</td>
			<td>
				<xsl:value-of select="@type" />
			</td>
			<td>
				<xsl:value-of select="hardware/cpu/@type" />
				/
				<xsl:value-of select="hardware/cpu/@mhzclock" />
				<br />
				ram:
				<xsl:value-of select="hardware/ram/@type" />
				/
				<xsl:value-of select="hardware/ram/@amount" />
				<br />
				<xsl:if test="hardware/soundcard">
					soundcard:
					<xsl:value-of select="hardware/soundcard" />
					<br />
				</xsl:if>
				storage:
				<xsl:value-of select="hardware/storage/@space" />
				<br />
				<xsl:if test="hardware/drives">
					drives:
					<br />
					<xsl:if test="hardware/drives/*/@type = 'floppy'">
						<xsl:value-of select="hardware/drives/drive[@type = 'floppy']/@type" />
						/
						<xsl:value-of
							select="hardware/drives/drive[@type = 'floppy']/@formfactor" />
						/
						<xsl:value-of select="hardware/drives/drive[@type = 'floppy']/@size" />
						<br />
					</xsl:if>

					<xsl:if test="hardware/drives/*/@type = 'cd'">
						<xsl:value-of select="hardware/drives/drive[@type = 'cd']/@type" />
						<br />
					</xsl:if>

					<xsl:if test="hardware/drives/*/@type = 'tape'">
						<xsl:value-of select="hardware/drives/drive[@type = 'tape']/@type" />
						/
						<xsl:value-of select="hardware/drives/drive[@type = 'tape']/@size" />
						<br />
					</xsl:if>

				</xsl:if>
			</td>
			<td>
				<xsl:for-each select="software/node()">
					<p>
					<xsl:text>
						<xsl:value-of select="@type" />
						<xsl:value-of select="." />
						<xsl:for-each select="servicepacks/node()">
							<xsl:if test="name() = 'servicepack'">														
								<xsl:choose>								
									<xsl:when test="@type">
									<xsl:value-of select="name()" />
								:
										<xsl:value-of select="@name" />
										/
										<xsl:value-of select="@type" />; 
									</xsl:when>
									<xsl:otherwise>
									<xsl:value-of select="name()" />
								:
										<xsl:value-of select="@name" />; 
									</xsl:otherwise>
								</xsl:choose>								
							</xsl:if>
						</xsl:for-each>
						</xsl:text>
					</p>
				</xsl:for-each>
			</td>
		</tr>
	</xsl:template>

	<xsl:template match="printer | scanner | copier">
		<tr>
			<td>
				<xsl:value-of select="position()" />
			</td>
			<xsl:choose>
				<xsl:when test="@networkname">
					<td>
						<xsl:value-of select="@networkname" />
					</td>
				</xsl:when>
				<xsl:otherwise>
					<td>N/A</td>
				</xsl:otherwise>
			</xsl:choose>
			<td>
				<xsl:value-of select="type" />
			</td>
			<td>
				<xsl:value-of select="location" />
			</td>

		</tr>
	</xsl:template>
</xsl:stylesheet>