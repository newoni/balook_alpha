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
@Table(name="CHAT")
@SequenceGenerator(
        name="CHAT_SEQ_GEN",
        sequenceName="CHAT_SEQ",
        initialValue=1,
        allocationSize=1
)
public class Chat {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE,
            generator="CHAT_SEQ_GEN")
    private Long id;

    private Long participant1;

    private Long participant2;

    private String filePath;
}
