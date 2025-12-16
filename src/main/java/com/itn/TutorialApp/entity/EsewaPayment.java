package com.itn.TutorialApp.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serial;
import java.io.Serializable;

@Entity
@Table(name="esewa_payment")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class EsewaPayment implements Serializable {
    @Serial
    private static final long serialVersionUID=1211L;
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="transaction_id")
    private Long id;
    private Long amount;
    private Long taxAmount;
    private Long totalAmount;
    @Column(name="transaction_uuid", unique=true)
    private String transactionUUID;
    private String productCode;
    private Long productServiceCharge;
    private Long productDeliveryCharge;
    private String successURL;
    private String failureURL;
    private String signedFieldNames;
    private String signature;
    @OneToOne(mappedBy = "esewaPayment")
    private Enrollment enrollment;





}
