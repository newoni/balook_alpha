package com.example.demo.model.entity;

import lombok.*;
import lombok.experimental.Accessors;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Builder
@Accessors
@Getter
@Setter
@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Table(name="FEEDBACK")
public class Feedback {
    @Id
    private Long id;

    private Long requestBy;

    private Long targetBoard;

    private Long requestTo;

    private String status;

    private String contents;
}
