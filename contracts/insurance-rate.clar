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