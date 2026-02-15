;; title: insurance-rate
;; version:
;; summary:
;; description:

;; traits
;; title: guardstack
;; version:
;; summary:
;; description:

;; Decentralized Insurance Smart Contract
;; Implements advanced insurance functionality with multi-tier policies, staking, and risk assessment

;; Error codes
(define-constant ERR-UNAUTHORIZED (err u1))
(define-constant ERR-NO-POLICY-EXISTS (err u2))
(define-constant ERR-FUNDS-INSUFFICIENT (err u3))
(define-constant ERR-INVALID-PARAMETERS (err u4))
(define-constant ERR-POLICY-TERMINATED (err u5))
(define-constant ERR-DUPLICATE-CLAIM (err u6))
(define-constant ERR-INVALID-CLAIM-DATA (err u7))
(define-constant ERR-STAKE-TOO-LOW (err u8))
(define-constant ERR-COOLDOWN-ACTIVE (err u9))
(define-constant ERR-RISK-SCORE-HIGH (err u10))
(define-constant ERR-MAX-COVERAGE-EXCEEDED (err u11))

;; Constants
(define-constant RISK-THRESHOLD u75)
(define-constant MIN-STAKE-AMOUNT u1000000)
(define-constant CLAIM-COOLDOWN-PERIOD u144) ;; ~1 day in blocks
(define-constant MAX-COVERAGE-MULTIPLIER u5)

;; Data variables
(define-data-var reserve-pool uint u0)
(define-data-var stake-pool uint u0)
(define-data-var protocol-owner principal tx-sender)
(define-data-var base-premium uint u1000000)
(define-data-var claim-ceiling uint u100000000)
(define-data-var total-policies uint u0)
(define-data-var total-active-claims uint u0)

;; Policy tiers
(define-map policy-tiers
  uint
  {
    name: (string-ascii 20),
    coverage-multiplier: uint,
    premium-discount: uint,
    min-stake: uint,
  }
)

;; Policy structure
(define-map insurance-policies
  principal
  {
    tier: uint,
    premium-paid: uint,
    coverage-limit: uint,
    stake-amount: uint,
    start-block: uint,
    expiry-block: uint,
    risk-score: uint,
    claims-made: uint,
    status: (string-ascii 10),
    last-claim-block: uint,
  }
)

;; Claims structure
(define-map insurance-claims
  {
    policyholder: principal,
    claim-id: uint,
  }
  {
    amount-requested: uint,
    evidence-hash: (buff 32),
    timestamp: uint,
    assessor: principal,
    verdict: (string-ascii 20),
    payout-amount: uint,
    category: (string-ascii 30),
  }
)

;; Staking and rewards
(define-map staker-info
  principal
  {
    amount: uint,
    rewards: uint,
    lock-period: uint,
    last-reward-block: uint,
  }
)