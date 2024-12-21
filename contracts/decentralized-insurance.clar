(define-map policies
    principal
    (tuple
        (policy-id uint)
        (premium uint)
        (coverage uint)
        (trigger-event uint)
        (active bool)
    ))

(define-data-var next-policy-id uint u1)

;; Read-only function: Get policy details
(define-read-only (get-policy (policy-holder principal))
    (map-get? policies policy-holder)
)

;; Public function: Create a new insurance policy
(define-public (create-policy (premium uint) (coverage uint) (trigger-event uint))
    (begin
        (if (or (is-eq premium u0) (is-eq coverage u0) (is-eq trigger-event u0))
            (err u1000) ;; Error code for invalid input
            (let (
                (policy-id (var-get next-policy-id))
            )
                (begin
                    (map-set policies tx-sender 
                        {
                            policy-id: policy-id, 
                            premium: premium, 
                            coverage: coverage, 
                            trigger-event: trigger-event, 
                            active: true
                        }
                    )
                    (var-set next-policy-id (+ policy-id u1))
                    (print {event: "policy-created", policy-id: policy-id, sender: tx-sender})
                    (ok policy-id)
                )
            )
        )
    )
)
