package com.example.demo.model.entity;

import lombok.*;
import lombok.experimental.Accessors;

import javax.persistence.*;

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
@SequenceGenerator(
        name="FEEDBACK_SEQ_GEN",
        sequenceName="FEEDBACK_SEQ",
        initialValue = 1,
        allocationSize=1
)
public class Feedback {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE,
            generator="FEEDBACK_SEQ_GEN")
    private Long id;

    private Long requestBy;

    private Long targetBoard;

    private Long requestTo;

    private String status;

    private String contents;
}
