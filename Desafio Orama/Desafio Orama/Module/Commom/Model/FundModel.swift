//
//  HomeInteractor.swift
//  Desafio Orama
//
//  Created by THIAGO on 03/10/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.

import Foundation

typealias FundModel = [FundModelElement]

// MARK: - FundModelElement
struct FundModelElement: Codable {
    let initialDate: String
    let performanceAudios: [PerformanceAudio]
    let descriptionSEO: String
    let operability: Operability
    let fullName: String
    let fees: Fees
    let id: Int
    let isClosed: Bool
    let simpleName: String
    let targetFund: JSONNull?
    let documents: [Document]
    let specification: Specification
    let isActive: Bool
    let taxClassification: TaxClassification
    let cnpj: String
    let fundModelDescription: Description
    let performanceVideos: [Video]
    let quotaDate: String
    let benchmark: Benchmark
    let oramaStandard: Bool
    let slug: String
    let volatility12M: String?
    let strategyVideo: Video?
    let profitabilities: Profitabilities
    let closedToCaptureExplanation: String
    let netPatrimony12M: String?
    let isClosedToCapture: Bool
    let fundManager: FundManager

    enum CodingKeys: String, CodingKey {
        case initialDate = "initial_date"
        case performanceAudios = "performance_audios"
        case descriptionSEO = "description_seo"
        case operability
        case fullName = "full_name"
        case fees, id
        case isClosed = "is_closed"
        case simpleName = "simple_name"
        case targetFund = "target_fund"
        case documents, specification
        case isActive = "is_active"
        case taxClassification = "tax_classification"
        case cnpj
        case fundModelDescription = "description"
        case performanceVideos = "performance_videos"
        case quotaDate = "quota_date"
        case benchmark
        case oramaStandard = "orama_standard"
        case slug
        case volatility12M = "volatility_12m"
        case strategyVideo = "strategy_video"
        case profitabilities
        case closedToCaptureExplanation = "closed_to_capture_explanation"
        case netPatrimony12M = "net_patrimony_12m"
        case isClosedToCapture = "is_closed_to_capture"
        case fundManager = "fund_manager"
    }
}

// MARK: - Benchmark
struct Benchmark: Codable {
    let id: Int
    let name: String
}

// MARK: - Document
struct Document: Codable {
    let position: Int
    let documentType: String
    let name: DocumentName
    let documentURL: String

    enum CodingKeys: String, CodingKey {
        case position
        case documentType = "document_type"
        case name
        case documentURL = "document_url"
    }
}

enum DocumentName: String, Codable {
    case apresentação = "Apresentação"
    case apresentaçãoDoFundo = "Apresentação do Fundo"
    case assembleiaGeralDeCotistas = "Assembleia Geral de Cotistas"
    case ataAssembléia = "Ata Assembléia"
    case ataDaAssembleia = "Ata da Assembleia"
    case ataDaAssembléia = "Ata da Assembléia"
    case ataDeAssembleia = "Ata de Assembleia"
    case cartaDoGestor = "Carta do Gestor"
    case cartaMensal = "Carta Mensal"
    case cartaTrimestral = "Carta Trimestral"
    case comunicado = "Comunicado"
    case consultaFormal = "Consulta Formal"
    case convocação = "Convocação"
    case convocaçãoDaAssembléia = "Convocação da Assembléia"
    case convocaçãoDeAssembleia = "Convocação de Assembleia"
    case convocaçãoDeAssembléia = "Convocação de Assembléia"
    case ddf = "DDF"
    case demonstrativoDeDesempenhoDoFundo = "Demonstrativo de Desempenho do Fundo"
    case demonstraçãoDeDesempenho = "Demonstração de Desempenho"
    case demonstraçãoDeDesempenhoDoFundo = "Demonstração de Desempenho do Fundo"
    case demonstraçãoDeDesempenhoFinanceiro = "Demonstração de Desempenho Financeiro"
    case demonstraçãoDeResultado = "Demonstração de Resultado"
    case demonstraçõesDeDesempenhoFinanceiro = "Demonstrações de Desempenho Financeiro"
    case fatoRelevante = "Fato Relevante"
    case fomululárioDeInformaçõesComplementares = "Fomululário de Informações Complementares"
    case formulárioDeInformaçõesComplementares = "Formulário de Informações Complementares"
    case fromulárioDeInformaçõesComplementares = "Fromulário de Informações Complementares"
    case lamina = "Lamina"
    case lâmina = "Lâmina"
    case materialDeDistribuição = "Material de Distribuição"
    case nameFormulárioDeInformaçõesComplementares = "Formulário de informações Complementares"
    case regulamento = "Regulamento"
}

// MARK: - Fees
struct Fees: Codable {
    let maximumAdministrationFee, anticipatedRetrievalFeeValue, administrationFee, anticipatedRetrievalFee: String
    let performanceFee: String
    let hasAnticipatedRetrieval: Bool

    enum CodingKeys: String, CodingKey {
        case maximumAdministrationFee = "maximum_administration_fee"
        case anticipatedRetrievalFeeValue = "anticipated_retrieval_fee_value"
        case administrationFee = "administration_fee"
        case anticipatedRetrievalFee = "anticipated_retrieval_fee"
        case performanceFee = "performance_fee"
        case hasAnticipatedRetrieval = "has_anticipated_retrieval"
    }
}

// MARK: - FundManager
struct FundManager: Codable {
    let fundManagerDescription: String
    let id: Int
    let fullName, logo, slug, name: String

    enum CodingKeys: String, CodingKey {
        case fundManagerDescription = "description"
        case id
        case fullName = "full_name"
        case logo, slug, name
    }
}

// MARK: - Description
struct Description: Codable {
    let objective: String
    let movieURL: String?
    let targetAudience, strengths, strategy: String

    enum CodingKeys: String, CodingKey {
        case objective
        case movieURL = "movie_url"
        case targetAudience = "target_audience"
        case strengths, strategy
    }
}

// MARK: - Operability
struct Operability: Codable {
    let hasOperationsOnThursdays: Bool
    let retrievalLiquidationDaysType, applicationQuotationDaysType: AtionDaysType
    let retrievalQuotationDays: Int
    let anticipatedRetrievalQuotationDaysStr: AnticipatedRetrievalQuotationDaysStr
    let retrievalQuotationDaysType: AtionDaysType
    let anticipatedRetrievalQuotationDays: Int
    let hasOperationsOnWednesdays: Bool
    let minimumBalancePermanence: String
    let hasOperationsOnTuesdays: Bool
    let minimumInitialApplicationAmount, applicationTimeLimit: String
    let hasOperationsOnMondays: Bool
    let retrievalTimeLimit: String
    let hasOperationsOnFridays: Bool
    let retrievalSpecialType, applicationQuotationDaysStr, retrievalQuotationDaysStr: String
    let retrievalLiquidationDaysStr: RetrievalLiquidationDaysStr
    let minimumSubsequentRetrievalAmount: String
    let retrievalLiquidationDays, applicationQuotationDays: Int
    let anticipatedRetrievalQuotationDaysType: AtionDaysType
    let maximumInitialApplicationAmount, minimumSubsequentApplicationAmount: String

    enum CodingKeys: String, CodingKey {
        case hasOperationsOnThursdays = "has_operations_on_thursdays"
        case retrievalLiquidationDaysType = "retrieval_liquidation_days_type"
        case applicationQuotationDaysType = "application_quotation_days_type"
        case retrievalQuotationDays = "retrieval_quotation_days"
        case anticipatedRetrievalQuotationDaysStr = "anticipated_retrieval_quotation_days_str"
        case retrievalQuotationDaysType = "retrieval_quotation_days_type"
        case anticipatedRetrievalQuotationDays = "anticipated_retrieval_quotation_days"
        case hasOperationsOnWednesdays = "has_operations_on_wednesdays"
        case minimumBalancePermanence = "minimum_balance_permanence"
        case hasOperationsOnTuesdays = "has_operations_on_tuesdays"
        case minimumInitialApplicationAmount = "minimum_initial_application_amount"
        case applicationTimeLimit = "application_time_limit"
        case hasOperationsOnMondays = "has_operations_on_mondays"
        case retrievalTimeLimit = "retrieval_time_limit"
        case hasOperationsOnFridays = "has_operations_on_fridays"
        case retrievalSpecialType = "retrieval_special_type"
        case applicationQuotationDaysStr = "application_quotation_days_str"
        case retrievalQuotationDaysStr = "retrieval_quotation_days_str"
        case retrievalLiquidationDaysStr = "retrieval_liquidation_days_str"
        case minimumSubsequentRetrievalAmount = "minimum_subsequent_retrieval_amount"
        case retrievalLiquidationDays = "retrieval_liquidation_days"
        case applicationQuotationDays = "application_quotation_days"
        case anticipatedRetrievalQuotationDaysType = "anticipated_retrieval_quotation_days_type"
        case maximumInitialApplicationAmount = "maximum_initial_application_amount"
        case minimumSubsequentApplicationAmount = "minimum_subsequent_application_amount"
    }
}

enum AnticipatedRetrievalQuotationDaysStr: String, Codable {
    case d0 = "D+0"
    case d1 = "D+1"
    case d10 = "D+10"
    case d15 = "D+15"
    case d15DiasÚteis = "D+15 (dias úteis)"
    case d15Úteis = "D+15 (úteis)"
    case d3 = "D+3"
    case d3DiasÚteis = "D+3 (dias úteis)"
    case d4 = "D+4"
    case d5 = "D+5"
    case d5DiasÚteis = "D+5 (dias úteis)"
    case nãoHá = "Não há"
}

enum AtionDaysType: String, Codable {
    case corridos = "corridos"
    case úteis = "úteis"
}

enum RetrievalLiquidationDaysStr: String, Codable {
    case d0 = "D+0"
    case d0DaDataDeConversãoDeResgate = "D+0 da data de conversão de resgate"
    case d1 = "D+1"
    case d1DaDataDeConversãoDeResgate = "D+1 da data de conversão de resgate"
    case d1DepoisDaConversão = "D+1 depois da conversão"
    case d2 = "D+2"
    case d2DiasÚteisDaDataDeConversãoDeResgate = "D+2 (dias úteis) da data de conversão de resgate"
    case d3 = "D+3"
    case d3ConsiderandoAsLocalidadesPresentesNoRegulamento = "D+3 (considerando as localidades presentes no regulamento)"
    case d3DaDataDeConversãoDeResgate = "D+3 da data de conversão de resgate"
    case d3DiasÚteisDaDataDeConversãoDeResgate = "D+3 (dias úteis) da data de conversão de resgate"
    case d4 = "D+4"
    case d4DiasÚteis = "D+4 (dias úteis)"
    case d5 = "D+5"
}

// MARK: - PerformanceAudio
struct PerformanceAudio: Codable {
    let referenceDate, soundcloudID: String
    let permalinkURL: String
    let id: Int
    let title: String

    enum CodingKeys: String, CodingKey {
        case referenceDate = "reference_date"
        case soundcloudID = "soundcloud_id"
        case permalinkURL = "permalink_url"
        case id, title
    }
}

// MARK: - Video
struct Video: Codable {
    let videoDescription, title: String
    let url: String
    let published: String?
    let id: Int
    let enabledForTvorama: Bool
    let youtubeID: String
    let thumbnail: String?

    enum CodingKeys: String, CodingKey {
        case videoDescription = "description"
        case title, url, published, id
        case enabledForTvorama = "enabled_for_tvorama"
        case youtubeID = "youtube_id"
        case thumbnail
    }
}

// MARK: - Profitabilities
struct Profitabilities: Codable {
    let m60, m48, m24, m36: String?
    let month, m12, year, day: String?
}

// MARK: - Specification
struct Specification: Codable {
    let fundSuitabilityProfile, fundRiskProfile: FundProfile
    let isQualified: Bool
    let fundType: FundType
    let fundClass: String
    let fundMacroStrategy, fundMainStrategy: FundMaStrategy

    enum CodingKeys: String, CodingKey {
        case fundSuitabilityProfile = "fund_suitability_profile"
        case fundRiskProfile = "fund_risk_profile"
        case isQualified = "is_qualified"
        case fundType = "fund_type"
        case fundClass = "fund_class"
        case fundMacroStrategy = "fund_macro_strategy"
        case fundMainStrategy = "fund_main_strategy"
    }
}

// MARK: - FundMaStrategy
struct FundMaStrategy: Codable {
    let explanation: String
    let id: Int
    let name: String
    let fundMacroStrategy: Int?

    enum CodingKeys: String, CodingKey {
        case explanation, id, name
        case fundMacroStrategy = "fund_macro_strategy"
    }
}

// MARK: - FundProfile
struct FundProfile: Codable {
    let scoreRangeOrder: Int
    let name: FundRiskProfileName

    enum CodingKeys: String, CodingKey {
        case scoreRangeOrder = "score_range_order"
        case name
    }
}

enum FundRiskProfileName: String, Codable {
    case conservador = "Conservador"
    case experiente = "Experiente"
    case moderado = "Moderado"
    case réguaDeRisco1 = "Régua de risco 1"
    case réguaDeRisco10 = "Régua de risco 10"
    case réguaDeRisco11 = "Régua de risco 11"
    case réguaDeRisco12 = "Régua de risco 12"
    case réguaDeRisco2 = "Régua de risco 2"
    case réguaDeRisco3 = "Régua de risco 3"
    case réguaDeRisco4 = "Régua de risco 4"
    case réguaDeRisco5 = "Régua de risco 5"
    case réguaDeRisco6 = "Régua de risco 6"
    case réguaDeRisco7 = "Régua de risco 7"
    case réguaDeRisco8 = "Régua de risco 8"
    case réguaDeRisco9 = "Régua de risco 9"
}

enum FundType: String, Codable {
    case ações = "Ações"
    case cambial = "Cambial"
    case direitoCreditório = "Direito Creditório"
    case multimercado = "Multimercado"
    case referenciado = "Referenciado"
    case rendaFixa = "Renda Fixa"
}

enum TaxClassification: String, Codable {
    case ações = "Ações"
    case isento = "Isento"
    case longoPrazo = "Longo prazo"
}


// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

