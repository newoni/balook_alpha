package com.example.demo.model.entity;

import lombok.*;
import lombok.experimental.Accessors;

import javax.persistence.*;
import java.time.LocalDate;

@Data
@Entity
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Accessors(chain=true)
@Table(name = "CUSTOMER")
public class Customer {

//    @GeneratedValue(strategy = GenerationType.IDENTITY) // not 4 oracle
    @Id
    private Long id;
    private String customerId;
    private String password;
    private String nickName;
    private String picturePath;
    private String name;
    private String eMail;
    private String phoneNumber;
    private String status;
    private LocalDate registeredAt;
    private LocalDate unregisteredAt;
    private LocalDate createdAt;
    private String createdBy;
    private LocalDate updatedAt;
    private String updatedBy;
    private LocalDate passwordUpdatedAt;
    private LocalDate lastLoginAt;
}
