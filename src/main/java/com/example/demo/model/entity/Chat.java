package com.example.demo.model.entity;

import lombok.*;
import lombok.experimental.Accessors;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.SecondaryTable;
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
@Table(name="CHAT")
public class Chat {
    @Id
    private Long id;

    private Long participant1;

    private Long participant2;

    private String filePath;
}
