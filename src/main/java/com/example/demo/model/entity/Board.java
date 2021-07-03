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
@Accessors(chain = true)
@Table(name="BOARD")
@SequenceGenerator(
        name="BOARD_SEQ_GEN",
        sequenceName="BOARD_SEQ",
        initialValue=3,
        allocationSize=1
)
public class Board{
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "BOARD_SEQ_GEN")
    Long id;
    String title;
    Long author;
    String filePath;
    String contents;
    LocalDate boardedAt;
    LocalDate updatedAt;
}
