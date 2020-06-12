<?xml version="1.0" encoding="utf-8"?>
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:ds="http://www.w3.org/2000/09/xmldsig#"
	xmlns="http://ivaservizi.agenziaentrate.gov.it/docs/xsd/fatture/v1.2"
	targetNamespace="http://ivaservizi.agenziaentrate.gov.it/docs/xsd/fatture/v1.2"
	version="1.2">
  <xs:import namespace="http://www.w3.org/2000/09/xmldsig#" schemaLocation="http://www.w3.org/TR/2002/REC-xmldsig-core-20020212/xmldsig-core-schema.xsd" />

  <xs:element name="FatturaElettronica" type="FatturaElettronicaType">
    <xs:annotation>
      <xs:documentation>XML schema fatture destinate a PA e privati in forma ordinaria 1.2</xs:documentation>
    </xs:annotation>
  </xs:element>

  <xs:complexType name="FatturaElettronicaType">
    <xs:sequence>
      <xs:element name="FatturaElettronicaHeader" type="FatturaElettronicaHeaderType"                       />
      <xs:element name="FatturaElettronicaBody"   type="FatturaElettronicaBodyType"   maxOccurs="unbounded" />
      <xs:element ref="ds:Signature"                                                  minOccurs="0"         />
    </xs:sequence>
    <xs:attribute name="versione" type="FormatoTrasmissioneType" use="required" />
  </xs:complexType>
  <xs:complexType name="FatturaElettronicaHeaderType">
    <xs:sequence>
      <xs:element name="DatiTrasmissione"                     type="DatiTrasmissioneType"                                  />
      <xs:element name="CedentePrestatore"                    type="CedentePrestatoreType"                                 />
      <xs:element name="RappresentanteFiscale"                type="RappresentanteFiscaleType"               minOccurs="0" />
      <xs:element name="CessionarioCommittente"               type="CessionarioCommittenteType"                            />
      <xs:element name="TerzoIntermediarioOSoggettoEmittente" type="TerzoIntermediarioSoggettoEmittenteType" minOccurs="0" />
      <xs:element name="SoggettoEmittente"                    type="SoggettoEmittenteType"                   minOccurs="0" />
    </xs:sequence>
  </xs:complexType>
  <xs:complexType name="FatturaElettronicaBodyType">
    <xs:sequence>
      <xs:element name="DatiGenerali"    type="DatiGeneraliType"                                        />
      <xs:element name="DatiBeniServizi" type="DatiBeniServiziType"                                     />
      <xs:element name="DatiVeicoli"     type="DatiVeicoliType"     minOccurs="0"                       />
      <xs:element name="DatiPagamento"   type="DatiPagamentoType"   minOccurs="0" maxOccurs="unbounded" />
      <xs:element name="Allegati"        type="AllegatiType"        minOccurs="0" maxOccurs="unbounded" />
    </xs:sequence>
  </xs:complexType>
  <xs:complexType name="DatiTrasmissioneType">
    <xs:annotation>
      <xs:documentation>Blocco relativo ai dati di trasmissione della Fattura Elettronica</xs:documentation>
    </xs:annotation>
    <xs:sequence>
      <xs:element name="IdTrasmittente"       type="IdFiscaleType"                          />
      <xs:element name="ProgressivoInvio"     type="String10Type"                           />
      <xs:element name="FormatoTrasmissione"  type="FormatoTrasmissioneType"                />
      <xs:element name="CodiceDestinatario"   type="CodiceDestinatarioType"                 />
      <xs:element name="ContattiTrasmittente" type="ContattiTrasmittenteType" minOccurs="0" />
      <xs:element name="PECDestinatario"      type="EmailType"                minOccurs="0" />
	</xs:sequence>
  </xs:complexType>
  <xs:simpleType name="CodiceDestinatarioType">
    <xs:restriction base="xs:string">
      <xs:pattern value="[A-Z0-9]{6,7}" />
    </xs:restriction>
  </xs:simpleType>
  <xs:complexType name="IdFiscaleType">
    <xs:sequence>
      <xs:element name="IdPaese"  type="NazioneType" />
      <xs:element name="IdCodice" type="CodiceType"  />
    </xs:sequence>
  </xs:complexType>
  <xs:simpleType name="CodiceType">
    <xs:restriction base="xs:string">
      <xs:minLength value="1" />
      <xs:maxLength value="28" />
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="FormatoTrasmissioneType">
    <xs:restriction base="xs:string">
      <xs:length value="5" />
	  <xs:enumeration value="FPA12">
	    <xs:annotation>
	      <xs:documentation>Fattura verso PA</xs:documentation>
	    </xs:annotation>
	  </xs:enumeration>
	  <xs:enumeration value="FPR12">
	    <xs:annotation>
	      <xs:documentation>Fattura verso privati</xs:documentation>
	    </xs:annotation>
	  </xs:enumeration>
    </xs:restriction>
  </xs:simpleType>
  <xs:complexType name="ContattiTrasmittenteType">
    <xs:sequence>
      <xs:element name="Telefono" type="TelFaxType" minOccurs="0" />
      <xs:element name="Email"    type="EmailType"  minOccurs="0" />
    </xs:sequence>
  </xs:complexType>
  <xs:complexType name="DatiGeneraliType">
    <xs:annotation>
      <xs:documentation>
				Blocco relativo ai Dati Generali della Fattura Elettronica
			</xs:documentation>
    </xs:annotation>
    <xs:sequence>
      <xs:element name="DatiGeneraliDocumento" type="DatiGeneraliDocumentoType"                                      />
      <xs:element name="DatiOrdineAcquisto"    type="DatiDocumentiCorrelatiType" minOccurs="0" maxOccurs="unbounded" />
      <xs:element name="DatiContratto"         type="DatiDocumentiCorrelatiType" minOccurs="0" maxOccurs="unbounded" />
      <xs:element name="DatiConvenzione"       type="DatiDocumentiCorrelatiType" minOccurs="0" maxOccurs="unbounded" />
      <xs:element name="DatiRicezione"         type="DatiDocumentiCorrelatiType" minOccurs="0" maxOccurs="unbounded" />
      <xs:element name="DatiFattureCollegate"  type="DatiDocumentiCorrelatiType" minOccurs="0" maxOccurs="unbounded" />
      <xs:element name="DatiSAL"               type="DatiSALType"                minOccurs="0" maxOccurs="unbounded" />
      <xs:element name="DatiDDT"               type="DatiDDTType"                minOccurs="0" maxOccurs="unbounded" />
      <xs:element name="DatiTrasporto"         type="DatiTrasportoType"          minOccurs="0"                       />
      <xs:element name="FatturaPrincipale"     type="FatturaPrincipaleType"      minOccurs="0"                       />
    </xs:sequence>
  </xs:complexType>
  <xs:complexType name="DatiGeneraliDocumentoType">
    <xs:sequence>
      <xs:element name="TipoDocumento"          type="TipoDocumentoType"                                              />
      <xs:element name="Divisa"                 type="DivisaType"                                                     />
      <xs:element name="Data"                   type="DataFatturaType"                                                />
      <xs:element name="Numero"                 type="String20Type"                                                   />
      <xs:element name="DatiRitenuta"           type="DatiRitenutaType"           minOccurs="0"                       />
      <xs:element name="DatiBollo"              type="DatiBolloType"              minOccurs="0"                       />
      <xs:element name="DatiCassaPrevidenziale" type="DatiCassaPrevidenzialeType" minOccurs="0" maxOccurs="unbounded" />
      <xs:element name="ScontoMaggiorazione"    type="ScontoMaggiorazioneType"    minOccurs="0" maxOccurs="unbounded" />
      <xs:element name="ImportoTotaleDocumento" type="Amount2DecimalType"         minOccurs="0"                       />
      <xs:element name="Arrotondamento"         type="Amount2DecimalType"         minOccurs="0"                       />
      <xs:element name="Causale"                type="String200LatinType"         minOccurs="0" maxOccurs="unbounded" />
      <xs:element name="Art73"                  type="Art73Type"                  minOccurs="0"                       />
    </xs:sequence>
  </xs:complexType>
  <xs:complexType name="DatiRitenutaType">
    <xs:sequence>
      <xs:element name="TipoRitenuta"     type="TipoRitenutaType"     />
      <xs:element name="ImportoRitenuta"  type="Amount2DecimalType"   />
      <xs:element name="AliquotaRitenuta" type="RateType"             />
      <xs:element name="CausalePagamento" type="CausalePagamentoType" />
    </xs:sequence>
  </xs:complexType>
  <xs:complexType name="DatiBolloType">
    <xs:sequence>
      <xs:element name="BolloVirtuale" type="BolloVirtualeType"  />
      <xs:element name="ImportoBollo"  type="Amount2DecimalType" />
    </xs:sequence>
  </xs:complexType>
  <xs:complexType name="DatiCassaPrevidenzialeType">
    <xs:sequence>
      <xs:element name="TipoCassa"                  type="TipoCassaType"                    />
      <xs:element name="AlCassa"                    type="RateType"                         />
      <xs:element name="ImportoContributoCassa"     type="Amount2DecimalType"               />
      <xs:element name="ImponibileCassa"            type="Amount2DecimalType" minOccurs="0" />
      <xs:element name="AliquotaIVA"                type="RateType"                         />
      <xs:element name="Ritenuta"                   type="RitenutaType"       minOccurs="0" />
      <xs:element name="Natura"                     type="NaturaType"         minOccurs="0" />
      <xs:element name="RiferimentoAmministrazione" type="String20Type"       minOccurs="0" />
    </xs:sequence>
  </xs:complexType>
  <xs:complexType name="ScontoMaggiorazioneType">
    <xs:sequence>
      <xs:element name="Tipo"        type="TipoScontoMaggiorazioneType"               />
      <xs:element name="Percentuale" type="RateType"                    minOccurs="0" />
      <xs:element name="Importo"     type="Amount2DecimalType"          minOccurs="0" />
    </xs:sequence>
  </xs:complexType>
  <xs:simpleType name="CausalePagamentoType">
    <xs:restriction base="xs:string">
      <xs:enumeration value="A" />
      <xs:enumeration value="B" />
      <xs:enumeration value="C" />
      <xs:enumeration value="D" />
      <xs:enumeration value="E" />
      <xs:enumeration value="G" />
      <xs:enumeration value="H" />
      <xs:enumeration value="I" />
      <xs:enumeration value="L" />
      <xs:enumeration value="M" />
      <xs:enumeration value="N" />
      <xs:enumeration value="O" />
      <xs:enumeration value="P" />
      <xs:enumeration value="Q" />
      <xs:enumeration value="R" />
      <xs:enumeration value="S" />
      <xs:enumeration value="T" />
      <xs:enumeration value="U" />
      <xs:enumeration value="V" />
      <xs:enumeration value="W" />
      <xs:enumeration value="X" />
      <xs:enumeration value="Y" />
      <xs:enumeration value="Z" />
	  <xs:enumeration value="L1" />
	  <xs:enumeration value="M1" />
	  <xs:enumeration value="O1" />
	  <xs:enumeration value="V1" />
      <!--I CODICI SEGUENTI FANNO RIFERIMENTO A QUELLI PREVISTI NEL MOD. 770S-->
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="TipoScontoMaggiorazioneType">
    <xs:restriction base="xs:string">
      <xs:length value="2" />
      <xs:enumeration value="SC">
        <xs:annotation>
          <xs:documentation>
						SC = Sconto
					</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="MG">
        <xs:annotation>
          <xs:documentation>
						MG = Maggiorazione
					</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="Art73Type">
    <xs:restriction base="xs:string">
      <xs:length value="2" />
      <xs:enumeration value="SI">
        <xs:annotation>
          <xs:documentation>
						SI = Documento emesso secondo modalità e termini stabiliti con DM ai sensi dell'art. 73 DPR 633/72
					</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="TipoCassaType">
    <xs:restriction base="xs:string">
      <xs:length value="4" />
      <xs:enumeration value="TC01">
        <xs:annotation>
          <xs:documentation>
						Cassa nazionale previdenza e assistenza avvocati e procuratori legali
					</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="TC02">
        <xs:annotation>
          <xs:documentation>
						Cassa previdenza dottori commercialisti
					</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="TC03">
        <xs:annotation>
          <xs:documentation>
						Cassa previdenza e assistenza geometri
					</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="TC04">
        <xs:annotation>
          <xs:documentation>
						Cassa nazionale previdenza e assistenza ingegneri e architetti liberi professionisti
					</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="TC05">
        <xs:annotation>
          <xs:documentation>
						Cassa nazionale del notariato
					</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="TC06">
        <xs:annotation>
          <xs:documentation>
						Cassa nazionale previdenza e assistenza ragionieri e periti commerciali
					</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="TC07">
        <xs:annotation>
          <xs:documentation>
						Ente nazionale assistenza agenti e rappresentanti di commercio (ENASARCO)
					</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="TC08">
        <xs:annotation>
          <xs:documentation>
						Ente nazionale previdenza e assistenza consulenti del lavoro (ENPACL)
					</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="TC09">
        <xs:annotation>
          <xs:documentation>
						Ente nazionale previdenza e assistenza medici (ENPAM)
					</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="TC10">
        <xs:annotation>
          <xs:documentation>
						Ente nazionale previdenza e assistenza farmacisti (ENPAF)
					</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="TC11">
        <xs:annotation>
          <xs:documentation>
						Ente nazionale previdenza e assistenza veterinari (ENPAV)
					</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="TC12">
        <xs:annotation>
          <xs:documentation>
						Ente nazionale previdenza e assistenza impiegati dell'agricoltura (ENPAIA)
					</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="TC13">
        <xs:annotation>
          <xs:documentation>
						Fondo previdenza impiegati imprese di spedizione e agenzie marittime
					</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="TC14">
        <xs:annotation>
          <xs:documentation>
						Istituto nazionale previdenza giornalisti italiani (INPGI)
					</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="TC15">
        <xs:annotation>
          <xs:documentation>
						Opera nazionale assistenza orfani sanitari italiani (ONAOSI)
					</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="TC16">
        <xs:annotation>
          <xs:documentation>
						Cassa autonoma assistenza integrativa giornalisti italiani (CASAGIT)
					</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="TC17">
        <xs:annotation>
          <xs:documentation>
						Ente previdenza periti industriali e periti industriali laureati (EPPI)
					</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="TC18">
        <xs:annotation>
          <xs:documentation>
						Ente previdenza e assistenza pluricategoriale (EPAP)
					</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="TC19">
        <xs:annotation>
          <xs:documentation>
						Ente nazionale previdenza e assistenza biologi (ENPAB)
					</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="TC20">
        <xs:annotation>
          <xs:documentation>
						Ente nazionale previdenza e assistenza professione infermieristica (ENPAPI)
					</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="TC21">
        <xs:annotation>
          <xs:documentation>
						Ente nazionale previdenza e assistenza psicologi (ENPAP)
					</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="TC22">
        <xs:annotation>
          <xs:documentation>
						INPS
					</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="TipoDocumentoType">
    <xs:restriction base="xs:string">
      <xs:length value="4" />
      <xs:enumeration value="TD01">
        <xs:annotation>
          <xs:documentation>Fattura</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="TD02">
        <xs:annotation>
          <xs:documentation>Acconto / anticipo su fattura</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="TD03">
        <xs:annotation>
          <xs:documentation>Acconto / anticipo su parcella</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="TD04">
        <xs:annotation>
          <xs:documentation>Nota di credito</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="TD05">
        <xs:annotation>
          <xs:documentation>Nota di debito</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="TD06">
        <xs:annotation>
          <xs:documentation>Parcella</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
	  <xs:enumeration value="TD20">
        <xs:annotation>
          <xs:documentation>Autofattura</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="TipoRitenutaType">
    <xs:restriction base="xs:string">
      <xs:length value="4" />
      <xs:enumeration value="RT01">
        <xs:annotation>
          <xs:documentation>Ritenuta di acconto persone fisiche</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="RT02">
        <xs:annotation>
          <xs:documentation>Ritenuta di acconto persone giuridiche</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
    </xs:restriction>
  </xs:simpleType>
  <xs:complexType name="DatiSALType">
    <xs:sequence>
      <xs:element name="RiferimentoFase" type="RiferimentoFaseType" />
    </xs:sequence>
  </xs:complexType>
  <xs:complexType name="DatiDocumentiCorrelatiType">
    <xs:sequence>
      <xs:element name="RiferimentoNumeroLinea"    type="RiferimentoNumeroLineaType" minOccurs="0" maxOccurs="unbounded" />
      <xs:element name="IdDocumento"               type="String20Type"                                                   />
      <xs:element name="Data"                      type="xs:date"                    minOccurs="0"                       />
      <xs:element name="NumItem"                   type="String20Type"               minOccurs="0"                       />
      <xs:element name="CodiceCommessaConvenzione" type="String100LatinType"         minOccurs="0"                       />
      <xs:element name="CodiceCUP"                 type="String15Type"               minOccurs="0"                       />
      <xs:element name="CodiceCIG"                 type="String15Type"               minOccurs="0"                       />
    </xs:sequence>
  </xs:complexType>
  <xs:simpleType name="RiferimentoNumeroLineaType">
    <xs:restriction base="xs:integer">
      <xs:minInclusive value="1" />
      <xs:maxInclusive value="9999" />
    </xs:restriction>
  </xs:simpleType>
  <xs:complexType name="DatiDDTType">
    <xs:sequence>
      <xs:element name="NumeroDDT"              type="String20Type"                                                   />
      <xs:element name="DataDDT"                type="xs:date"                                                        />
      <xs:element name="RiferimentoNumeroLinea" type="RiferimentoNumeroLineaType" minOccurs="0" maxOccurs="unbounded" />
    </xs:sequence>
  </xs:complexType>
  <xs:complexType name="DatiTrasportoType">
    <xs:sequence>
      <xs:element name="DatiAnagraficiVettore" type="DatiAnagraficiVettoreType" minOccurs="0" />
      <xs:element name="MezzoTrasporto"        type="String80LatinType"         minOccurs="0" />
      <xs:element name="CausaleTrasporto"      type="String100LatinType"        minOccurs="0" />
      <xs:element name="NumeroColli"           type="NumeroColliType"           minOccurs="0" />
      <xs:element name="Descrizione"           type="String100LatinType"        minOccurs="0" />
      <xs:element name="UnitaMisuraPeso"       type="String10Type"              minOccurs="0" />
      <xs:element name="PesoLordo"             type="PesoType"                  minOccurs="0" />
      <xs:element name="PesoNetto"             type="PesoType"                  minOccurs="0" />
      <xs:element name="DataOraRitiro"         type="xs:dateTime"               minOccurs="0" />
      <xs:element name="DataInizioTrasporto"   type="xs:date"                   minOccurs="0" />
      <xs:element name="TipoResa"              type="TipoResaType"              minOccurs="0" />
      <xs:element name="IndirizzoResa"         type="IndirizzoType"             minOccurs="0" />
      <xs:element name="DataOraConsegna"       type="xs:dateTime"               minOccurs="0" />
    </xs:sequence>
  </xs:complexType>
  <xs:complexType name="IndirizzoType">
    <xs:sequence>
      <xs:element name="Indirizzo"    type="String60LatinType"                            />
      <xs:element name="NumeroCivico" type="NumeroCivicoType"  minOccurs="0"              />
      <xs:element name="CAP"          type="CAPType"                                      />
      <xs:element name="Comune"       type="String60LatinType"                            />
      <xs:element name="Provincia"    type="ProvinciaType"     minOccurs="0"              />
      <xs:element name="Nazione"      type="NazioneType"                     default="IT" />
    </xs:sequence>
  </xs:complexType>
  <xs:complexType name="FatturaPrincipaleType">
    <xs:sequence>
      <xs:element name="NumeroFatturaPrincipale" type="String20Type" />
      <xs:element name="DataFatturaPrincipale"   type="xs:date"      />
    </xs:sequence>
  </xs:complexType>
  <xs:simpleType name="SoggettoEmittenteType">
    <xs:restriction base="xs:string">
      <xs:length value="2" />
      <xs:enumeration value="CC">
        <xs:annotation>
          <xs:documentation>Cessionario / Committente</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="TZ">
        <xs:annotation>
          <xs:documentation>Terzo</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
    </xs:restriction>
  </xs:simpleType>
  <xs:complexType name="CedentePrestatoreType">
    <xs:annotation>
      <xs:documentation>
				Blocco relativo ai dati del Cedente / Prestatore
			</xs:documentation>
    </xs:annotation>
    <xs:sequence>
      <xs:element name="DatiAnagrafici"             type="DatiAnagraficiCedenteType"               />
      <xs:element name="Sede"                       type="IndirizzoType"                           />
      <xs:element name="StabileOrganizzazione"      type="IndirizzoType"             minOccurs="0" />
      <xs:element name="IscrizioneREA"              type="IscrizioneREAType"         minOccurs="0" />
      <xs:element name="Contatti"                   type="ContattiType"              minOccurs="0" />
      <xs:element name="RiferimentoAmministrazione" type="String20Type"              minOccurs="0" />
    </xs:sequence>
  </xs:complexType>
  <xs:complexType name="DatiAnagraficiCedenteType">
    <xs:sequence>
      <xs:element name="IdFiscaleIVA"         type="IdFiscaleType"                   />
      <xs:element name="CodiceFiscale"        type="CodiceFiscaleType" minOccurs="0" />
      <xs:element name="Anagrafica"           type="AnagraficaType"                  />
      <xs:element name="AlboProfessionale"    type="String60LatinType" minOccurs="0" />
      <xs:element name="ProvinciaAlbo"        type="ProvinciaType"     minOccurs="0" />
      <xs:element name="NumeroIscrizioneAlbo" type="String60Type"      minOccurs="0" />
      <xs:element name="DataIscrizioneAlbo"   type="xs:date"           minOccurs="0" />
      <xs:element name="RegimeFiscale"        type="RegimeFiscaleType"               />
    </xs:sequence>
  </xs:complexType>
  <xs:simpleType name="RegimeFiscaleType">
    <xs:restriction base="xs:string">
      <xs:length value="4" />
      <xs:enumeration value="RF01">
        <xs:annotation>
          <xs:documentation> Regime ordinario</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="RF02">
        <xs:annotation>
          <xs:documentation>Regime dei contribuenti minimi (art. 1,c.96-117, L. 244/2007)</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="RF04">
        <xs:annotation>
          <xs:documentation>Agricoltura e attività connesse e pesca (artt. 34 e 34-bis, D.P.R. 633/1972)</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="RF05">
        <xs:annotation>
          <xs:documentation>Vendita sali e tabacchi (art. 74, c.1, D.P.R. 633/1972)</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="RF06">
        <xs:annotation>
          <xs:documentation>Commercio dei fiammiferi (art. 74, c.1, D.P.R. 633/1972)</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="RF07">
        <xs:annotation>
          <xs:documentation>Editoria (art. 74, c.1, D.P.R. 633/1972)</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="RF08">
        <xs:annotation>
          <xs:documentation>Gestione di servizi di telefonia pubblica (art. 74, c.1, D.P.R. 633/1972)</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="RF09">
        <xs:annotation>
          <xs:documentation>Rivendita di documenti di trasporto pubblico e di sosta (art. 74, c.1, D.P.R. 633/1972)</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="RF10">
        <xs:annotation>
          <xs:documentation>Intrattenimenti, giochi e altre attività	di cui alla tariffa allegata al D.P.R. 640/72 (art. 74, c.6, D.P.R. 633/1972)
					</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="RF11">
        <xs:annotation>
          <xs:documentation>Agenzie di viaggi e turismo (art. 74-ter, D.P.R. 633/1972)</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="RF12">
        <xs:annotation>
          <xs:documentation>Agriturismo (art. 5, c.2, L. 413/1991)</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="RF13">
        <xs:annotation>
          <xs:documentation>Vendite a domicilio (art. 25-bis, c.6, D.P.R. 600/1973)</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="RF14">
        <xs:annotation>
          <xs:documentation>Rivendita di beni usati, di oggetti	d’arte, d’antiquariato o da collezione (art.	36, D.L. 41/1995)</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="RF15">
        <xs:annotation>
          <xs:documentation>Agenzie di vendite all’asta di oggetti d’arte, antiquariato o da collezione (art. 40-bis, D.L. 41/1995)</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="RF16">
        <xs:annotation>
          <xs:documentation>IVA per cassa P.A. (art. 6, c.5, D.P.R. 633/1972)</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="RF17">
        <xs:annotation>
          <xs:documentation>IVA per cassa (art. 32-bis, D.L. 83/2012)</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
	  <xs:enumeration value="RF19">
        <xs:annotation>
          <xs:documentation>Regime forfettario</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="RF18">
        <xs:annotation>
          <xs:documentation>Altro</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
    </xs:restriction>
  </xs:simpleType>
  <xs:complexType name="AnagraficaType">
    <xs:annotation>
      <xs:documentation>
				Il campo Denominazione è in alternativa ai campi Nome e Cognome
			</xs:documentation>
    </xs:annotation>
    <xs:sequence>
      <xs:choice>
        <xs:sequence>
          <xs:element name="Denominazione" type="String80LatinType"/>
        </xs:sequence>
        <xs:sequence>
          <xs:element name="Nome"          type="String60LatinType"/>
          <xs:element name="Cognome"       type="String60LatinType"/>
        </xs:sequence>
      </xs:choice>
      <xs:element name="Titolo"  type="TitoloType"  minOccurs="0" />
      <xs:element name="CodEORI" type="CodEORIType" minOccurs="0" />
    </xs:sequence>
  </xs:complexType>
  <xs:complexType name="DatiAnagraficiVettoreType">
    <xs:sequence>
      <xs:element name="IdFiscaleIVA"       type="IdFiscaleType"                   />
      <xs:element name="CodiceFiscale"      type="CodiceFiscaleType" minOccurs="0" />
      <xs:element name="Anagrafica"         type="AnagraficaType"                  />
      <xs:element name="NumeroLicenzaGuida" type="String20Type"      minOccurs="0" />
    </xs:sequence>
  </xs:complexType>
  <xs:complexType name="IscrizioneREAType">
    <xs:sequence>
      <xs:element name="Ufficio"           type="ProvinciaType"                      />
      <xs:element name="NumeroREA"         type="String20Type"                       />
      <xs:element name="CapitaleSociale"   type="Amount2DecimalType"   minOccurs="0" />
      <xs:element name="SocioUnico"        type="SocioUnicoType"       minOccurs="0" />
      <xs:element name="StatoLiquidazione" type="StatoLiquidazioneType"              />
    </xs:sequence>
  </xs:complexType>
  <xs:complexType name="ContattiType">
    <xs:sequence>
      <xs:element name="Telefono" type="TelFaxType" minOccurs="0" />
      <xs:element name="Fax"      type="TelFaxType" minOccurs="0" />
      <xs:element name="Email"    type="EmailType"  minOccurs="0" />
    </xs:sequence>
  </xs:complexType>
  <xs:complexType name="RappresentanteFiscaleType">
    <xs:annotation>
      	<xs:documentation>
			Blocco relativo ai dati del Rappresentante Fiscale
		</xs:documentation>
    </xs:annotation>
    <xs:sequence>
      <xs:element name="DatiAnagrafici" type="DatiAnagraficiRappresentanteType" />
    </xs:sequence>
  </xs:complexType>
  <xs:complexType name="DatiAnagraficiRappresentanteType">
    <xs:sequence>
      <xs:element name="IdFiscaleIVA"  type="IdFiscaleType"                   />
      <xs:element name="CodiceFiscale" type="CodiceFiscaleType" minOccurs="0" />
      <xs:element name="Anagrafica"    type="AnagraficaType"                  />
    </xs:sequence>
  </xs:complexType>
  <xs:complexType name="CessionarioCommittenteType">
    <xs:annotation>
      <xs:documentation>Blocco relativo ai dati del Cessionario / Committente</xs:documentation>
    </xs:annotation>
    <xs:sequence>
      <xs:element name="DatiAnagrafici"        type="DatiAnagraficiCessionarioType"                      />
      <xs:element name="Sede"                  type="IndirizzoType"                                      />
	  <xs:element name="StabileOrganizzazione" type="IndirizzoType"                        minOccurs="0" />
      <xs:element name="RappresentanteFiscale" type="RappresentanteFiscaleCessionarioType" minOccurs="0" />
    </xs:sequence>
  </xs:complexType>
  <xs:complexType name="RappresentanteFiscaleCessionarioType">
    <xs:sequence>
	  <xs:element name="IdFiscaleIVA"      type="IdFiscaleType" />
	  <xs:choice>
        <xs:sequence>
          <xs:element name="Denominazione" type="String80LatinType"/>
        </xs:sequence>
        <xs:sequence>
          <xs:element name="Nome"          type="String60LatinType" />
          <xs:element name="Cognome"       type="String60LatinType" />
        </xs:sequence>
      </xs:choice>
    </xs:sequence>
  </xs:complexType>
  <xs:complexType name="DatiAnagraficiCessionarioType">
    <xs:sequence>
      <xs:element name="IdFiscaleIVA"  type="IdFiscaleType"     minOccurs="0" />
      <xs:element name="CodiceFiscale" type="CodiceFiscaleType" minOccurs="0" />
      <xs:element name="Anagrafica"    type="AnagraficaType"                  />
    </xs:sequence>
  </xs:complexType>
  <xs:complexType name="DatiBeniServiziType">
    <xs:annotation>
      <xs:documentation>
				Blocco relativo ai dati di Beni Servizi della Fattura	Elettronica
			</xs:documentation>
    </xs:annotation>
    <xs:sequence>
      <xs:element name="DettaglioLinee" type="DettaglioLineeType" maxOccurs="unbounded" />
      <xs:element name="DatiRiepilogo"  type="DatiRiepilogoType"  maxOccurs="unbounded" />
    </xs:sequence>
  </xs:complexType>
  <xs:complexType name="DatiVeicoliType">
    <xs:annotation>
      <xs:documentation>
				Blocco relativo ai dati dei Veicoli della Fattura
				Elettronica (da indicare nei casi di cessioni tra Paesi
				membri di mezzi di trasporto nuovi, in base all'art. 38,
				comma 4 del dl 331 del 1993)
			</xs:documentation>
    </xs:annotation>
    <xs:sequence>
      <xs:element name="Data"           type="xs:date"      />
      <xs:element name="TotalePercorso" type="String15Type" />
    </xs:sequence>
  </xs:complexType>
  <xs:complexType name="DatiPagamentoType">
    <xs:annotation>
      <xs:documentation>
				Blocco relativo ai dati di Pagamento della Fattura	Elettronica
			</xs:documentation>
    </xs:annotation>
    <xs:sequence>
      <xs:element name="CondizioniPagamento" type="CondizioniPagamentoType"                       />
      <xs:element name="DettaglioPagamento"  type="DettaglioPagamentoType"  maxOccurs="unbounded" />
    </xs:sequence>
  </xs:complexType>
  <xs:simpleType name="CondizioniPagamentoType">
    <xs:restriction base="xs:string">
      <xs:minLength value="4" />
      <xs:maxLength value="4" />
      <xs:enumeration value="TP01">
        <xs:annotation>
          <xs:documentation>pagamento a rate</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="TP02">
        <xs:annotation>
          <xs:documentation>pagamento completo</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="TP03">
        <xs:annotation>
          <xs:documentation>anticipo</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
    </xs:restriction>
  </xs:simpleType>
  <xs:complexType name="DettaglioPagamentoType">
    <xs:sequence>
      <xs:element name="Beneficiario"                    type="String200LatinType"         minOccurs="0" />
      <xs:element name="ModalitaPagamento"               type="ModalitaPagamentoType"                    />
      <xs:element name="DataRiferimentoTerminiPagamento" type="xs:date"                    minOccurs="0" />
      <xs:element name="GiorniTerminiPagamento"          type="GiorniTerminePagamentoType" minOccurs="0" />
      <xs:element name="DataScadenzaPagamento"           type="xs:date"                    minOccurs="0" />
      <xs:element name="ImportoPagamento"                type="Amount2DecimalType"                       />
      <xs:element name="CodUfficioPostale"               type="String20Type"               minOccurs="0" />
      <xs:element name="CognomeQuietanzante"             type="String60LatinType"          minOccurs="0" />
      <xs:element name="NomeQuietanzante"                type="String60LatinType"          minOccurs="0" />
      <xs:element name="CFQuietanzante"                  type="CodiceFiscalePFType"        minOccurs="0" />
      <xs:element name="TitoloQuietanzante"              type="TitoloType"                 minOccurs="0" />
      <xs:element name="IstitutoFinanziario"             type="String80LatinType"          minOccurs="0" />
      <xs:element name="IBAN"                            type="IBANType"                   minOccurs="0" />
      <xs:element name="ABI"                             type="ABIType"                    minOccurs="0" />
      <xs:element name="CAB"                             type="CABType"                    minOccurs="0" />
      <xs:element name="BIC"                             type="BICType"                    minOccurs="0" />
      <xs:element name="ScontoPagamentoAnticipato"       type="Amount2DecimalType"         minOccurs="0" />
      <xs:element name="DataLimitePagamentoAnticipato"   type="xs:date"                    minOccurs="0" />
      <xs:element name="PenalitaPagamentiRitardati"      type="Amount2DecimalType"         minOccurs="0" />
      <xs:element name="DataDecorrenzaPenale"            type="xs:date"                    minOccurs="0" />
      <xs:element name="CodicePagamento"                 type="String60Type"               minOccurs="0" />
    </xs:sequence>
  </xs:complexType>
  <xs:simpleType name="ModalitaPagamentoType">
    <xs:restriction base="xs:string">
      <xs:length value="4" />
      <xs:enumeration value="MP01">
        <xs:annotation>
          <xs:documentation>contanti</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="MP02">
        <xs:annotation>
          <xs:documentation>assegno</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="MP03">
        <xs:annotation>
          <xs:documentation>assegno circolare</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="MP04">
        <xs:annotation>
          <xs:documentation>contanti presso Tesoreria</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="MP05">
        <xs:annotation>
          <xs:documentation>bonifico</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="MP06">
        <xs:annotation>
          <xs:documentation>vaglia cambiario</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="MP07">
        <xs:annotation>
          <xs:documentation>bollettino bancario</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="MP08">
        <xs:annotation>
          <xs:documentation>carta di pagamento</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="MP09">
        <xs:annotation>
          <xs:documentation>RID</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="MP10">
        <xs:annotation>
          <xs:documentation>RID utenze</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="MP11">
        <xs:annotation>
          <xs:documentation>RID veloce</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="MP12">
        <xs:annotation>
          <xs:documentation>RIBA</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="MP13">
        <xs:annotation>
          <xs:documentation>MAV</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="MP14">
        <xs:annotation>
          <xs:documentation>quietanza erario</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="MP15">
        <xs:annotation>
          <xs:documentation>giroconto su conti di contabilità speciale</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="MP16">
        <xs:annotation>
          <xs:documentation>domiciliazione bancaria</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="MP17">
        <xs:annotation>
          <xs:documentation>domiciliazione postale</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="MP18">
        <xs:annotation>
          <xs:documentation>bollettino di c/c postale</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="MP19">
        <xs:annotation>
          <xs:documentation>SEPA Direct Debit</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="MP20">
        <xs:annotation>
          <xs:documentation>SEPA Direct Debit CORE</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="MP21">
        <xs:annotation>
          <xs:documentation>SEPA Direct Debit B2B</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="MP22">
        <xs:annotation>
          <xs:documentation>Trattenuta su somme già riscosse</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="IBANType">
    <xs:restriction base="xs:string">
      <xs:pattern value="[a-zA-Z]{2}[0-9]{2}[a-zA-Z0-9]{11,30}" />
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="BICType">
    <xs:restriction base="xs:string">
      <xs:pattern value="[A-Z]{6}[A-Z2-9][A-NP-Z0-9]([A-Z0-9]{3}){0,1}" />
    </xs:restriction>
  </xs:simpleType>
  <xs:complexType name="TerzoIntermediarioSoggettoEmittenteType">
    <xs:annotation>
      <xs:documentation>
				Blocco relativo ai dati del Terzo Intermediario che
				emette fattura elettronica per conto del
				Cedente/Prestatore
			</xs:documentation>
    </xs:annotation>
    <xs:sequence>
      <xs:element name="DatiAnagrafici" type="DatiAnagraficiTerzoIntermediarioType" />
    </xs:sequence>
  </xs:complexType>
  <xs:complexType name="DatiAnagraficiTerzoIntermediarioType">
    <xs:sequence>
      <xs:element name="IdFiscaleIVA"  type="IdFiscaleType"     minOccurs="0" />
      <xs:element name="CodiceFiscale" type="CodiceFiscaleType" minOccurs="0" />
      <xs:element name="Anagrafica"    type="AnagraficaType"                  />
    </xs:sequence>
  </xs:complexType>
  <xs:complexType name="AllegatiType">
    <xs:annotation>
      <xs:documentation>
				Blocco relativo ai dati di eventuali allegati
			</xs:documentation>
    </xs:annotation>
    <xs:sequence>
      <xs:element name="NomeAttachment"        type="String60LatinType"                />
      <xs:element name="AlgoritmoCompressione" type="String10Type"       minOccurs="0" />
      <xs:element name="FormatoAttachment"     type="String10Type"       minOccurs="0" />
      <xs:element name="DescrizioneAttachment" type="String100LatinType" minOccurs="0" />
      <xs:element name="Attachment"            type="xs:base64Binary"                  />
    </xs:sequence>
  </xs:complexType>
  <xs:complexType name="DettaglioLineeType">
    <xs:sequence>
      <xs:element name="NumeroLinea"                type="NumeroLineaType"                                                 />
      <xs:element name="TipoCessionePrestazione"    type="TipoCessionePrestazioneType" minOccurs="0"                       />
      <xs:element name="CodiceArticolo"             type="CodiceArticoloType"          minOccurs="0" maxOccurs="unbounded" />
      <xs:element name="Descrizione"                type="String1000LatinType"                                             />
      <xs:element name="Quantita"                   type="QuantitaType"                minOccurs="0"                       />
      <xs:element name="UnitaMisura"                type="String10Type"                minOccurs="0"                       />
      <xs:element name="DataInizioPeriodo"          type="xs:date"                     minOccurs="0"                       />
      <xs:element name="DataFinePeriodo"            type="xs:date"                     minOccurs="0"                       />
      <xs:element name="PrezzoUnitario"             type="Amount8DecimalType"                                              />
      <xs:element name="ScontoMaggiorazione"        type="ScontoMaggiorazioneType"     minOccurs="0" maxOccurs="unbounded" />
      <xs:element name="PrezzoTotale"               type="Amount8DecimalType"                                              />
      <xs:element name="AliquotaIVA"                type="RateType"                                                        />
      <xs:element name="Ritenuta"                   type="RitenutaType"                minOccurs="0"                       />
      <xs:element name="Natura"                     type="NaturaType"                  minOccurs="0"                       />
      <xs:element name="RiferimentoAmministrazione" type="String20Type"                minOccurs="0"                       />
      <xs:element name="AltriDatiGestionali"        type="AltriDatiGestionaliType"     minOccurs="0" maxOccurs="unbounded" />
    </xs:sequence>
  </xs:complexType>
  <xs:complexType name="CodiceArticoloType">
    <xs:sequence>
      <xs:element name="CodiceTipo"   type="String35Type" />
      <xs:element name="CodiceValore" type="String35Type" />
    </xs:sequence>
  </xs:complexType>
  <xs:complexType name="AltriDatiGestionaliType">
    <xs:sequence>
      <xs:element name="TipoDato"          type="String10Type"                     />
      <xs:element name="RiferimentoTesto"  type="String60LatinType"  minOccurs="0" />
      <xs:element name="RiferimentoNumero" type="Amount8DecimalType" minOccurs="0" />
      <xs:element name="RiferimentoData"   type="xs:date"            minOccurs="0" />
    </xs:sequence>
  </xs:complexType>
  <xs:simpleType name="RitenutaType">
    <xs:restriction base="xs:string">
      <xs:length value="2" />
      <xs:enumeration value="SI">
        <xs:annotation>
          <xs:documentation>
						SI = Cessione / Prestazione soggetta a ritenuta
					</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
    </xs:restriction>
  </xs:simpleType>
  <xs:complexType name="DatiRiepilogoType">
    <xs:sequence>
      <xs:element name="AliquotaIVA"          type="RateType"                         />
      <xs:element name="Natura"               type="NaturaType"         minOccurs="0" />
      <xs:element name="SpeseAccessorie"      type="Amount2DecimalType" minOccurs="0" />
      <xs:element name="Arrotondamento"       type="Amount8DecimalType" minOccurs="0" />
      <xs:element name="ImponibileImporto"    type="Amount2DecimalType"               />
      <xs:element name="Imposta"              type="Amount2DecimalType"               />
      <xs:element name="EsigibilitaIVA"       type="EsigibilitaIVAType" minOccurs="0" />
      <xs:element name="RiferimentoNormativo" type="String100LatinType" minOccurs="0" />
    </xs:sequence>
  </xs:complexType>
  <xs:simpleType name="EsigibilitaIVAType">
    <xs:restriction base="xs:string">
      <xs:minLength value="1" />
      <xs:maxLength value="1" />
      <xs:enumeration value="D">
        <xs:annotation>
          <xs:documentation>esigibilità differita</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="I">
        <xs:annotation>
          <xs:documentation>esigibilità immediata</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="S">
        <xs:annotation>
          <xs:documentation>scissione dei pagamenti</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="NaturaType">
    <xs:restriction base="xs:string">
      <xs:enumeration value="N1">
        <xs:annotation>
          <xs:documentation>Escluse ex. art. 15</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="N2">
        <xs:annotation>
          <xs:documentation>Non soggette</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="N3">
        <xs:annotation>
          <xs:documentation>Non Imponibili</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="N4">
        <xs:annotation>
          <xs:documentation>Esenti</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="N5">
        <xs:annotation>
          <xs:documentation>Regime del margine</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="N6">
        <xs:annotation>
          <xs:documentation>Inversione contabile (reverse charge)</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="N7">
        <xs:annotation>
          <xs:documentation>IVA assolta in altro stato UE (vendite a distanza ex art. 40 commi 3 e 4 e art. 41 comma 1 lett. b, DL 331/93; prestazione di servizi di telecomunicazioni, tele-radiodiffusione ed elettronici ex art. 7-sexies lett. f, g, DPR 633/72 e art. 74-sexies, DPR 633/72)</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="CodiceFiscaleType">
    <xs:restriction base="xs:string">
      <xs:pattern value="[A-Z0-9]{11,16}" />
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="CodiceFiscalePFType">
    <xs:restriction base="xs:string">
      <xs:pattern value="[A-Z0-9]{16}" />
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="CodEORIType">
    <xs:restriction base="xs:string">
      <xs:minLength value="13" />
      <xs:maxLength value="17" />
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="SocioUnicoType">
    <xs:restriction base="xs:string">
      <xs:enumeration value="SU">
        <xs:annotation>
          <xs:documentation>socio unico</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="SM">
        <xs:annotation>
          <xs:documentation>più soci</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="StatoLiquidazioneType">
    <xs:restriction base="xs:string">
      <xs:enumeration value="LS">
        <xs:annotation>
          <xs:documentation>in liquidazione</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="LN">
        <xs:annotation>
          <xs:documentation>non in liquidazione</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="TipoCessionePrestazioneType">
    <xs:restriction base="xs:string">
      <xs:length value="2" />
      <xs:enumeration value="SC">
        <xs:annotation>
          <xs:documentation>Sconto</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="PR">
        <xs:annotation>
          <xs:documentation>Premio</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="AB">
        <xs:annotation>
          <xs:documentation>Abbuono</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="AC">
        <xs:annotation>
          <xs:documentation>Spesa accessoria</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="TitoloType">
    <xs:restriction base="xs:normalizedString">
      <xs:whiteSpace value="collapse" />
      <xs:pattern value="(\p{IsBasicLatin}{2,10})" />
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="String10Type">
    <xs:restriction base="xs:normalizedString">
      <xs:pattern value="(\p{IsBasicLatin}{1,10})" />
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="String15Type">
    <xs:restriction base="xs:normalizedString">
      <xs:pattern value="(\p{IsBasicLatin}{1,15})" />
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="String20Type">
    <xs:restriction base="xs:normalizedString">
      <xs:pattern value="(\p{IsBasicLatin}{1,20})" />
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="String35Type">
    <xs:restriction base="xs:normalizedString">
      <xs:pattern value="(\p{IsBasicLatin}{1,35})" />
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="String60Type">
    <xs:restriction base="xs:normalizedString">
      <xs:pattern value="(\p{IsBasicLatin}{1,60})" />
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="String80Type">
    <xs:restriction base="xs:normalizedString">
      <xs:pattern value="(\p{IsBasicLatin}{1,80})" />
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="String100Type">
    <xs:restriction base="xs:normalizedString">
      <xs:pattern value="(\p{IsBasicLatin}{1,100})" />
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="String60LatinType">
    <xs:restriction base="xs:normalizedString">
      <xs:pattern value="[\p{IsBasicLatin}\p{IsLatin-1Supplement}]{1,60}" />
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="String80LatinType">
    <xs:restriction base="xs:normalizedString">
      <xs:pattern value="[\p{IsBasicLatin}\p{IsLatin-1Supplement}]{1,80}" />
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="String100LatinType">
    <xs:restriction base="xs:normalizedString">
      <xs:pattern value="[\p{IsBasicLatin}\p{IsLatin-1Supplement}]{1,100}" />
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="String200LatinType">
    <xs:restriction base="xs:normalizedString">
      <xs:pattern value="[\p{IsBasicLatin}\p{IsLatin-1Supplement}]{1,200}" />
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="String1000LatinType">
    <xs:restriction base="xs:normalizedString">
      <xs:pattern value="[\p{IsBasicLatin}\p{IsLatin-1Supplement}]{1,1000}" />
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="ProvinciaType">
    <xs:restriction base="xs:string">
      <xs:pattern value="[A-Z]{2}" />
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="NazioneType">
    <xs:restriction base="xs:string">
      <xs:pattern value="[A-Z]{2}" />
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="DivisaType">
    <xs:restriction base="xs:string">
      <xs:pattern value="[A-Z]{3}" />
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="TipoResaType">
    <xs:restriction base="xs:string">
      <xs:pattern value="[A-Z]{3}" />
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="NumeroCivicoType">
    <xs:restriction base="xs:normalizedString">
      <xs:pattern value="(\p{IsBasicLatin}{1,8})" />
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="BolloVirtualeType">
    <xs:restriction base="xs:string">
      <xs:enumeration value="SI" />
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="TelFaxType">
    <xs:restriction base="xs:normalizedString">
      <xs:pattern value="(\p{IsBasicLatin}{5,12})" />
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="EmailType">
    <xs:restriction base="xs:string">
      <xs:minLength value="7" />
      <xs:maxLength value="256" />
      <xs:pattern value=".+@.+[.]+.+" />
    </xs:restriction>
  </xs:simpleType>
  <!--________________ NUMBERS ____________________-->
  <xs:simpleType name="PesoType">
    <xs:restriction base="xs:decimal">
      <xs:pattern value="[0-9]{1,4}\.[0-9]{1,2}" />
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="Amount8DecimalType">
    <xs:restriction base="xs:decimal">
      <xs:pattern value="[\-]?[0-9]{1,11}\.[0-9]{2,8}" />
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="Amount2DecimalType">
    <xs:restriction base="xs:decimal">
      <xs:pattern value="[\-]?[0-9]{1,11}\.[0-9]{2}" />
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="RateType">
    <xs:restriction base="xs:decimal">
      <xs:maxInclusive value="100.00" />
      <xs:pattern value="[0-9]{1,3}\.[0-9]{2}" />
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="RiferimentoFaseType">
    <xs:restriction base="xs:integer">
      <xs:minInclusive value="1" />
      <xs:maxInclusive value="999" />
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="NumeroColliType">
    <xs:restriction base="xs:integer">
      <xs:minInclusive value="1" />
      <xs:maxInclusive value="9999" />
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="NumeroLineaType">
    <xs:restriction base="xs:integer">
      <xs:minInclusive value="1" />
      <xs:maxInclusive value="9999" />
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="CAPType">
    <xs:restriction base="xs:string">
      <xs:pattern value="[0-9][0-9][0-9][0-9][0-9]" />
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="ABIType">
    <xs:restriction base="xs:string">
      <xs:pattern value="[0-9][0-9][0-9][0-9][0-9]" />
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="CABType">
    <xs:restriction base="xs:string">
      <xs:pattern value="[0-9][0-9][0-9][0-9][0-9]" />
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="GiorniTerminePagamentoType">
    <xs:restriction base="xs:integer">
      <xs:minInclusive value="0" />
      <xs:maxInclusive value="999" />
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="QuantitaType">
    <xs:restriction base="xs:decimal">
      <xs:pattern value="[0-9]{1,12}\.[0-9]{2,8}" />
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="DataFatturaType">
    <xs:restriction base="xs:date">
      <xs:minInclusive value="1970-01-01" />
    </xs:restriction>
  </xs:simpleType>
</xs:schema>