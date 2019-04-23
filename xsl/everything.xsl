<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
	<xsl:import href="network.xsl" />
	
	<xsl:template match="/">

		<html>
			<head>
				<title>Everything</title>
			</head>
			<body>
				<h4>Computers</h4>
				<table border="1">
					<tr bgcolor="#1D79E7">

						<th>#</th>
						<th>Name</th>
						<th>Type</th>
						<th>Hardware</th>
						<th>Software</th>
					</tr>
					<xsl:apply-templates
						select="equipment/computers" />
				</table>

				<h4> Network equipment</h4>

            <xsl:apply-imports select="network.xsl"/>
	

				<h4> Peripherals</h4>
				<table border="1">

					<tr bgcolor="#1D79E7">
						<th>#</th>
						<th>Name</th>
						<th>Type</th>
						<th>Location</th>
					</tr>
					<xsl:apply-templates
						select="equipment" />
			
				</table>
			</body>
		</html>
	</xsl:template>


	<xsl:template match="equipment/computers">

		<xsl:for-each select="computer">
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
					<xsl:value-of select="//hardware" />
					<xsl:apply-templates select="hardware" />
				</td>
				<td>
					<xsl:apply-templates select="software" />
				</td>

			</tr>

		</xsl:for-each>
	</xsl:template>

	<xsl:template match="hardware">
		<br />
		<xsl:value-of select="cpu/@type" />
		<br />
		<xsl:value-of select="cpu/@mhzclock" />
		<br />
		<xsl:value-of select="ram/@amount" />
		<br />
		<xsl:value-of select="ram/@type" />
		<br />
		<xsl:value-of select="storage/@space" />
		<br />
		<xsl:value-of select="drives/*/@type" />
		<br />
		<xsl:value-of select="drives/*/@size" />

	</xsl:template>


	<xsl:template match="software">
		<br />
		<xsl:value-of select="node()/@type" />
		<br />
		<xsl:value-of select="." />
		<br />
	</xsl:template>


	<xsl:template match="equipment">
		<xsl:for-each select="peripherals/*/*">
			<tr>
				<td>
					<xsl:value-of select="position()" />
				</td>
				<td>
				
				<xsl:choose>
				<xsl:when test="@networkname !='' ">
					 <xsl:value-of select="@networkname" />		
				</xsl:when>	
	   
	           <xsl:otherwise> N/A </xsl:otherwise>
                 
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
	</xsl:template>


</xsl:stylesheet>